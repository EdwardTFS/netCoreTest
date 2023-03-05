

using System;

namespace netCoreTest
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World! COMP:{0} OS:{1}", Environment.MachineName, Environment.OSVersion.VersionString);
        }
    }
}
