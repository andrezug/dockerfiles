pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        #metadata:
        #  labels:
        #    some-label: some-label-value
        spec:
          containers:
          - name: kaniko
            image: gcr.io/kaniko-project/executor:v1.8.1-debug
            imagePullPolicy: Always
            command:
            - sleep
            args:
                - 99d
            volumeMounts:
              - name: jenkins-docker-cfg
                mountPath: /kaniko/.docker
          volumes:
          - name: jenkins-docker-cfg
            secret:
                secretName: regcred
                items:
                - key: .dockerconfigjson
                  path: config.json      
        '''
    }
  }
  stages {
    stage('Build image') {
      steps {
        container('kaniko') {
          sh '/kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --destination=andrezug/testkaniko:v0.3'
        }
      }
    }
  }
}