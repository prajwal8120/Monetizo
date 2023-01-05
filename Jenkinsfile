pipeline {
    agent any
    tools {
        maven "M2_HOME"
    }

    stages {
        stage ("Source Code Check In") {
            step {
            git 'https://github.com/prajwal8120/Monetizo.git'
            echo "scr fetched"
            }
        }
    }
}