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
            sh "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:2.8.1:sonar"
            }
        }
    }
}