#!/bin/bash

cd /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld
echo "Process .NET pipeline has started!!!."
dotnet restore
dotnet build
dotnet run build unit test deploy

