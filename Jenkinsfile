pipeline {
    agent any

    // Автоматический запуск при пуше в репозиторий
    triggers {
        pollSCM('H/5 * * * *')  // Проверка каждые 5 минут
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-username/your-repo.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("telegram-bot:${env.BUILD_ID}")
                }
            }
        }
        
        stage('Stop Old Container') {
            steps {
                script {
                    // Останавливаем и удаляем старый контейнер
                    sh 'docker stop telegram-bot || true'
                    sh 'docker rm telegram-bot || true'
                }
            }
        }
        
        stage('Run Bot') {
            steps {
                script {
                    docker.run(
                        "--name telegram-bot -d --restart always telegram-bot:${env.BUILD_ID}"
                    )
                }
            }
        }
    }
    
    post {
        success {
            slackSend channel: '#notifications', message: "Бот успешно обновлен! ✅"
        }
        failure {
            slackSend channel: '#notifications', message: "Сборка бота провалилась! ❌"
        }
    }
}