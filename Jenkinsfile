pipeline {
    agent any
    
    parameters{
            string(name: 'tomcat-test', defaultValue: '35.174.18.21', description: 'Staging Server')
            string(name: 'tomcat-prod', defaultValue: '54.147.98.44', description: 'Production Server')
        }

    triggers{
            pollSCM('* * * * *')
        }

    stages{
        stage('Build'){
            steps {
                sh "mvn clean package"
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
                stage ('Deploy to staging'){
                   steps {
                     sh "scp -i /root/ssh/MyVPCKP.pem **/target/webapp.war ec2-user@${params.tomcat-test}:/var/lib/tomcat7/webapps/"
            }
        }
}
        }   
    }
}    