pipeline{
    agent any
    environment {
    //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
    VERSION = readMavenPom().getVersion()
    }
    stages{
        stage("Cleaning Workspace"){
            steps{
                echo 'Cleaning Workspace....'
                CleanWs()
            }
        }  
    }
}
