# DevOps Project - Part 2 - GitLab CI & SonarQube

## Course Info

- Course Number: 605.609.81 
- Course Title: DevOps Software Development Paradigm
- Semester: Summer 2020
- Instructors: Mr. Ross Young, Mr. Jeff Garonzik
- Grader: Mr. Jason Chavez


## Team Info

### Team #: 5

### Team Members:

- Jeremy Martin (jmart204@jh.edu)
- Raymond Liu (rliu30@jhu.edu)
- Lisa Maszkiewicz (lmaszki2@jhu.edu)

## Part 2 Description

Automate scanning of OWASP Juice Shop code with a GitLab CI Pipeline that invokes SonarQube.

## File Descriptions

- `docker-compose.yml`
    - Declares the GitLab and SonarQube containers with appropriate port-mappings and volume mounts
    - Invoke with `docker-compose up -d`
- `.gitlab-ci.yml`
    - Defines the GitLab CI Pipeline with one stage that calls the `sonar_scan.sh` script
    - Invoked by GitLab when a new commit is pushed to the GitLab repository
- `config.toml`
    - Configuration file for `gitlab-runner` that defines the token and shell executor
    - Lives under `/etc/gitlab-runner/config.toml`
    - Invoked when `gitlab-runner` is started
- `sonar_scan.sh`
    - Ensures typescript is installed & available for `gitlab-runner`, invokes `sonar-scanner` on the OWASP Juice Shop source code, and cleans up the `.scannerwork/` directory
    - Invoked by `gitlab-runner` when the Sonar_Publish pipeline stage runs

## Overall Demonstration Flow

1. Bring up the infrastructure with `docker-compose up -d`
1. Wait for `docker ps -a | grep gitlab` to return a status of "healthy"
1. Commit a change to source code and push to GitLab
1. The GitLab Pipeline with the `Sonar_Publish` stage runs
1. `gitlab-runner` picks up the job and executes `sonar_scan.sh`
1. `sonar_scan.sh` invokes `sonar-scanner` and scans the source code
1. `sonar-scanner` uploads the results to SonarQube
1. The scan results are viewable within SonarQube