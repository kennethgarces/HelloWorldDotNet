environment {
   HOME = '/tmp'
} 

pipeline {
         agent any
         stages {
                 stage('Build') {
                 steps {
                     
                     //sh 'dotnet build /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/DotNetHelloWorld.csproj'
                     input('Perform Build')
                        
                     
                 }
                 }
                 stage('Unit') {
                 steps {
                    input('Perform Unit Testing')
                 }
                 }
                 stage('Test') {
                 steps {
                    input('Deploy to Test')
                 }
                 }
                  stage('Deploy') {
                 steps {
                    input('Deploy to Prod')
                 }
                 }

              }
}
