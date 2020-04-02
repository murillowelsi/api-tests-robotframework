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
                sh 'echo "*** Variables ***" >> ./resources/credentials.robot'
                sh 'echo "$""{MY_GITHUB_USER} ""      userdogit" >> ./resources/credentials.robot'
                sh 'echo "$""{MY_GITHUB_PASS} ""      senhadogit" >> ./resources/credentials.robot'
                sh 'robot -d ./resullts/ .'
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
