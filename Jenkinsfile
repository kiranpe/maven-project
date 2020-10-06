pipeline {
    agent any
   
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
        stage ('Check Docker Image Quality'){
                   steps {
                     sh "ansible-playbook ${env.WORKSPACE}/docker-image.yml"
            }
        }
        stage ('Add RSA key to K8S Cluster'){
                  steps {
                    sh "ansible-playbook ${env.WORKSPACE}/ymlfiles/push_rsa_key.yaml -i ${env.WORKSPACE}/ymlfiles/hosts --private-key /sites/keyfile.pem"
                }
        }
        stage ('Deploy image on K8S cluster'){
                  steps {
                    sh "ansible-playbook ${env.WORKSPACE}/ymlfiles/webapp.yaml -i ${env.WORKSPACE}/ymlfiles/hosts"
                }
        }
    }
}
