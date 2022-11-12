pipeline
{
    agent any
    tools
    {
       maven "Maven"
    }
   
    stages
    {
      
        stage("Build-Maven")
        {
            steps{
            sh "mvn clean package"
            }
        }
   
    }
}
