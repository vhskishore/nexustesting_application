pipeline{
    agent any
    environment {
    //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
    VERSION = readMavenPom().getVersion()
    }
    stages{
        stage("gitclone"){
            steps{
                sh "git clone https://github.com/vhskishore/mvn_shoppingcart.git"
            }
        }    
        stage("mavenbuild"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("target"){
           steps{
                sh "ls /var/lib/jenkins/workspace/mvn_shoppingcart/target"
           }
        }
        stage("upload wat to nexus"){
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
                nexusUrl: '3.235.154.176:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'mvn_shoppingcart', 
                version: "${VERSION}"
           }
        }
    }
}
