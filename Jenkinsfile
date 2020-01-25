pipeline {
         agent any
         stages {
                 stage('Build') {
                 steps {
                     echo 'This is the build stage'
                 }
                 }
                 stage('Test') {
                 steps {
                    input('Unit Testing')
                 }
                 }
                 stage('Deploy') {
                 when {
                       not {
                            branch "master"
                            echo "Not master branch"
                       }
                 }
                 steps {
                       echo "Master branch"
                 }
                 }

              }
}
