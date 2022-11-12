pipeline
{
    agent any

   
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
                       sh "docker build -t sravanasura/app"
                        
                      }
            }
        }
   
    }
}
