def getDockerTag()
{
    def tag = sh script: 'git rev-parse HEAD',returnStdout:true
    return tag
}

pipeline
{
    agent any
    environment
    {
        Docker_tag = getDockerTag()
    }
   
    stages
    {
      
        stage("Build-Maven")
        {
            steps{
            sh "mvn clean package"
            }
        }
        
         stage("Build-DockerImage")
        {
            steps{
                script{
                       
                       sh "docker build . -t sravanasura/javaapp:Docker_tag"
                       withCredentials([string(credentialsId: 'Docker_Pass', variable: 'docker_pass')]) {
                        sh "docker login -u sravanasura -p $docker_pass"
                         sh "docker push sravanasura/javaapp:Docker_tag"
                         
    
                        }
                       
                       
                        
                      }
            }
        }
   
    }
}
