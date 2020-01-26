#!/bin/bash
$args1=('build')
$args2=('unit')
$args3=('test')
$args4=('deploy')

cd /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld
echo "Process .NET pipeline has started!!!."
dotnet build
dotnet run $args1 $args2 $args3 $args4

