# Exercise 2 - Creating Your Pipeline

Today, you will be building your Trusted Software Supply Chain using a Jenkins Pipeline that is integrated with OpenShift.

In the Jenkins Console (<https://jenkins-cicd-student{{ student_number }}.{{ ocp_app_suffix }}> ), click on 'New Item' to create your trusted software supply chain pipeline job.

<img src="../images/jenkins_1.png" alt="sonarqube_welcome" width="500">  

Enter openshift-tasks for the item name and select Pipeline as the type.

<img src="../images/jenkins_2.png" alt="sonarqube_welcome" width="500"> 

Click OK to create the pipeline job.  

Switch the Definition from 'Pipeline script' to 'Pipeline scipt from SCM'.  Out Pipeline Script will be stored in the git repository with the source code of the application.  

<img src="../images/jenkins_3.png" alt="sonarqube_welcome" width="500"> 

Choose Git from the SCM selection box.

<img src="../images/jenkins_4.png" alt="sonarqube_welcome" width="500"> 

Now enter your git repository URL into the Repository URL box and eap-7 into the Branch Specifier.

* Git Repository URL: http://gogs.apps.ocpws.kee.vizuri.com/student{{ student_number }}/openshift-tasks.git
* Branch Specifier: eap-7


<img src="../images/jenkins_5.png" alt="sonarqube_welcome" width="500"> 

Click 'Save' to create your pipeline job.

Click on 'Build Now' in the left menue of your job to test that your pipeline job is configured properly.  

<img src="../images/jenkins_6.png" alt="sonarqube_welcome" width="500"> 

Verify your pipeline completes successfully in the Stage View.

<img src="../images/jenkins_7.png" alt="sonarqube_welcome" width="500"> 

You will be adding to this pipleine in the rest of the labs.