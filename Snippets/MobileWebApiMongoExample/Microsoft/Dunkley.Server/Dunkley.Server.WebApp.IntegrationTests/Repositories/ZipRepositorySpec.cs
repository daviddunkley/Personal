namespace Dunkley.Server.WebApp.IntegrationTests.Repositories
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using Machine.Specifications;

    public class when_creating_a_new_zip
    {
        Establish context = () =>
        {
        };

        Because of = () => Service.AddItemToQuote("shopId", Quote.Id, Item).Wait();

        It should_add_the_zip_to_the_repository = () => ItemRepository.Verify(x => x.Create("shopId", Quote.Id, Item), Times.Once);

        Cleanup after = () =>
            Repository.Delete(_shopIdentifier, _quoteId).Await();
    }
}
