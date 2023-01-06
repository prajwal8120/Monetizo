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
                sh 'mvn clean compile'
                echo "Package Done!!"
            }
        }
    }
}