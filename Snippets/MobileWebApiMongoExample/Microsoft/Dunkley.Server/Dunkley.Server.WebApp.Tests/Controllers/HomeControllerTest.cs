using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Dunkley.Server.WebApp;
using Dunkley.Server.WebApp.Controllers;

namespace Dunkley.Server.WebApp.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Home Page", result.ViewBag.Title);
        }
    }
}
