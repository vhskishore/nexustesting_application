pipeline{
    agent any
    environment {
    //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
    VERSION = readMavenPom().getVersion()
    }
    stages{
        stage("Cleaning Workspace"){
            steps{
                    sh '''echo "Cleaning Workspace...."
                    CleanWs()
                    echo "Workspace cleaned...."'''
            }
        }
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
                nexusUrl: '34.237.124.164:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'nexustesting_application', 
                version: "${VERSION}"
           }
        }
    }
}
