

# Trusted Software Supply Chain Environment

In this lab you will explore the tools utilized throught this workshop.  

The following tools are utilized to create our Trusted Software Supply Chain.  



## Openshift

OpenShift is the container orchestration platform that hosts oure Supply Chain Tools as well as our application deployments. 

A) Navigate to the OpenShift Console: <{{ ocp_console_url }}> <a href="#0"><a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('{{ ocp_console_url }}')" alt="copy-paste" width="20"></a>

   * Username: `student{{ student_number }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('student{{ student_number }}')" alt="copy-paste" width="20"></a>
   * Password: `{{ student_pwd }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('{{ student_pwd }}')" alt="copy-paste" width="20"></a>
 
     >Note: Click on the **Advanced** button and click on the link: **Proceed to ocpws.kee.vizuri.com (unsafe)**
    
B) You have three projects pre-created for you (*Under Home -> Projects on the left*)

* cicd-student{{ student_number }} - Tools needed for Trusted Supply Chain 
    * anchore - Container Scanning Service
    * anchoredb - Database for Anchore Container Scanning Service
    * jenkins - Jenkins
    * nexus - Nexus artifact reposigory
    * sonarqube - Code Quality Service
    * sonardb - Database for Code Quality Service
    
* dev-student{{ student_number }} - Development Project
    
* stage-student{{ student_number }} - Staging Project

> Note: Your codeready workspace will not appear until you complete the Codeready Steps Below.
    
<img src="../images/openshift_1.png" alt="jenkins_welcome" width="500">
## Jenkins

Jenkins provides the platform to execute oure Trusted Software Supply Chain CI/CD Pipelines.  


A) Confirm you can log into your jenkins console: <https://jenkins-cicd-student{{ student_number }}.{{ ocp_app_suffix }}> <a href="#0" target="_blank"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('https://jenkins-cicd-student{{ student_number }}.{{ ocp_app_suffix }}')" alt="copy-paste" width="20"></a>

When prompted Select 'Log in with OpenShift' 

<img src="../images/log-in-with-openshift.png">

   * Username: `student{{ student_number }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('student{{ student_number }}')" alt="copy-paste" width="20"></a>
   * Password: `{{ student_pwd }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('{{ student_pwd }}')" alt="copy-paste" width="20"></a>

     >Note: Click on the **Allow selected permissions** button the first time: 
     <img src="../images/jenkins_accept.png" alt="jenkins_accept" width="500"> 

B) Should see the message: 

<img src="../images/jenkins_welcome.png" alt="jenkins_welcome" width="200">

## Nexus

Nexus is an artifact repository that stores versioned build artifacts.  It is utilized to store the WAR archieve in our Trusted Software Supply Chain. 

A) Confirm you can navigate to nexus: <http://nexus-cicd-student{{ student_number }}.{{ ocp_app_suffix }}> <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('http://nexus-cicd-student{{ student_number }}.{{ ocp_app_suffix }}')" alt="copy-paste" width="20"></a>

B) Should see the message: 

<img src="../images/nexus_welcome.png" alt="nexus_welcome" width="400">

## Quay Registry 

Quay is an Enterprise Container Registry.  It is utilized to store and scan container images in our Trusted Software Supply Chain.

A) Confirm you can log into the Quay Container Registry: <https://quay.{{ ocp_app_suffix }}/repository> <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('https://quay.{{ ocp_app_suffix }}/repository')" alt="copy-paste" width="20"></a>

   * Username: `student{{ student_number }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('student{{ student_number }}')" alt="copy-paste" width="20"></a>
   * Password: `{{ student_pwd }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('{{ student_pwd }}')" alt="copy-paste" width="20"></a>

     >Note: Click on the **Advanced** button and click on the link: **Proceed to quay.apps.ocpws.kee.vizuri.com (unsafe)**

     >Note: If asked, you may have to confirm your username. So please click on the *Confirm Username* button when prompted
    
    
     <img src="../images/confirm_username.png" alt="confirm_username" width="500">
    
## SonarQube

SonarQube is a static code analyzer that is utilized to identify issues code issues in our Trusted Software Supply Chain.

A) Confirm you can log into the sonarqube console: <http://sonarqube-cicd-student{{ student_number }}.{{ ocp_app_suffix }}> <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('http://sonarqube-cicd-student{{ student_number }}.{{ ocp_app_suffix }}')" alt="copy-paste" width="20"></a>

   * Username: `admin` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('admin')" alt="copy-paste" width="20"></a>
   * Password: `admin`

   >Note: If you are prompted to enter a token just click on *Skip this tutorial* in the top right. 
   
   
    <img src="../images/skip_tutorial.png" alt="confirm_username" width="40%">
    
B) Should see the page: 

<img src="../images/sonarqube_welcome.png" alt="sonarqube_welcome" width="500">

## Gogs (git repositories) 

Gogs is a contaierized git repository.  It provides the code repository for our Trusted Software Supply Chain.

A) Confirm you can log into the gogs git server: <http://gogs.{{ ocp_app_suffix }}> <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('http://gogs.{{ ocp_app_suffix }}')" alt="copy-paste" width="20"></a>

Click the 'Sign In' Button.

   * Username: `student{{ student_number }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('student{{ student_number }}')" alt="copy-paste" width="20"></a>
   * Password: `{{ student_pwd }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('{{ student_pwd }}')" alt="copy-paste" width="20"></a>

B) You have one repository that we will use for the labs:

   * openshift-tasks - Web application that is orchestrated thourgh the Trusted Software Supply Chain

<img src="../images/gogs-1.png" alt="gogs" width="500">  

## Codeready Workspaces 

Codeready workspaces is a container based development environemtn.  It is utilized to develop the pipelines for the Trusted Software Supply Chain.

A) Confirm you can log into Code Ready Workspaces: <http://codeready-codeready.{{ ocp_app_suffix }}> <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('http://codeready-codeready.{{ ocp_app_suffix }}')" alt="copy-paste" width="20"></a>

   * Username: `student{{ student_number }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('student{{ student_number }}')" alt="copy-paste" width="20"></a>
   * Password: `{{ student_pwd }}` <a href="#0"><img src="../images/copy-paste.jpeg" onclick="copyToClipboard('{{ student_pwd }}')" alt="copy-paste" width="20"></a>


     >Note: Click on the **Allow selected permissions** button the first time: 
     <img src="../images/codeready_authorize.png" alt="jenkins_accept" width="500"> 

     >Note: Update Account Information the first time.  You can provide any email, first name and last name you would like:
     <img src="../images/codeready_account_info.png" alt="jenkins_accept" width="500">"

 B) Should see the page: 

<img src="../images/codeready_getting_started.png" alt="sonarqube_welcome" width="500">    

C) Create Your Workshop Workspace

Choose the 'Java Spring Boot Workshop' Template and Click on 'Create and Open' to launch your Workshop Workspace.

<img src="../images/codeready_create_workspace.png" alt="sonarqube_welcome" width="500">    

It will take a few minutes, but once your workspace has been created you should see this screen.

<img src="../images/codeready_workspace1.png" alt="sonarqube_welcome" width="500">    

Click on the Explorer Icon in the left navigation of the workspace.

<img src="../images/codeready_workspace2.png" alt="sonarqube_welcome" width="500">  

This will open the Explorer Window.  Verify you have the openshift-tasks project in your workspace.   This is the project you will working on to build your Trusted Software Supply Chain.

<img src="../images/codeready_workspace3.png" alt="sonarqube_welcome" width="500">  