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
                echo "Docker Login Successfully"
                }
            }
        }

        stage ("Docker Build Image") {
            steps {
                sh 'docker build -t insta7120/monetizo_image:v1.0 .'
                sh 'docker rmi $(docker images -f "dangling=true" -q)'
                echo "Built Image Successfully"
            }
        }

        stage ("Push the docker image to the Docker Hub") {
            steps {
                sh 'docker push insta7120/monetizo_image:v1.0'
                echo "Pushed Image Successfully"
            }
        }

        stage ("Execute playbook in aws_server") {
            steps {
                ansiblePlaybook credentialsId: 'aws_server', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'inv.inv', playbook: 'deployment_aws-server.yml'
                echo "Playbook Executed Successfully"
            }
        }
    }

        //post{
        //always{
            //emailext to: "prajwal8120@gmail.com", "insta7120@gmail.com"
            //subject: "Test Email",
            //body: "Test",
            //attachLog: true
        //}
    //}
        post1 {
            always{
                //archiveArtifacts artifacts: '*.war', onlyIfSuccessful: true
                
                emailext to: "prajwal8120@gmail.com",
                subject: "jenkins build:${currentBuild.currentResult}: ${env.JOB_NAME}",
                body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}",
                attachmentsPattern: '*.csv'
                
            //cleanWs()
            }
        }
}
