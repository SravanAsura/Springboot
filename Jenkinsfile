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
            sh "mvn clean"
            sh "mvn install"    
            }
        }
        
         stage("Build-DockerImage")
        {
            steps{
                script{
                       
                       sh "docker build . -t sravanasura/javaapp:$Docker_tag"
                       withCredentials([string(credentialsId: 'dockerpass', variable: 'DockerPass')]) {
                        sh "docker login -u sravanasura -p $DockerPass"
                         sh "docker push sravanasura/javaapp:$Docker_tag"
                          sh "docker run -d -p 6000:5000 sravanasura/javaapp:$Docker_tag"
                         
    
                        }
                       
                       
                        
                      }
            }
        }
   
    }
}
