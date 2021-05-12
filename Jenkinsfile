pipeline{
    agent any
    environment {
    //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
    VERSION = readMavenPom().getVersion()
    }
    stages{
        stage("gitclone"){
            steps{
                sh "git clone https://github.com/vhskishore/nexustesting_application.git"
            }
        }    
        stage("mavenbuild"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("upload war to nexus"){
           steps{
                nexusArtifactUploader artifacts: [
                    [
                        artifactId: 'shoppingcart', 
                        classifier: '', 
                        file: 'target/shoppingcart.war', 
                        type: 'war'
                    ]
                ], 
                credentialsId: 'nexus3', 
                groupId: 'shoppingcart', 
                nexusUrl: '44.192.102.92:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'nexustesting_application', 
                version: "${VERSION}"
           }
        }
        stage("get artifact from nexus"){
            steps{
                sh '''
                cd /var/lib/jenkins/getartifactsfromnexus/
                curl http://44.192.102.92:8081/repository/nexustesting_application/shoppingcart/shoppingcart/8.0/shoppingcart-8.0.war '''
            }
        }
        stage("deploying to tomcat"){
            steps{
                sh '''
                scp /var/lib/jenkins/getartifactsfromnexus/shoppingcart-8.0.war root@3.231.216.151:/root/apache-tomcat-8.5.65/webapps '''
            }
        }
    }
}
