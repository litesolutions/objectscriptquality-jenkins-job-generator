# ObjectScript Quality Jenkins Job Template

This repository contains the resources for ObjectScript Quality Jenkins automatic jobs generation:

* _job-generator.sh_: script that the "Job Generator" job execute. This script replace parameters on "job_template.xml" and call [ObjectScript Quality Jenkins](https://community-jenkins.objectscriptquality.com/) REST API
* _job-template.xml_: Jenkins job definition with this parameters
  * GIT_URL: URL of the Git repository
  * GIT_BRANCH: branch of Git repository
  * DISPLAY_NAME: name that will be displayed for the job
