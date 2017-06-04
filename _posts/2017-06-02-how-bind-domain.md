---
layout: post
title: github Pages绑定域名
date: 2017-06-02
header-img: "img/home-bg.jpg"
tags:
     - github 
     - 域名
author: '老付'
---
 
网站已经有了，需要对网站来绑定一个自己的个性域名,本人是买了一个阿里云的域名,也就是现在正在使用的laofu.online。当然这个是主域名，我们需要是是一个带有含义的二级域名，这里我添加一个blog.laofu.online的域名。

#### 映射记录的添加       

  买了域名后,阿里云会有一个后台,这里我们需要把现在的域名转发到我们github-pages所生成的网站。这里我们只需要添加一个CName的记录就可以了，设置如下：  


   ![domain](/img/assets/domain.png)    


#### github添加CName文件   

   域名的跳转是双向的，我可以转发给你，你也要在服务器上面绑定打指定的域名才行，这个就可以在github的gh-pages的根目录下添加一个CName的文件，文件是你的二级域名,github会自动绑定CName中的域名。    

   ![domain](/img/assets/CName.png)         
   

   ![domain](/img/assets/CName1.png)    


