pipeline {
    agent any
    
    stages {
        stage('Deploy Container') {
            steps {
                sh '''
                # Stop and remove old container if exists
                docker stop clever_kilby || true
                docker rm clever_kilby || true
                
                # Run new container
                docker run -d \
                   --name clever_kilby \
                   -p 3000:80 \
                   iphone-clone-react:latest
                '''
            }
        }
        
        stage('Verify') {
            steps {
                echo "🎉 Deployment complete!"
                echo "Access your app at: http://localhost:3000"
            }
        }
    }
}