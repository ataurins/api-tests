pipeline {
    agent any
    triggers{
       pollSCM('*/1 * * * *') 
    }
    stages {
        stage('docker-build-test-base') {
            when {
                anyOf {
                    changeset 'Gemfile'
                    changeset 'Dockerfile.base'
                }
            }
            steps {
                echo 'Building base image for api-tests..'
                sh "docker build --no-cache -t ataurins/api-tests-base:latest . -f Dockerfile.base"
                sh "docker push ataurins/api-tests-base:latest"
            }
        }
        stage('docker-build-test-runner') {
            steps {
                echo 'Building runner image for api-tests'
                sh "docker build --no-cache -t ataurins/api-tests-runner:latest . -f Dockerfile.runner"
                sh "docker push ataurins/api-tests-base:latest"
            }
        }
    }
}