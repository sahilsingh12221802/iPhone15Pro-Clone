pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            
            steps {
                echo "🚀 building process started"
                sh 'npm run build'
            }
        }
        stage('Done') {
            steps {
                echo "🎉 building process done"
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 3000:80 iphone-clone-react'
            }
        }
    }
}