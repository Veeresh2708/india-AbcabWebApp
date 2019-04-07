pipeline{

agent 
{
label "Slave1"
}

stages{
    stage("Building in progress"){
        steps{
             sh"mvn clean package"
            sh"echo $BUILD_NUMBER"
             }
            }
    stage("Creating a Custom image with the latest build"){
        steps{
             withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
              sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
              //sh" docker login --username veereshvanga --password Sainath@12#"
              sh" docker build -t tomcat:buildimage+ $BUILD_NUMBER ."
              sh" docker tag tomcat:buildimage veereshvanga/abcabwebapp:buildimage+ $BUILD_NUMBER"
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
