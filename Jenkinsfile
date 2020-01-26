pipeline {
         agent any
         stages {
                 stage('Build') {
                 steps {
                     bash '''#!/bin/bash
                           echo "hello world" 
                     '''
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
