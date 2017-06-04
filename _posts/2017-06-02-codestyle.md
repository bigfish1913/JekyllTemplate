---
layout: post
title: 测试模板中的代码样式
date: 2017-06-02
header-img: "img/home-bg.jpg"
tags:
     - test
author: '老付'
---
  

#### bash

``` bash     

git add .

git commit -m 'fix' 

git push 

```     
#### html 

``` html  

    <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">老付</a>
        </div>
 
```   

#### js 
``` js   
(function(){
   alert("ok");
})();
 

```  
 
#### C\# 
``` C# 

static void Main(string [] args){
	

	console.write("ok");
}

```    

#### ptyhon 

``` python 
class student(object):
    def __init__(self, name,score):
        self.name=name
        self.score=score
    def print_score(self):
        print('%s:%s' % (self.name,self.score))

bart=student("fuwei",90)
bart.print_score()
print(type(bart))
print(isinstance(bart,student))

```  