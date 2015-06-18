namespace Dunkley.Server.WebApp.Repositories
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Models;
    using MongoDB.Driver;

    public class ZipRepository : IZipRepository
    {
        static IMongoClient _client;
        static IMongoDatabase _database;

        public ZipRepository(IMongoClient client = null, IMongoDatabase database = null)
        {
            _client = client ?? new MongoClient();
            _database = database ?? _client.GetDatabase("test");
        }

        public async Task<Zip> CreateZip(string id, string city, double population, string state, double longitude, double latitude)
        {
            throw new System.NotImplementedException();
        }

        public async Task<Zip> RetrieveZip(string id)
        {
            throw new System.NotImplementedException();
        }

        public async Task<IReadOnlyList<Zip>> RetrieveZips()
        {
            throw new System.NotImplementedException();
        }

        public async Task<Zip> UpdateZip(string id, string city = null, double? population = null, string state = null, double? longitude = null, double? latitude = null)
        {
            throw new System.NotImplementedException();
        }

        public async Task DeleteZip(string id)
        {
            throw new System.NotImplementedException();
        }
    }
}