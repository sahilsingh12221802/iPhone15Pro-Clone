pipeline {
    agent {
        docker {
            image 'node:18-alpine'  // Pre-installed Node.js environment
            args '-v /var/run/docker.sock:/var/run/docker.sock'  // Allows Docker-in-Docker
        }
    }

    environment {
        DOCKER_IMAGE = "iphone-clone-react"
        DOCKER_TAG = "latest"
        CONTAINER_PORT = "3000"
        HOST_PORT = "80"
    }

    stages {
        // Stage 1: Checkout code from GitHub
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        // Stage 2: Install dependencies
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        // Stage 3: Build React app
        stage('Build React App') {
            steps {
                sh 'npm run build'
            }
        }

        // Stage 4: Build Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        // Stage 5: Deploy container
        stage('Deploy') {
            steps {
                script {
                    // Stop and remove old container if exists
                    sh "docker stop ${DOCKER_IMAGE} || true"
                    sh "docker rm ${DOCKER_IMAGE} || true"
                    // Run new container
                    sh "docker run -d -p ${HOST_PORT}:${CONTAINER_PORT} --name ${DOCKER_IMAGE} ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }

    post {
        success {
            echo '🚀 Pipeline succeeded! App is running.'
            echo "Access your app at: http://localhost:${HOST_PORT}"
        }
        failure {
            echo '❌ Pipeline failed. Check the logs above.'
        }
    }
}