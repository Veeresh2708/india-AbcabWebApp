pipeline{

agent 
{
label "Slave_unix"
}

stages{
    stage("Building in progress"){
        steps{
             sh"mvn clean package"
             }
            }
    stage("Creating a Custom image with the latest build"){
        steps{
              sh" docker login --username <Username> --password <Password>"
              sh" docker build -t tomcat:buildimage ."
              sh" docker tag tomcat:buildimage veereshvanga/abcabwebapp:buildimage1"
              sh" docker push veereshvanga/abcabwebapp"
             }
           }	
    stage("Deploy into concern Enviornment"){

        steps{
            sh "ssh -tt -v -o StrictHostKeyChecking=no root@172.31.27.172 'docker run -it -d --name tomcat -p 8080:8888 veereshvanga/abcabwebapp:buildimage1'"
        }
    }
}
}
