pipeline {
    agent any

    stages {
        stage('Checkout Git') {
            steps {
                git branch: 'master', url: 'https://github.com/sahilsingh12221802/iPhone15Pro-Clone'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build React App') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("iphone-clone-react")
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 3000:80 iphone-clone-react'
            }
        }
    }
}