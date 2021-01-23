```sh
sudo apt-get install -y openjdk-8-jre
```

```sh
# https://www.jenkins.io/download
curl -OL https://get.jenkins.io/war-stable/2.263.2/jenkins.war
# https://github.com/jenkinsci/plugin-installation-manager-tool
curl -OL https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.5.0/jenkins-plugin-manager-2.5.0.jar
```

# Plugins
| Plugin | Url |
| --- | --- |
| configuration-as-code | https://plugins.jenkins.io/configuration-as-code |
| credentials-binding | https://plugins.jenkins.io/credentials-binding |
| docker-workflow | https://plugins.jenkins.io/docker-workflow |
| git | https://plugins.jenkins.io/git |
| github-branch-source | https://plugins.jenkins.io/github-branch-source |
| job-dsl | https://plugins.jenkins.io/job-dsl |
| workflow-aggregator | https://plugins.jenkins.io/workflow-aggregator |
| workflow-multibranch | https://plugins.jenkins.io/workflow-multibranch |

```sh
mkdir -p .jenkins/plugins
```

```sh
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
sed -i '2,$ s/^/#/' plugins.txt
(
plugins=$(wc -l < plugins.txt)
for i in $(seq 1 $plugins)
do
java -jar jenkins-plugin-manager-2.5.0.jar --war ./jenkins.war --plugin-file plugins.txt -d .jenkins/plugins # install plugins
sed -i '0,/^#/ s/^#//' plugins.txt
done
)
```

# Jcasc
https://github.com/jenkinsci/configuration-as-code-plugin

```sh
mkdir -p .jenkins/casc_configs
```

```sh
tee .jenkins/casc_configs/jcasc.yaml > /dev/null <<EOF
jenkins:
  systemMessage: "Jenkins configured automatically by Jenkins Configuration as Code plugin\n\n"
EOF
```

```sh
java -Djenkins.install.runSetupWizard=false -Dcasc.jenkins.config=.jenkins/casc_configs/jcasc.yaml -jar jenkins.war # start jenkins, port 8080
```
