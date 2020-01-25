pipeline {
         agent any
         stages {
                 stage('Build') {
                 steps {
                     dotnet run
                     echo 'This is the build stage'
                 }
                 }
                 stage('Test') {
                 steps {
                    input('Unit Testing')
                 }
                 }
                 stage('Deploy') {
                 steps {
                    input('Unit Testing')
                 }
                 }

              }
}
