pipeline
{
    agent any
    tools
    {
       maven "Maven"
    }
   
    stages
    {
        stage("Git-clone")
        {
            steps{
            git'https://github.com/SravanAsura/Springboot.git'
            }
        }
        stage("Build-Maven")
        {
            steps{
            sh "mvn clean package"
            }
        }
        stage("CodeQuality-Sonar")
        {
            steps{
                
                withSonarQubeEnv(installationName:'Sonar',credentialsId:'Jenkins-token')
                {
                   // sh"${tool {"sonar-scanner"}}"
                    sh "mvn sonar:sonar"
                //  script{
                     //sh "mvn sonar:sonar"
                   // }
                }
            }
        }
    }
}
