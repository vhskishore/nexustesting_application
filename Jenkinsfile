pipeline{
    agent any
    stages{
        stage("git clone"){
            steps{
                sh "git clone https://github.com/vhskishore/mvn_shoppingcart.git"
            }
        }    
        stage("maven build"){
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
               script{
                   def mavenPom = readMavenPom file: 'pom.xml'
                   def nexusRepoName = mavenPom.version.endsWith("SNAPSHOT") ? "mvn_shoppingcart-snapshot" : "mvn_shoppingcart-release"
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
                nexusUrl: '100.24.98.144:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: "${nexusRepoName}", 
                version: "${mavenPom.version}"
               }
           }
        }
    }
}
