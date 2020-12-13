```sh
sudo apt-get install -y openjdk-8-jre
```

```sh
# https://www.jenkins.io/download
curl -OL https://get.jenkins.io/war-stable/2.263.1/jenkins.war
# https://github.com/jenkinsci/plugin-installation-manager-tool
curl -OL https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.4.0/jenkins-plugin-manager-2.4.0.jar
```

```sh
mkdir -p .jenkins/plugins
tee plugins.txt > /dev/null <<EOF
configuration-as-code
credentials-binding
docker-workflow
git
github-branch-source
job-dsl
workflow-aggregator
workflow-multibranch
EOF
java -jar jenkins-plugin-manager-2.4.0.jar --war ./jenkins.war --plugin-file plugins.txt -d .jenkins/plugins # install plugins
```

```sh
mkdir -p .jenkins/casc_configs
```

```sh
java -Djenkins.install.runSetupWizard=false -Dcasc.jenkins.config=/home/whs/.jenkins/casc_configs/jcasc.yaml -jar jenkins.war # run jenkins
```
