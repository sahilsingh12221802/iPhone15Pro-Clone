pipeline {
    agent any

    stages {
        stage('Setup Environment') {
            steps {
                sh '''#!/bin/bash
                # Auto-install Node.js if missing (works on Mac/Linux)
                if ! command -v node &> /dev/null; then
                    echo "Installing Node.js..."
                    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
                    sudo apt-get install -y nodejs
                fi
                
                # Verify Docker (must be pre-installed)
                docker --version || (echo "ERROR: Docker not found. Please install Docker first." && exit 1)
                '''
            }
        }

        stage('Build React App') {
            steps {
                sh '''
                npm install
                npm run build
                '''
            }
        }

        stage('Deploy with Docker') {
            steps {
                sh '''
                docker build -t iphone-clone .
                docker stop iphone-clone || true
                docker rm iphone-clone || true
                docker run -d -p 3000:80 --name iphone-clone iphone-clone
                '''
            }
        }
    }

    post {
        success {
            echo "🎉 Success! Your app is running at http://localhost:3000"
        }
        failure {
            echo "❌ Failed! Check the logs above for errors"
        }
    }
}