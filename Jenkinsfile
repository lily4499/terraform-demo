pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = "us-east-1"
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: 'main', url: 'https://github.com/lily4499/terraform-demo.git'
      }
    }

    stage('Init Terraform') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
          sh 'terraform init'
        }
      }
    }

    stage('Validate Terraform') {
      steps {
        sh 'terraform validate'
      }
    }

    stage('Plan Terraform') {
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }

  //   stage('Apply Terraform') {
  //     steps {
  //       input "Do you want to apply the plan?"
  //       sh 'terraform apply -auto-approve tfplan'
  //     }
  //   }
   }

  post {
    always {
      sh 'terraform output'
    }
  }
}
