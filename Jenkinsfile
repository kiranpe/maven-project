pipeline {
    agent any
       
    parameters{
            string(name: 'tomcat-test', defaultValue: '35.174.18.21', description: 'Staging Server')
            string(name: 'tomcat-prod', defaultValue: '54.147.98.44', description: 'Production Server')
        }

        
        
    triggers{
            pollSCM('* * * * *')
        }

    node{
        env.JAVA_HOME="${tool '/sites/jdk1.8.0_161'}"
        env.PATH="${env.JAVA_HOME}/bin:${env.PATH}"
        sh 'java -version'
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
                     sh "scp -i /root/ssh/MyVPCKP.pem **/target/webapp.war ec2-user@${parms.tomcat-test}:/var/lib/tomcat7/webapps"
            }
        }   
                stage ('Deploy to Prod'){
                  steps {
                    sh "scp -i /root/ssh/MyVPCKP.pem **/target/webapp.war ec2-user@${parms.tomcat-prod}:/var/lib/tomcat7/webapps"
                }           
    }
}
        }   
    }
}    