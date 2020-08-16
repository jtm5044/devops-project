npm install --save-dev typescript

sudo /home/xroot/sonar-scanner/sonar-scanner-4.4.0.2170-linux/bin/sonar-scanner \
  -Dsonar.projectKey=juice-shop \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://100.16.0.53:9000 \
  -Dsonar.login=01f4d49cf2b2e831f6ca647c418d7230c91054db

sudo rm -R /home/gitlab-runner/builds/JxncWFfe/0/lmasz/juice-shop/.scannerwork/