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
                sh 'cd /var/jenkins_home/workspace/robot-api-tests && robot -d ./resullts/ .'
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
