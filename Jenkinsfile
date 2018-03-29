pipeline {
    agent any
       
    parameters{
            string(name: 'tomcat-test', defaultValue: '35.174.18.21', description: 'Staging Server')
            string(name: 'tomcat-prod', defaultValue: '54.147.98.44', description: 'Production Server')
        }

        
        
    triggers{
            pollSCM('* * * * *')
        }


    stage('Deployments'){
        parellel{
            stage('Deploy to staging'){
                steps{
                    sh "scp -i /root/ssh/MyVPCKP.pem **/target/webapp.war ec2-user@${parms.tomcat-test}:/var/lib/tomcat7/webapps"
                }
            }
        }    
            stage('Deploy to Prod'){
                steps{
                    sh "scp -i /root/ssh/MyVPCKP.pem **/target/webapp.war ec2-user@${parms.tomcat-prod}:/var/lib/tomcat7/webapps"
                }
            }
        }
        
}

