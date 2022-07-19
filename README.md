## What is the image for?
The intended purpose of this image is for it to be used as a Jenkins agent. By using the installed features the user is able to create Jenkins pipelines that can run build applications using Gradle. An example of using this image as a Jenkins agent via [Kubernetes](https://plugins.jenkins.io/kubernetes/) can be seen below. 

First, an example of configuring the pod template in yaml to create the agent.

```yaml
jenkins:
  clouds:
    - kubernetes:
        name: "kubernetes"
        templates:
          - name: "image-builder-gradle"
            label: "image-builder-gradle"
            nodeUsageMode: NORMAL
            containers:
              - name: "image-gradle"
                image: "ghcr.io/liatrio/image-builder-gradle:${builder_images_version}"
```
And then specifying the agent in the Jenkinsfile for an example step.

```jenkins
stage('Build') {
  agent {
    label "image-builder-gradle"
  }
  steps {
    container('image-gradle') {
      sh "gradle init"
    }
  }
}
```

## What is installed on this image?
- Version [7.4.X](https://gradle.org/install/) of Gradle.

