pipeline {

  environment {
    registry = "subbaraju7899/myweb"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/justmeandopensource/playjenkins.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
         withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
            sh 'docker login -u subbaraju7899 -p ${dockerhubpwd}'            
          }
          sh 'dockerImage.push()'
        }
      }
    }

    

  }

}
