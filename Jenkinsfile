pipeline{
    agent any
    environment {
    //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
    VERSION = readMavenPom().getVersion()
    }
    stages{
        stage("Cleaning Workspace"){
            echo "Cleaning Workspace...."
            CleanWs()
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
                        file: 'target/nexustesting_application.war', 
                        type: 'war'
                    ]
                ], 
                credentialsId: 'nexus3', 
                groupId: 'shoppingcart', 
                nexusUrl: '3.235.154.176:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'nexustesting_application', 
                version: "${VERSION}"
           }
        }
    }
}
