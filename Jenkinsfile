pipeline {
   agent {
       docker {
           image 'python'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compilando ou resolvendo as dependências do projeto'
            sh 'pip install robotframework'
         }
      }
      stage('Testes') {
          steps{
              echo 'Executando testes de regressão'
              sh 'robot -d results -e todo tests/'
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
