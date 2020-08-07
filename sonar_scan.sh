sudo rm -rf .scannerwork

sudo /home/xroot/sonar-scanner/sonar-scanner-4.4.0.2170-linux/bin/sonar-scanner \
  -Dsonar.projectKey=devops-project \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://100.16.0.53:9000 \
  -Dsonar.login=ee00f6c535ff91c13be48b8b88a3985759d41030
