# terraform-jenkins
pipeline {
    agent any
    tools {
        terraform "terraform"
    }

    stages {
        stage('scm') {
            steps {
             checkout scmGit(branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/latheef1403/terraform-jenkins.git']])
            }
        }
        stage('terraform') {
            steps {
                sh "terraform init"
            }
        }
        stage('terraform validate') {
            steps {
                sh "terraform validate"
            }
        }
        stage('terraform plan') {
            steps {
                sh "terraform plan"
            }
        }
        stage('terraform apply') {
            steps {
                sh "terraform apply -auto-approve"
            }
        }
    }
}
