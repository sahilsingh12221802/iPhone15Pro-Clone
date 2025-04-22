pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "iphone15pro-clone"  // Your Docker image name
        DOCKER_TAG = "latest"
    }

    stages {
        // Stage 1: Checkout from GitHub
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/sahilsingh12221802/iPhone15Pro-Clone.git'
            }
        }

        // Stage 2: Install Node.js (if not using Docker agent)
        stage('Setup Node.js') {
            steps {
                script {
                    // Install Node.js automatically (if not pre-installed)
                    if (!isUnix()) {
                        bat 'choco install nodejs -y'  // Windows
                    } else {
                        sh '''
                        curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
                        sudo apt-get install -y nodejs
                        '''
                    }
                }
            }
        }

        // Stage 3: Install dependencies
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        // Stage 4: Build React app
        stage('Build React App') {
            steps {
                sh 'npm run build'
            }
        }

        // Stage 5: Build Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        // Stage 6: Deploy (run container)
        stage('Deploy') {
            steps {
                script {
                    // Stop old container if running
                    sh 'docker stop ${DOCKER_IMAGE} || true'
                    sh 'docker rm ${DOCKER_IMAGE} || true'
                    // Run new container
                    sh "docker run -d -p 3000:80 --name ${DOCKER_IMAGE} ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }

    // Post-build actions (optional)
    post {
        success {
            echo 'Pipeline succeeded! App deployed.'
        }
        failure {
            echo 'Pipeline failed. Check logs.'
        }
    }
}