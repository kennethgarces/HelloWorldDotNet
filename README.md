
# HelloWorldDotNet

https://github.com/kennethgarces/HelloWorldDotNet

Example .NET package

Created by Kenneth Garces

### Build Status

The current build is V1.0

### Run.sh

Script can be invoked by running Run.sh

### Description

You will specify the build steps in the Jenkins file (dotnet run build step 1, build step2, build step 3, build step4).  Message Hello World will confirm successful execution and display build steps.  Example.  dotnet run build unit test deploy

### Result/Test

Script/build steps were meant to log an output file that we can run unit testing on.  Unit testing will determine if deploying Test is true.  Then additional testing to confirm Prod deploy.

### Setup Jenkins

Runbook

//Install Jenkins on MacOS

//Install Java 1.8 (pre-req)

$brew cask install homebrew/cask-versions/adoptopenjdk8

$brew install jenkins-lts

//Start jenkins

$jenkins-lts

//Confirm port 8080 is responding

$telnet loclahost 8080

//Unlock Jenkins

Visit in browser http://localhost:8080/

Enter unlock code "e68546784caa4eefa03a2b2abb878ec4" into browser prompt

Setup first user 'kgarces'

Start using Jenkins at http://localhost:8080/

## Setup Jenkinsfile

//Setup jenkins file in Repository

```
pipeline {
    agent { docker { image 'maven:3.3.3' } }
    stages {
        stage('build') {
            steps {
                sh 'mvn --version'
            }
        }
    }
}
```

//Setup Pipeline name and Multibranch Pipeline

//Connect Github and Save changes

```
Started by user Kenneth
[Fri Jan 24 18:55:29 PST 2020] Starting branch indexing...
18:55:29 Connecting to https://api.github.com with no credentials, anonymous access
18:55:29 GitHub API Usage: Current quota has 43 remaining (4 under budget). Next quota of 60 in 37 min
Examining kennethgarces/kenneth-garces

  Checking branches...
18:55:29 GitHub API Usage: Current quota has 43 remaining (4 under budget). Next quota of 60 in 37 min

  Getting remote branches...

    Checking branch master
18:55:29 GitHub API Usage: Current quota has 43 remaining (4 under budget). Next quota of 60 in 37 min

  Getting remote pull requests...
      ‘Jenkinsfile’ found
    Met criteria
No changes detected: master (still at c6cd8259d54157bc93c64b2afa31e86be10ba52b)
18:55:30 GitHub API Usage: Current quota has 43 remaining (4 under budget). Next quota of 60 in 37 min

  1 branches were processed

  Checking pull-requests...

  0 pull requests were processed

Finished examining kennethgarces/kenneth-garces

[Fri Jan 24 18:55:30 PST 2020] Finished branch indexing. Indexing took 0.63 sec
Finished: SUCCESS
```

### Setup Build, Test and Deploy Steps in Pipeline

//Add multiple steps

pipeline {
    agent { docker { image 'maven:3.3.3' } }
    stages {
        stage('Build') {
            steps {
                sh 'mvn --version'
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

//Scan repo

```
Started by user Kenneth
[Fri Jan 24 19:03:01 PST 2020] Starting branch indexing...
19:03:01 Connecting to https://api.github.com with no credentials, anonymous access
19:03:02 GitHub API Usage: Current quota has 42 remaining (8 under budget). Next quota of 60 in 29 min
Examining kennethgarces/kenneth-garces

  Checking branches...
19:03:02 GitHub API Usage: Current quota has 42 remaining (8 under budget). Next quota of 60 in 29 min

  Getting remote branches...

    Checking branch master
19:03:02 GitHub API Usage: Current quota has 41 remaining (7 under budget). Next quota of 60 in 29 min

  Getting remote pull requests...
      ‘Jenkinsfile’ found
    Met criteria
Changes detected: master (c6cd8259d54157bc93c64b2afa31e86be10ba52b → 2182952ed2991977e64184311f8af584dbd252f2)
Scheduled build for branch: master
19:03:02 GitHub API Usage: Current quota has 40 remaining (6 under budget). Next quota of 60 in 29 min

  1 branches were processed

  Checking pull-requests...

  0 pull requests were processed

Finished examining kennethgarces/kenneth-garces

[Fri Jan 24 19:03:02 PST 2020] Finished branch indexing. Indexing took 1.1 sec
Finished: SUCCESS
```

## Troubleshoot Docker issues

```
Started by user Kenneth
19:18:52 Connecting to https://api.github.com using kennethgarces/******
Obtained Jenkinsfile from 19b2d733bcb2bdb56455135813942d402cd519b4
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /Users/kgarces-sa/.jenkins/workspace/Kenneth_Garces_Pipeline_master
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
using credential a78e6b04-cc65-4176-9ac2-97abddfd17b5
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/kennethgarces/kenneth-garces.git # timeout=10
Fetching without tags
Fetching upstream changes from https://github.com/kennethgarces/kenneth-garces.git
 > git --version # timeout=10
using GIT_ASKPASS to set credentials 
 > git fetch --no-tags --force --progress -- https://github.com/kennethgarces/kenneth-garces.git +refs/heads/master:refs/remotes/origin/master # timeout=10
Checking out Revision 19b2d733bcb2bdb56455135813942d402cd519b4 (master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 19b2d733bcb2bdb56455135813942d402cd519b4 # timeout=10
Commit message: "Update Jenkinsfile"
 > git rev-list --no-walk 19b2d733bcb2bdb56455135813942d402cd519b4 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] isUnix
[Pipeline] sh
+ docker inspect -f . maven:3.3.3

Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
[Pipeline] isUnix
[Pipeline] sh
+ docker pull maven:3.3.3
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline

GitHub has been notified of this commit’s build result

ERROR: script returned exit code 1
Finished: FAILURE
```

To fix run as elevated user: 

```
brew cask install docker
```

Still could not start docker daemon

Ran $brew install docker-machine docker

Ran $brew cask install virtualbox

```
docker-machine create --driver virtualbox default
```


Verify docker ps works:

$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

### Updating Jenkinsfile

```
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Hello World"'
                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''
            }
        }
    }
}
```

## Runbook steps

- Create DotNetProject in Jenkins
- Create Pipeline script
1. Bat for Windows
2. Configure Git
3. Use Jenkins "Generate pipeline script"
	1. Git repo
	2. Windows bat
  
  ## Setup Docker
  
$docker network create jenkins
$docker volume create jenkins-docker-certs
$docker volume create jenkins-docker-certs

//setup docker:dind

docker container run --name jenkins-docker --rm --detach --privileged --network jenkins --network-alias docker --env DOCKER_TLS_CERTDIR=/certs --volume jenkins-docker-certs:/certs/client --volume jenkins-data:/var/jenkins_home --volume "%HOMEDRIVE%%HOMEPATH%":/home docker:dind

//Setup jenkins blueocean

docker container run --name jenkins-blueocean --rm --detach --network jenkins --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --volume jenkins-data:/var/jenkins_home --volume jenkins-docker-certs:/certs/client:ro --volume "%HOMEDRIVE%%HOMEPATH%":/home --publish 8080:8080 --publish 50000:50000 jenkinsci/blueocean


## Setup DotNet Pipeline

Setup Pipeline
Pipeline Script w/ SCM

## Runbook changes/steps

Jenkins configured

Jenkinsfile

Build

Test / Automation

Deploy


## Working Pipeline Steps

pipeline {
         agent any
         stages {
                 stage('Build') {
                 steps {
                     echo 'Hi, this is Kenneth'
                 }
                 }
                 stage('Test') {
                 steps {
                    input('Do you want to proceed?')
                 }
                 }
                 stage('Deploy') {
                 when {
                       not {
                            branch "master"
                       }
                 }
                 steps {
                       echo "End"
                 }
                 }

              }
}


docker-machine create

docker-machine ls"


## msbuild

dotnet build

## dotnet prereqs

https://dotnet.microsoft.com/learn/dotnet/hello-world-tutorial/intro

Install dot net pre req

Create project

Running 'dotnet restore' on myDotNetApp/myDotNetApp.csproj...
  Restore completed in 133.85 ms for /Users/kgarces-sa/projdotnet/library/myDotNetApp/myDotNetApp.csproj.

Restore succeeded.


## Setup Jenkins

Runbook

//Install Jenkins on MacOS

//Install Java 1.8 (pre-req)

$brew cask install homebrew/cask-versions/adoptopenjdk8

$brew install jenkins-lts

//Start jenkins

$jenkins-lts

//Confirm port 8080 is responding

$telnet loclahost 8080

//Unlock Jenkins

Visit in browser http://localhost:8080/

Enter unlock code "e68546784caa4eefa03a2b2abb878ec4" into browser prompt

Setup first user 'kgarces'

Start using Jenkins at http://localhost:8080/

## Error message / current state 

Started by user Kenneth
Obtained Jenkinsfile from git https://github.com/kennethgarces/kenneth-garces-dot-net
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /Users/kgarces-sa/.jenkins/workspace/DOTNET PIPELINE
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
using credential 25a1b49f-8343-4a54-92ff-f8bb4ef18846
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/kennethgarces/kenneth-garces-dot-net # timeout=10
Fetching upstream changes from https://github.com/kennethgarces/kenneth-garces-dot-net
 > git --version # timeout=10
using GIT_ASKPASS to set credentials 
 > git fetch --tags --force --progress -- https://github.com/kennethgarces/kenneth-garces-dot-net +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 5956f81fc004cc762769237f5f9e1b4f201a6e26 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 5956f81fc004cc762769237f5f9e1b4f201a6e26 # timeout=10
Commit message: "Jenkins file"
 > git rev-list --no-walk a246c8b251ff0eb831e664370e175ac8426c38d6 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] sh
+ dotnet build /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/DotNetHelloWorld.csproj
Microsoft (R) Build Engine version 16.4.0+e901037fe for .NET Core
Copyright (C) Microsoft Corporation. All rights reserved.

/usr/local/share/dotnet/sdk/3.1.101/NuGet.targets(123,5): error : Access to the path '/Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/obj/DotNetHelloWorld.csproj.nuget.dgspec.json' is denied. [/Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/DotNetHelloWorld.csproj]
/usr/local/share/dotnet/sdk/3.1.101/NuGet.targets(123,5): error :   Permission denied [/Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/DotNetHelloWorld.csproj]

Build FAILED.

/usr/local/share/dotnet/sdk/3.1.101/NuGet.targets(123,5): error : Access to the path '/Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/obj/DotNetHelloWorld.csproj.nuget.dgspec.json' is denied. [/Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/DotNetHelloWorld.csproj]
/usr/local/share/dotnet/sdk/3.1.101/NuGet.targets(123,5): error :   Permission denied [/Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/DotNetHelloWorld.csproj]
    0 Warning(s)
    1 Error(s)

Time Elapsed 00:00:00.57
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Unit)
Stage "Unit" skipped due to earlier failure(s)
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test)
Stage "Test" skipped due to earlier failure(s)
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy)
Stage "Deploy" skipped due to earlier failure(s)
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
ERROR: script returned exit code 1
Finished: FAILURE


## Build successful on local

$ ./run.sh
Process .NET pipeline has started!!!.
Microsoft (R) Build Engine version 16.4.0+e901037fe for .NET Core
Copyright (C) Microsoft Corporation. All rights reserved.

  Restore completed in 24.48 ms for /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/DotNetHelloWorld.csproj.
  DotNetHelloWorld -> /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/bin/Debug/netcoreapp3.1/DotNetHelloWorld.dll

Build succeeded.
    0 Warning(s)
    0 Error(s)

Time Elapsed 00:00:00.83

$ ./run.sh
Process .NET pipeline has started!!!.
Microsoft (R) Build Engine version 16.4.0+e901037fe for .NET Core
Copyright (C) Microsoft Corporation. All rights reserved.

  Restore completed in 26.19 ms for /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/DotNetHelloWorld.csproj.
  DotNetHelloWorld -> /Users/kgarces/Projects/HelloWorldDotNet/DotNetHelloWorld/DotNetHelloWorld/bin/Debug/netcoreapp3.1/DotNetHelloWorld.dll

Build succeeded.
    0 Warning(s)
    0 Error(s)

Time Elapsed 00:00:00.86
Pipeline step 1 is build
Pipeline step 2 is unit
Pipeline step 3 is test
Pipeline step 4 is deploy
Hello World!!!!
