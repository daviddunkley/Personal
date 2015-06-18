namespace Dunkley.Server.WebApp.Services
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Models;

    public class ZipService : IZipService
    {
        public Task<Zip> CreateZip(string id,
            string city,
            double population,
            string state,
            double longitude,
            double latitude)
        {
            throw new System.NotImplementedException();
        }

        public Task<Zip> RetrieveZip(string id)
        {
            throw new System.NotImplementedException();
        }

        public Task<IReadOnlyList<Zip>> RetrieveZips()
        {
            throw new System.NotImplementedException();
        }

        public Task<Zip> UpdateZip(
            string id,
            string city = null,
            double? population = null,
            string state = null,
            double? longitude = null,
            double? latitude = null)
        {
            throw new System.NotImplementedException();
        }

        public Task DeleteZip(string id)
        {
            throw new System.NotImplementedException();
        }
    }
}