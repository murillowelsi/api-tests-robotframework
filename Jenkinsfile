pipeline {
    agent {
        docker {
            image "murillowelsi/pyhton3"
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
                sh 'pwd'
                sh 'robot -v'
                sh 'robot .'
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
