using System;

namespace DotNetHelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            var i = 0;
            foreach (var arg in args)
            {
                i=i+1;
                Console.WriteLine($"Pipeline step {i} is {arg}");
            }
            Console.WriteLine("Hello World!!!!");
            
        }
    }
}
