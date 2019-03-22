pipeline
{
   agent{
      label "Slave1"
   }
   
 parameters
{
 choice(name: 'Environment',choices: 'Dev\nUAT\nPRD',description: 'Please select Environment')
 string(name:  'servername',description: 'Please enter ip address of Machine where you want to deploy artifact')
 string(name:  'Jobname',description: 'Please Jobname to get ocation of artifact')
 string(name:  'ContainerId',description: 'Please Enter Container ID:')
}
  stages{
  stage("build"){
  steps{
    sh "mvn clean package" 

  }
  }
} 
}
