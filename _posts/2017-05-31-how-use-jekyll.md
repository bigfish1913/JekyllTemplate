---
layout: post
title: 如何搭建免费博客
date: 2017-05-31
header-img: "img/home-bg.jpg"
tags:
     - jekyll
     - github
author: '老付'
---


对于经常写博客的人,都很想拥有一个属于自己的独立博客，但一个独立的博客可能需要以下几个东西：

> 1. 域名  
> 2. 一个前端的模板  
> 3. 一个后台的管理 
> 4. 一个数据库
> 5. 部分的统计和其它模块

这样的话，我们的精力可能都了要放到博客的管理上面，而不是博客的内容。 随着github的出现，这样问题出现了改观，使用gitbub提供的github pages功能可以提供一个独立的站点供我们使用。结合相关的域名配置，我们就可以很方便的搭建属于自己的博客平台。

### github Pages的使用      



#### 概述   	

   对于开发者来说github是很熟悉的,是一个托管代码和开源的网站.如果你想找一个开源的项目,首先看到的可能是一个源码的列表，这样对于项目的展示不够直观，github pages就是为也解决这个问题而出现，允许开发者自定义一个展示页面，来替代原有的代码列表。

#### 具体的规则    

   
   在github的项目中，创建一个gh-pages的分支，分支创建完成后就可以使用http://{userName}.github.io/{projectName}来进行访问。更详细参见：[github Pages](https://pages.github.com/){:target="_blank"}

#### 一个实例 	

  1. 创建一个项目,并对项目进行初始化,运行以下命令    

	  ``` bash   
	    
	    mkdir gitDemo #创建一个目录

	    cd gitDemo 

	    git init  #git 初始化

	    git checkout  --orphan gh-pages # 创建gh-pages分支。

	  ```    	
  2. 进行gitDemo文件夹,添加一个html文件,index.html,添加如下内容：   

	  ```  html   
	 	<h1>Hello github Pages!!</h1>
	  ```
   

  4. 在github上面添加一个Repositories,名为blogTest    


  5. 把项目推送到分支，执行以下命令：

	  ``` bash	

	  git add . 

	  git commit -m 'first' 

	  git remote add origin https://github.com/{userName}/blogTest   

	  git push origin gh-pages

	  ```     

  大约等待2min后，访问https://{userName}.github.io/blogTest/index.html，看到如下效果：    


  ![gh-pages](/img/assets/gh-pages.png)
  
--------------------------   
#### 总结一下 	  

   对于上面所述的github Pages(**以下称gh-Pages**)是github给用户提供一个**"静态页面的web服务器"**,我们可以根据需要把页面上传到指定的仓库中，可以通过github的规则来完成访问。到这里，不禁有一个疑问，gh-Pages虽然给了一个可以展示html平台，写博客如果全部都写html，那我们还要精力去调整样式和布局的问题.再者博客也要有评论功能，这两个问题如何解决？


### jekyll 模板      

   jekyll 是基于ruby来编写的一个博客模板生成工具,也就是说我们可以根据相关的规则来生成对应的html文件，当然这份工作github也能帮你去做。详细介绍参见[jekyll官方文档](https://jekyllrb.com/){:target="_blank"}。

#### jekyll安装  

   jekyll的安装可以参见 	

   [windows安装Jekyll](https://jekyllrb.com/docs/windows/#installation){:target="_blank"} |[linux和MacOS安装Jekyll](https://jekyllrb.com/docs/installation/){:target="_blank"}
   	
#### jekyll使用       

   1. jekyll 安装是否成功，首先看下jekyll的版本,执行:		

	   ``` bash 
	   jekyll --version     

	   ```      

       ![jekyllversion](/img/assets/jekyllVersion.png)          


   2. 创建jekyll的指定目录    	

      ``` bash     
      mkdir _posts     

      mkdir _layout   

      echo  >>_config.yml  

      ```  

   3. 在_layout下创建一个default.html,作为一个网站的模板,添加如下内容（此处代码中的所有的{ {中间都有一个空格,为了不让jekyll去解析,拷贝的时候请注意）：  

	   ``` html 
		　<!DOCTYPE html>
		　　<html>
		　　<head>
		　　　　<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		　　　　<title>{ { page.title} }</title>
		　　</head>
		　　<body>

		　　　　{ { content } }

		　　</body>
		　　</html>

	   ```      

      jekyll的支持Liquid 语法,详细参见:[Liquid for Designers](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers){:target="_blank"}


   4. 进入_posts创建一个markdown文件或者是html文件，文件名格式必须是：年-月-日-xxxx.md   

	    ```  html    
			     
		  　---
		　　layout: default
		　　title: Hello Jekyll
		　　---
		　　<h2>{ { page.title } }</h2>
		　  <h3> Hello jekyll </h3>


	    ```          


   5. 创建首页，首页是为了显示文章列表的网页，我们需要做的是遍历_post文件夹中的所有文章，然后展现出来,添加简单的代码如下：     

		 ``` html  	
		  　---
		　　layout: default
		　　title: My Blog
		　　---
		　　<h2>{ { page.title } }</h2>
		　　<p>最新文章</p>
		　　<ul>
		　　　　{ % for post in site.posts % }
		　　　　　　<li>{ { post.date | date_to_string } } <a href="{ { site.baseurl } }{ { post.url } }">{ { post.title } }</a></li>
		　　　　{ % endfor % }
		　　</ul>
		``` 
   6. 编译和运行，一切都准备好后，开始编译和生成我们的网站：    

		 ``` bash       

		  jekyll build   # 生成_site目录         


		  jekyll server  # 生成并启动一个server,127.0.0.1:4000可以访问本地的目录。 	

		 ```       
		 在浏览器中打开127.0.0.1:4000可以看到刚刚生成的网站：

   		 ![my blog](/img/assets/blogTest.png)  		
   		 ![my blog](/img/assets/firstBlog.png)     		


   7. 到这里，我们使用jekyll根据我们写的模板生成了对应的静态页面,下面我们把数据传入到github的gh-pages下面。  		

         ``` bash     

	       git add .

	       git commit -m 'myblog'   

	       git push origin gh-pages 	

         ```       


等待2min后，github 会根据我们上传的模板把数据生成到对应的分支上面. 开始你的博客之旅！


    





