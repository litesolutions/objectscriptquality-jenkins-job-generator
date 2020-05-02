# Replace values from template

cp job-template.xml /tmp
sed -i -e 's|{{GIT_URL}}|'"$GIT_URL"'|' /tmp/job-template.xml
sed -i -e 's|{{BRANCH}}|'"$BRANCH"'|' /tmp/job-template.xml
JOB_DISPLAY_NAME=${GIT_URL##*/}
sed -i -e 's|{{DISPLAY_NAME}}|'"$JOB_DISPLAY_NAME"'|' /tmp/job-template.xml

cat /tmp/job-template.xml

# Generate job

export COOKIE_JAR=/tmp/cookies

JENKINS_CRUMB=$(curl --silent --cookie-jar $COOKIE_JAR -s -u $JENKINS_USER:$JENKINS_TOKEN $JENKINS_URL'/crumbIssuer/api/json' | sed -E 's/.*"crumb":"?([^,"]*)"?.*/\1/')
JOB_NAME_TO_GENERATE=intersystems_iris_contests_$JOB_DISPLAY_NAME

curl -s --cookie $COOKIE_JAR $JENKINS_URL'/job/intersystems_iris_contests/createItem?name='$JOB_NAME_TO_GENERATE -H 'Jenkins-Crumb:'$JENKINS_CRUMB -H "Content-Type:text/xml" -u $JENKINS_USER:$JENKINS_TOKEN --data-binary @/tmp/job-template.xml -v
rm /tmp/job-template.xml
