using Dunkley.Server.WebApp.Models;

namespace Dunkley.Server.WebApp.Services
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public interface IZipService
    {
        Task<Zip> CreateZip(string id, string city, double population, string state, double longitude, double latitude);
        Task<Zip> RetrieveZip(string id);
        Task<IReadOnlyList<Zip>> RetrieveZips();
        Task<Zip> UpdateZip(
            string id,
            string city = null,
            double? population = null,
            string state = null,
            double? longitude = null,
            double? latitude = null);

        Task DeleteZip(string id);
    }
}
