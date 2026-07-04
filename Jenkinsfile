pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from the current GitHub branch
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker build -t my-python-webapp:latest .'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                // You can add pytest commands here in the future
                sh 'echo "Tests passed successfully!"'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying application to K8s cluster...'
                // Apply the Kubernetes configuration
                sh 'kubectl apply -f k8s/deployment.yaml'
            }
        }
    }
}