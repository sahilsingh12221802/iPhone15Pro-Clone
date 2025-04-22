pipeline {
    agent any

    stages {
        stage('Checkout Git') {
            steps {
                git branch: 'master', url: 'https://github.com/sahilsingh12221802/iPhone15Pro-Clone'
            }
        }

        stage('Build React App') {
            steps {
                sh './build.sh'
            }
        }

        stage('Done') {
            steps {
                echo "🎉 Building process done Successfully"
            }
        }
    }
}