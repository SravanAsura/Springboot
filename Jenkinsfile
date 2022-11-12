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
                       
                       sh "docker build . -t sravanasura/javaapp:${Docker_tag}"
                       withCredentials([string(credentialsId: 'Docker_Pass', variable: 'docker_pass')]) {
                        sh "docker login -u sravanasura -p $docker_pass"
                         sh "docker push sravanasura/javaapp:Docker_tag"
                          sh "docker run -d -p 123:80 sravanasura/javaapp:${Docker_tag}"
                         
    
                        }
                       
                       
                        
                      }
            }
        }
   
    }
}
