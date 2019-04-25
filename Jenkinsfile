pipeline{

agent 
{
label "Slave_unix"
}
 parameters
{
 choice(name: 'Environment',choices: 'Dev\nUAT\nPRD',description: 'Please select Environment')
 string(name:  'servername',description: 'Please enter ip address of Machine where you want to deploy artifact')
 }

stages{
    stage("Building in progress"){
        steps{
             sh"mvn clean package"
            }
            }
    stage("Creating a Custom image with the latest build"){
        steps{
             withCredentials([usernamePassword(credentialsId: 'Docker_login', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
              sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
              sh" docker build -t tomcat:buildimage$BUILD_NUMBER ."
              sh" docker tag tomcat:buildimage veereshvanga/abcabwebapp:buildimage$BUILD_NUMBER"
              sh" docker push veereshvanga/abcabwebapp"
             }
           }
    }
    stage("Deploy into concern Enviornment"){

        steps{
            sh "ssh -tt -v -o StrictHostKeyChecking=no root@${params.servername} 'docker run -it -d --name tomcat$BUILD_NUMBER -p 8888:8080 veereshvanga/abcabwebapp:buildimage$BUILD_NUMBER'"
        }
    }
 stage("Testing the deployment"){
 
     steps{
            script{
                sh 'ls -lrt /root/Scripts'
                sh '/root/Scripts/web.sh'
            }
        }
  }
 }
}

