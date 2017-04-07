# openshift-scheduled-jobs-cleanup

This repo provides a Dockerfile and an openshift template.
One will be able to build and deploy a scheduledjobs, which can cleanup other jobs in an openshift project.

As an openshift user, one can use the template to build and deploy the scheduledjobs-cleanup, (need to provide some parameters defined in he template): 
PROJECT_NAME and USER_DURATION)
If the template is already in the openshift master, then the user only have to click the template from the GUI.

