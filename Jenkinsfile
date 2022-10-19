pipeline
{
    agent any
   
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
                
                withSonarQubeEnv('Sonar')
                {
                    script{
                     sh " /usr/share/apache-maven/bin/mvn sonar:sonar"
                    }
                }
            }
        }
    }
}
