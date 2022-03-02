using DigiProc.Models.Domain;
using System.Net;
using System.Net.Http.Json;

namespace DigiProc.Services
{
    public interface IItemCategoryService
    {
        public Task<bool> SaveItemCategory(ItemCategory itemCategory);

        public Task<List<ItemCategory>> GetItemCategoriesAsync();

    }

    public class ItemCategoryService : IItemCategoryService
    {
        private readonly HttpClient http;

        public ItemCategoryService(HttpClient _httpclient)
        {
            http = _httpclient;
        }

        public async Task<bool> SaveItemCategory(ItemCategory itemCategory)
        {
            //sends object to the API to be persisted
            var result = await http.PostAsJsonAsync("api/ItemCategories",itemCategory);
            return await result.Content.ReadFromJsonAsync<bool>();
        }

        public async Task<List<ItemCategory>> GetItemCategoriesAsync()
        {
            //implementation gets all item categories by calling an API
            var result = await http.GetFromJsonAsync<List<ItemCategory>>("api/ItemCategories");
            return result;
        }

    }

}
