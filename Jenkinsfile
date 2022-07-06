pipeline {
  agent {
            kubernetes {
            //cloud 'kubernetes'
            defaultContainer 'kaniko'
            yaml """
        kind: Pod
        spec:
        containers:
          - name: kaniko
            image: gcr.io/kaniko-project/executor:debug
            imagePullPolicy: Always
            command:
            - sleep
            args:
            - 9999999
        """
            }
    }

   stages {
        stage('Build') { 
            steps {
                git branch: 'main', url: 'https://github.com/andrezug/dockerfiles.git'
            }
        }

        stage ('Exec Kaniko') {
            steps { 
                container('kaniko') {
                sh '''
                    /kaniko/executor
                '''
               }
            }
        }
    }
}
