pipeline {
    agent any
    tools {
        maven "M2_HOME"
    }

    stages {
        stage ("Source Code Check Out") {
            steps {
            git 'https://github.com/prajwal8120/Monetizo.git'
            echo "scr code fetched"
            }
        }

        stage ("Build Package") {
            steps {
                sh 'mvn clean package'
                echo "Package Done!!"
            }
        }

        stage ("Docker Login") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', passwordVariable: 'Registry_passwd', usernameVariable: 'Registry_username')]) {
                sh 'docker login -u $Registry_username -p $Registry_passwd'
                }
            }
        }

        stage ("Docker Build Image") {
            steps {
                sh 'docker build -t insta7120/Monetizo_image:v1.0 .'
            }
        }
    }
}