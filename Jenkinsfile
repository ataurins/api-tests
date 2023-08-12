pipeline {
    agent any
    triggers{
       pollSCM('*/1 * * * *') 
    }
    stages {
        stage('docker-build-test-base') {
            when {
                anyOf {
                    changeSet 'Gemfile'
                    changeSet 'Dockerfile.base'
                }
            }
            steps {
                echo 'Building base image for api-tests..'
                sh "docker build --no-cache -t ataurins/api-tests-base . -f Dockerfile.base"
            }
        }
        stage('docker-build-test-runner') {
            steps {
                echo 'Building runner image for api-tests'
                sh "docker build --no-cache -t ataurins/api-tests-runner . -f Dockerfile.runner"
            }
        }
    }
}