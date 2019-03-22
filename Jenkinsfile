pipeline{

agentgent Slave1

stages{
    stage("Build"){
        steps{
             sh"mvn clean package"
             }
            }
    stage("Creating a Custom image with the latest build"){
        steps{
              sh" docker login --username veereshvanga --password Sainath@12#"
              sh" docker build -t tomcat:buildimage ."
              sh" docker push veereshvanga/Abcab:buildimage"
             }
           }	
    stage("Deploy for production"){
        when {
            branch 'master'
        }
        steps{
            sh "ssh -tt -v -o StrictHostKeyChecking=no root@172.31.41.213 'docker run -it -d --name tomcat -p 8080:8888 veereshvanga/Abcab/tomcat:buildimage /bin/bash'"
        }
    }
}
}
