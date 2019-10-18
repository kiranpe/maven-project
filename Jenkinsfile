pipeline {
    agent any
   
    stages{
        stage('Build'){
            steps {
                sh "mvn clean install"
            }
            post {
                success{
                echo "Now Archiving..."
                archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
   
        stage('Deployments'){
            parallel{
                stage ('Check Docker Image Quality'){
                   steps {
                     sh "ansible-playbook docker-image.yaml"
            }
        }
                stage ('Add rsa key to K8S Cluster'){
                  steps {
                    sh "ansible-playbook **/ymlfiles/push_rsa_key.yaml -i **/ymlfiles/hosts --private-key /sites/keyfile.pem"
                }
    }
                stage ('Deploy image on K8S cluster'){
                  steps {
                    sh "ansible-playbook **/ymlfiles/webapp.yaml -i **/ymlfiles/hosts"
                }
    }

}
        }
    }
}