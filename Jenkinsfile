pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = "us-east-1"
    // These pull from Jenkins credentials and set as env vars
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')         // Use Secret Text
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')     // Use Secret Text
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: 'main', url: 'https://github.com/lily4499/terraform-demo.git'
      }
    }

    stage('Init Terraform') {
      steps {
        sh 'terraform init'
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

    // Optional Apply Stage
    // stage('Apply Terraform') {
    //   steps {
    //     input "Do you want to apply the plan?"
    //     sh 'terraform apply -auto-approve tfplan'
    //   }
    // }
  }

  // post {
  //   always {
  //     sh 'terraform output'
  //   }
  // }
}



// pipeline {
//   agent any

//   environment {
//     AWS_DEFAULT_REGION = "us-east-1"
//   }

//   stages {
//     stage('Checkout Code') {
//       steps {
//         git branch: 'main', url: 'https://github.com/lily4499/terraform-demo.git'
//       }
//     }

//     stage('Init Terraform') {
//       steps {
//         withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
//           sh '''
//             export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
//             export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
//             terraform init
//           '''
//         }
//       }
//     }

//     stage('Validate Terraform') {
//       steps {
//         withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
//           sh '''
//             export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
//             export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
//             terraform validate
//           '''
//         }
//       }
//     }

//     stage('Plan Terraform') {
//       steps {
//         withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
//           sh '''
//             export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
//             export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
//             terraform plan -out=tfplan
//           '''
//         }
//       }
//     }

//     // Optional Apply Stage (uncomment if needed)
//     // stage('Apply Terraform') {
//     //   steps {
//     //     input "Do you want to apply the plan?"
//     //     withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
//     //       sh '''
//     //         export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
//     //         export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
//     //         terraform apply -auto-approve tfplan
//     //       '''
//     //     }
//     //   }
//     // }
//   }

//   // Optional Outputs
//   // post {
//   //   always {
//   //     withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
//   //       sh '''
//   //         export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
//   //         export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
//   //         terraform output
//   //       '''
//   //     }
//   //   }
//   // }
// }














