pipeline {
         agent any
         stages {
                 stage('Build') {
                 steps {
                     
                     echo 'Build .NET'
                 }
                 }
                 stage('Unit') {
                 steps {
                    input('Perform Unit Testing')
                 }
                 }
                 stage('Test') {
                 steps {
                    input('Deployt to Test')
                 }
                 }
                  stage('Deploy') {
                 steps {
                    input('Deploy to Prod')
                 }
                 }

              }
}
