pipeline {
         agent any
         stages {
                 stage('Build') {
                 steps {
                     
                     sh "#!/bin/bash \n" + 
                        "echo \"Executing run.sh from \$SHELL\"" 
                     sh "./run.sh"
                        
                     
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
