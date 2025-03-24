pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage('Build jar') {
            steps {
                scripts {
                    echo "building the application"
                    sh ' mvn package'

                }
            }
        }   
        stage('Build image') {
            steps {
                scripts {
                    echo "building the docker image"
                    WithCredentials([UsernamePassword(credentialsId: 'docker-credential', passwordVariable: 'PASS',usernameVariable: 'USER')])
                    sh ' docker build -t abdogom22/maven-app .'
                    sh " echo $PASS | docker login -u $USER --pasword-stdin"
                    sh ' docker push abdogom22/maven-app '

                }
            }
        }   
        
        stage('Deploy') {
            steps {
                scripts{
                    echo ' Deploying the app...'

                }
            }
        }
    }
}
