# Final Project

### KH정보교육원 수료 ###
### 작성자 : 이진솔 ###
### 교육기간 2020년 07월 16일 ~ 2021년 01월 18일 ### 


</br></br>
# 온라인 도서 사이트 개발 #

  * 기획의도
    * 언택트시대에 온라인도서의 비중이 늘면서 
      기존의 방식보다 효율적인 도서판매사이트를        
      만들고자 함.
      
   ![SWOT 분석](https://github.com/qlrtyx0361/KH_FinalProject/blob/master/SWAT.PNG)



# ![개발일정](https://github.com/qlrtyx0361/KH_FinalProject/blob/master/DATE.PNG)
</br></br>

# Tech Stack #
![](https://github.com/qlrtyx0361/KH_FinalProject/blob/master/tool.PNG)
</br>
### - 사용 언어 : JAVA, JavaScript, Ajax
### - 툴 : Spring, Oracle, SQLDeveloper
### - 서버 : apache Tomcat , JSP
### - 홈페이지는 HTML기반이며 디자인은 css
### - 라이브러리 : Jquery, myBaits, Maven
### - 형상관리 : github
</br></br>

# ERD_DB #

![ERD1](https://user-images.githubusercontent.com/73675217/105877437-57f9dc00-6043-11eb-9dc8-f8331436273f.png)

![image](https://user-images.githubusercontent.com/73675217/105878696-a65baa80-6044-11eb-9ad6-fbd72b4cf7cc.png)

![image](https://user-images.githubusercontent.com/73675217/105878862-d4d98580-6044-11eb-8dd4-65642272b21b.png)

![image](https://user-images.githubusercontent.com/73675217/105878912-e4f16500-6044-11eb-9b5d-b93f705b8597.png)

</br></br>
## 회원가입 작성 시연입니다.
</br>
![회원가입](https://user-images.githubusercontent.com/73675217/105881170-85488900-6047-11eb-80de-5febd79bf71d.gif)

## 도서 등록 작성 시연입니다.
</br>
![도서등록](https://user-images.githubusercontent.com/73675217/105883651-6e576600-604a-11eb-89b7-c99685a24c3a.gif)

## 문의 게시판 작성 시연입니다.
</br>
![문의게시판](https://user-images.githubusercontent.com/73675217/105883681-77e0ce00-604a-11eb-9772-e67966c666a4.gif)

## MyPage 작성 시연입니다.
</br>
![마이페이지](https://user-images.githubusercontent.com/73675217/105884766-a7dca100-604b-11eb-9219-212fae71ebde.gif)


You can also:
  - Import and save files from GitHub, Dropbox, Google Drive and One Drive
  - Drag and drop markdown and HTML files into Dillinger
  - Export documents as Markdown, HTML and PDF

Markdown is a lightweight markup language based on the formatting conventions that people naturally use in email.  As [John Gruber] writes on the [Markdown site][df1]

> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

### Tech

Dillinger uses a number of open source projects to work properly:

* [AngularJS] - HTML enhanced for web apps!
* [Ace Editor] - awesome web-based text editor
* [markdown-it] - Markdown parser done right. Fast and easy to extend.
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [node.js] - evented I/O for the backend
* [Express] - fast node.js network app framework [@tjholowaychuk]
* [Gulp] - the streaming build system
* [Breakdance](https://breakdance.github.io/breakdance/) - HTML to Markdown converter
* [jQuery] - duh

And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.

### Installation

Dillinger requires [Node.js](https://nodejs.org/) v4+ to run.

Install the dependencies and devDependencies and start the server.

```sh
$ cd dillinger
$ npm install -d
$ node app
```

For production environments...

```sh
$ npm install --production
$ NODE_ENV=production node app
```

### Plugins

Dillinger is currently extended with the following plugins. Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| Dropbox | [plugins/dropbox/README.md][PlDb] |
| GitHub | [plugins/github/README.md][PlGh] |
| Google Drive | [plugins/googledrive/README.md][PlGd] |
| OneDrive | [plugins/onedrive/README.md][PlOd] |
| Medium | [plugins/medium/README.md][PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md][PlGa] |


### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantaneously see your updates!

Open your favorite Terminal and run these commands.

First Tab:
```sh
$ node app
```

Second Tab:
```sh
$ gulp watch
```

(optional) Third:
```sh
$ karma test
```
#### Building for source
For production release:
```sh
$ gulp build --prod
```
Generating pre-built zip archives for distribution:
```sh
$ gulp build dist --prod
```
### Docker
Dillinger is very easy to install and deploy in a Docker container.

By default, the Docker will expose port 8080, so change this within the Dockerfile if necessary. When ready, simply use the Dockerfile to build the image.

```sh
cd dillinger
docker build -t joemccann/dillinger:${package.json.version} .
```
This will create the dillinger image and pull in the necessary dependencies. Be sure to swap out `${package.json.version}` with the actual version of Dillinger.

Once done, run the Docker image and map the port to whatever you wish on your host. In this example, we simply map port 8000 of the host to port 8080 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
docker run -d -p 8000:8080 --restart="always" <youruser>/dillinger:${package.json.version}
```

Verify the deployment by navigating to your server address in your preferred browser.

```sh
127.0.0.1:8000
```

#### Kubernetes + Google Cloud

See [KUBERNETES.md](https://github.com/joemccann/dillinger/blob/master/KUBERNETES.md)


### Todos

 - Write MORE Tests
 - Add Night Mode

License
----

MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>


