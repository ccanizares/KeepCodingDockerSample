# Keep Coding Asp.Net Core Docker Sample
Fake Microservices scenario dev in asp.net core 1.0, just to practice with docker-compose. 

This sample is developed just for playing with docker-compose and asp.net core. Is developed in asp.net core 1.0 and project.json project type so it couldn't be openned with Visual Studio 2017, you need Visual Studio 2015 update 3 or Visual Studio Code. 

1 - You need to install <a href='https://docs.docker.com/docker-for-windows/install/'>docker windows</a>. <br>
2 - Install a version of asp.net core sdk that supports project.json (previous to 1.1). If you download a different sdk version than 1.0.0-preview2-003131 you have to specify the version you want to use at global.json file that is located in the root of this solution.<br>
3 - I've used the default template in VS for asp.net mvc that still uses bower..., so you need to install globally npm install -g bower<br>
4 - Run build-images.ps1. <br>
5 - Open power shell command line and write docker-compose up. <br>
<br>
Build and Compose:
<img src='https://github.com/ccanizares/KeepCodingDockerSample/blob/master/assets/build.png' />

Go to <a href='http://localhost:5000'>http://localhost:5000</a>
<img src='https://github.com/ccanizares/KeepCodingDockerSample/blob/master/assets/web.png' />

