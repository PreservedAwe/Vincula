pipeline {
    // This specifies where the pipeline will run. 'any' means any available agent.
    agent any
    
    // The tools block can define tools like Git if they're not in the agent's PATH
//    tools {
//        git 'Default' // Assumes the default Git installation is available
//    }

    // A stage is a logical division of the pipeline, like Build, Test, or Deploy.
    stages {
        stage('Shut Down') {
            steps {
                // 'docker-compose down' stops and removes all containers and networks
                sh 'docker compose down'
            }
        }

        stage('Build') {
            steps {
                // The 'sh' step executes a shell command on the agent.
                // This command tells docker-compose to build the images defined in your docker-compose.yml file.
                sh 'docker compose build'
            }
        }

        stage('Deploy') {
            steps {
                // This command starts the containers in detached mode (-d).
                // It will recreate any containers whose images were just built.
                sh 'docker compose up -d'
            }
        }
    }

    // The 'post' block defines actions to take after the pipeline has finished.
    post {
        success {
            echo 'Pipeline succeeded! Your application is live.'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}