pipeline {
         agent any
         stages {
                 stage('Build') {
                 steps {
                     node {
                        sh "#!/bin/bash \n" + 
                           "echo \"Hello from \$SHELL\""
                     }
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
