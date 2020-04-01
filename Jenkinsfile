pipeline {
    agent {
        docker {
            image "robotframework/rfdocker"
        }
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building and resolving dependencies!'
            }
        }
        stage('Test') {
            steps {
                echo 'Running regression tests!'
                sh 'robot -d ./results .'
            }
            post {
                always {
                   
                }
            }
        }
        stage('UAT') {
            steps {
                echo 'Wait for User Acceptance!'
                input(message: 'Go to production?', ok: 'Yes')
            }
        }
        stage('Prod') {
            steps {
                echo 'Webapp is Ready'
            }
        }
    }
}
