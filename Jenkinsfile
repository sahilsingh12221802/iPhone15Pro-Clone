pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo "🔍 Checking out code from GitHub..."
                checkout scm
            }
        }

        stage('Install & Build') {
            steps {
                echo "📦 Installing dependencies..."
                sh 'npm install'
                
                echo "🏗️ Building React app..."
                sh 'npm run build'
            }
        }

        stage('Deploy') {
            steps {
                echo "🚀 Deploying container..."
                sh '''
                docker build -t iphone-clone .
                docker run -d -p 3000:80 iphone-clone
                '''
            }
        }
    }

    post {
        success {
            echo "🎉 Success! App running at http://localhost:3000"
        }
        failure {
            echo "❌ Build failed - check logs above"
        }
    }
}