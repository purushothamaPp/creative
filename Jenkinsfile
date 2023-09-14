pipeline{
    agent any
    stages{
        stage("checkout"){
            steps{
               checkout scmGit(branches: [[name: '*/main']], 
               extensions: [], userRemoteConfigs: [[credentialsId: 'git_cred', 
               url: 'https://github.com/purushothamaPp/creative.git']]) 
            }
            
        }
        stage("build"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("deploy to nexus"){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'simple-app', 
                classifier: '', file: 'target/simple-app-3.0.0.war', type: 'war']], 
                credentialsId: 'nexus_cred', 
                groupId: 'in.javahom', 
                nexusUrl: '20.92.255.59:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'myapp', 
                version: '3.0.0'
            }
        }
        stage("Docker Build"){
            steps{
                sh "docker build -t purushothamareddy/simpleapp:3.0.0 ."
            }
        }
        stage("Docker "){
            steps{
                withCredentials([string(credentialsId: 'docker_pwd', variable: 'dockerHubPwd')]) {
                sh "docker login -u purushothamareddy -p ${dockerHubPwd}"
}
                sh "docker push purushothamareddy/simpleapp:3.0.0"
            }
        }
    }
}
