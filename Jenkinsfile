pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
    }

    stages {
        stage('Build') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh './build.sh'
                    }
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh "docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}"
                        sh "docker tag your-dockerhub-username/devops-build:latest your-dockerhub-username/devops-build:dev"
                        sh "docker push your-dockerhub-username/devops-build:dev"
                    } else if (env.BRANCH_NAME == 'master') {
                        sh "docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}"
                        sh "docker tag your-dockerhub-username/devops-build:latest your-dockerhub-username/devops-build:prod"
                        sh "docker push your-dockerhub-username/devops-build:prod"
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev' || env.BRANCH_NAME == 'master') {
                        sh './deploy.sh'
                    }
                }
            }
        }
    }
}
