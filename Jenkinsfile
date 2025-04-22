pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                echo "📦 Installing project dependencies"
                sh 'npm install'
            }
        }

        stage('Build Project') {
            steps {
                echo "🔧 Building the project using Vite"
                sh 'npm run build'
            }
        }

        stage('Done') {
            steps {
                echo "🎉 Build process completed successfully"
            }
        }
    }
}
