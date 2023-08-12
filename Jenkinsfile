pipeline {
    agent any
    triggers{
       pollSCM('*/1 * * * *') 
    }
    environment {
        DOCKER_PASSWORD = credentials('docker-password')
        DOCKER_USERNAME = credentials('docker-username')
    }
    stages {
        stage('docker-build-test-base') {
            when {
                anyOf {
                    changeset 'Gemfile'
                    changeset 'Dockerfile.base'
                    changeset 'Jenkinsfile'
                }
            }
            steps {
                buildDockerImage("ataurins/api-tests-base:latest", "Dockerfile.base")
                // echo 'Building base image for api-tests..'
                // sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                // sh "docker build --no-cache -t ataurins/api-tests-base:latest . -f Dockerfile.base"
                // sh "docker push ataurins/api-tests-base:latest"
            }
        }
        stage('docker-build-test-runner') {
            steps {
                buildDockerImage("ataurins/api-tests-runner:latest", "Dockerfile.runner")
                // echo 'Building runner image for api-tests'
                // sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                // sh "docker build --no-cache -t ataurins/api-tests-runner:latest . -f Dockerfile.runner"
                // sh "docker push ataurins/api-tests-base:latest"
            }
        }
    }
}

def buildDockerImage(String tag, String dockerfile) {
    echo "Building ${tag} image for api-tests based on ${dockerfile}"
    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
    sh "docker build --no-cache -t ${tag} . -f ${dockerfile}"
    sh "docker push ${tag}"
}