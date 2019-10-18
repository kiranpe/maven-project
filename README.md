# Maven Project
------------------------

This repo has maven code and yaml files to build image and deploy on K8S cluster.

Set up Java and Maven in Global tools in jenkins..

Update hosts file with K8S cluster ip's..

#Free Style Project:
---------------------
Create Jenkins build with below repo..

https://github.com/kiranpe/maven-project.git

Add maven build step with "clean deploy"

Add below commands to jenkins execute shell in build steps

#Checking Docker image Quality before deploying to k8s

ansible-playbook docker-image.yaml

#Deploying image on K8S

cd "$WORKSPACE"/ymlfiles/

#push rsa key to master node

ansible-playbook push_rsa_key.yaml -i hosts --private-key /sites/keyfile.pem

#Deploy image

ansible-playbook webapp.yaml -i hosts

----------------------------------------------------------------------

This will deploy webapp application on K8S cluster and will upload your snapshot or release version to your nexus


#Pipeline Project:
-------------------

Use pipeline while setting up job

Use "Pipeline Script from SCM" option in pipeline..

Select Git from SCM and use repo https://github.com/kiranpe/maven-project.git

Update hosts file with K8S cluster ip's and pom.xml with nexus ip..

Run the build..
