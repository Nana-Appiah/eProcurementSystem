using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;
using DigiProc.Data.Data;


var CorsPolicy = @"CorsPolicy";
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Services.AddMvc(option => option.EnableEndpointRouting = false)
         .SetCompatibilityVersion(CompatibilityVersion.Latest)
         .AddNewtonsoftJson(opt => opt.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore);

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddCors(options =>
{
    options.AddPolicy(CorsPolicy,
                builder => builder.AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader()
                .SetPreflightMaxAge(TimeSpan.FromSeconds(5000))
                .SetIsOriginAllowed(x => true)
    );
});

builder.Services.AddDbContext<EprocurementdbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("PanamString"));
});

var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//app.UseHttpsRedirection();
app.UseRouting();

//useCors
app.UseCors(CorsPolicy);
System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);

app.UseAuthorization();

app.MapControllers();

app.Run();
