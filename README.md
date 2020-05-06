# ObjectScript Quality Jenkins Job Template

This repository contains the resources for ObjectScript Quality Jenkins automatic jobs generation:

* _job-generator.sh_: script to be executed by the "Job Generator" job. This script replace parameters on "job_template.xml" and call objectscriptQuality Jenkins REST API
* _job-template.xml_: Jenkins job definition with following parameters
  * GIT_URL: URL of the Git repository
  * GIT_BRANCH: branch of Git repository to analyze
  * DISPLAY_NAME: name that will be displayed for the job
