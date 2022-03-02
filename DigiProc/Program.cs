using DigiProc;
using Blazorise;
using Blazorise.Bootstrap;
using Blazorise.Icons.FontAwesome;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using DigiProc.Services;

var builder = WebAssemblyHostBuilder.CreateDefault(args);

#region edited code

builder.Services
      .AddBlazorise(options =>
      {
          options.ChangeTextOnKeyPress = true;
      })
      .AddBootstrapProviders()
      .AddFontAwesomeIcons();

//builder.Services.AddSingleton(new HttpClient
//{
//    BaseAddress = new Uri("https://localhost:7073/")
//});

#endregion

builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

//setting up URI for API calls
string baseAPIAddress = builder.Configuration["BaseApiUrl"].ToString();
builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(baseAPIAddress) });
//builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });

builder.Services.AddScoped<IItemCategoryService, ItemCategoryService>();

await builder.Build().RunAsync();
