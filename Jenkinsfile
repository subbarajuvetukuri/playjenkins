pipeline {
  agent any

  stages {
    stage('Checkout Source') {
      steps {
        git 'https://github.com/subbarajuvetukuri/playjenkins.git'
      }
    }

    stage('Build image') {
      steps{
        script {
            sh 'docker build -t subbaraju7899/htmlsite:$BUILD_NUMBER .'
        }
      }
    }
    stage('Push Image') {
      steps{
        script {
         withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
            sh 'docker login -u subbaraju7899 -p ${dockerhubpwd}'
            sh 'docker push subbaraju7899/htmlsite:$BUILD_NUMBER'
          }
        }
      }
    }

   stage('Deploy to K8s'){
            steps{
                script{
                    sh "chmod +x changeTag.sh"
                    sh "./changeTag.sh $BUILD_NUMBER"
                   // kubernetesDeploy (configs: 'myweb.yaml',kubeconfigId: 'mykubeconfig')
                    withKubeConfig([credentialsId: 'mykubeconfig'])
                    {
                        kubectl apply -f myweb.yaml.
                    }
                }
            }
        }
        
        
        
    }

}
