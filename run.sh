#!/bin/bash

cd /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld
echo "Process .NET pipeline has started!!!."
dotnet run build unit test deploy
#dotnet run $args1 $args2 $args3 $args4 >> SampleOut-$(date +"%Y_%m_%d_%I_%M_%p").log
