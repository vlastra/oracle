//
using System;
using Oracle.ManagedDataAccess.Client;
namespace myOracleDB
{
    class Program
    {
        static string conString = "User Id=admin;Password=DBaaS12345_#;Data Source=freedb_tp";
        static void Main(string[] args)
        {
            using (OracleConnection con = new OracleConnection(conString))
            {
                using (OracleCommand cmd = con.CreateCommand())
                {
                    try
                    {
                        OracleConfiguration.TnsAdmin = @"<>"; //full path to directory where is tnsnames.ora
                        OracleConfiguration.WalletLocation = @"<>"; //full path to directory where is unzipped Cloud Wallet
                        con.Open();
                        Console.WriteLine("Successfully connected to Oracle Autonomous Database");
                        cmd.CommandText = "select prod_name from sh.products";

                        OracleDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            Console.WriteLine("prod_name: {0}", reader.GetString(0));
                        }
                        reader.Dispose();
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    Console.ReadLine();
                }
            }
        }
    }
}

