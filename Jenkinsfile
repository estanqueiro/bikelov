pipeline {
   agent {
       docker {
           image 'estanqueiro/pywd'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compilando ou resolvendo as dependências do projeto'
            sh 'pip install -r requirements.txt'
         }
      }
      stage('Testes') {
          steps{
              echo 'Executando testes de regressão'
              sh 'robot -d results -e todo -v BROWSER:headlesschrome tests/'
          }
          post {
              always {
                robot otherFiles: '**/*.png', outputPath: 'results'
              }
          }
      }
      stage('UAT') {
          steps{
              echo 'Aguardando testes de aceitação do usuário'
              input(message: 'Go to Production?', ok: 'Yes')
          }
      }
      stage('Production') {
          steps{
              echo 'App is Ready'
          }
      }
   }
}
