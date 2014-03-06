using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoPowered.CustomCheckouts.GoogleAuthCleanUp
{
    using System.Data;
    using System.Data.SqlClient;
    using System.Threading;

    class Program
    {
        private const string ConnectionString = "Data Source=tcp:h520r8lt51.database.windows.net,1433;Initial Catalog=MoPowered.CustomCheckouts-CD;User ID=CustomCheckoutUser@h520r8lt51;Password=nagezAfeqUPubRa2r7ch";

        static void Main(string[] args)
        {
            do
            {
                Console.WriteLine("Deleting OAuthMembership and Agent tables");

                using (var conn = new SqlConnection(ConnectionString))
                using (var command = new SqlCommand("DELETE FROM [dbo].[webpages_OAuthMembership]; DELETE FROM [dbo].[Agents];", conn)
                {
                    CommandType = CommandType.Text
                })
                {
                    conn.Open();
                    command.ExecuteNonQuery();
                    conn.Close();
                }
                Console.WriteLine("Deleted rows");

                Thread.Sleep(1000 * 60 * 10);
                
            } while (true);
        }
    }
}