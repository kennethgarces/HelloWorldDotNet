#!/bin/bash
echo "Enter step one"
read args1
echo "Enter step two"
read args2
echo "Enter step three"
read args3
echo "Enter step three"
read args4

cd /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld
echo "Process .NET pipeline has started!!!."
dotnet run $args1 $args2 $args3 $args4 >> ../../SampleOut-$(date +"%Y_%m_%d_%I_%M_%p").log
