pipeline {
         agent any
         stages {
                 stage('Build') {
                 steps {
                     
                     sh 'dotnet build /DotNetHelloWorld/DotNetHelloWorld/DotNetHelloWorld.csproj'
                        
                     
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
