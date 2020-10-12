pipeline {
    agent any
    
    environment {
     DOCKER_REGISTRY='http://registry-1.docker.io'
     CONTAINER='apache'
     IMAGE_VERSION="1.${BUILD_NUMBER}"
     PROD_VERSION="latest"
   }
   
    stages{
        stage('Build'){
            steps {
                echo "Build Maven code and Deploy artifacts to Nexus3"
                sh "mvn clean install"
            }
            post {
                success{
                echo "Now Archiving..."
                archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage ('Create Docker Image'){
                   steps {
                    sh """ansible-playbook ${WORKSPACE}/docker-image.yml -e image_version='${env.IMAGE_VERSION}'"""
            }
        }
/*        stage ('Add RSA key to K8S Cluster'){
                  steps {
                    sh "ansible-playbook ${env.WORKSPACE}/ymlfiles/push_rsa_key.yml -i ${env.WORKSPACE}/ymlfiles/hosts --private-key /sites/keyfile.pem"
                }
        }
        stage ('Deploy image on K8S cluster'){
                  steps {
                    sh "ansible-playbook ${env.WORKSPACE}/ymlfiles/webapp.yml -i ${env.WORKSPACE}/ymlfiles/hosts"
                }
        } */
    }
}
