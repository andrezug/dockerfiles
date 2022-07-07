pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        metadata:
          labels:
            some-label: some-label-value
        spec:
          containers:
          - name: kaniko
            image: gcr.io/kaniko-project/executor:debug
            imagePullPolicy: Always
            command:
            - sleep
            args:
                - 99d 
        '''
    }
  }
  stages {
    stage('Build image') {
      steps {
        container('kaniko') {
          sh '/kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --no-push'
        }
      }
    }
  }
}