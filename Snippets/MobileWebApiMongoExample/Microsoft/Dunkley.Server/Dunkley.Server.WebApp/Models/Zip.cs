namespace Dunkley.Server.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.Dynamic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class Zip
    {
        public string Id { get; set; }
        public string City { get; set; }
        public double Population { get; set; }
        public string State { get; set; }
        public Location Location { get; set; }
    }
}
