---
layout: post
title: 一个jekyll模板的推荐
date: 2017-06-04
header-img: "img/home-bg.jpg"
tags:
     - jekyll
author: '老付'
---



本人用的模板是基于Codeboy的博客模板改造[模板](https://github.com/fuwei199006/CodeboyBlog){:target="_blank"},(由于本人可能会有很多样式修改,所以不再将修改pullrequst到原项目,在此对codeboy模板表示感谢)。功能改造如下：

 
#### 添加微信支付宝打赏    

这里也是一个开源的项目，[项目地址](https://github.com/greedying/tctip),使用很方便，直接引用到项目中，配置下就可了：   

``` html
<script>
window.tctipConfig = {
        staticPrefix:   "http://static.tctip.com",
        buttonImageId:  1,
        buttonTip:  "zanzhu",
        list:{
            alipay: {qrimg: "http://blog.laofu.online/img/assets/o_zhifubao.png"},
            weixin:{qrimg: "http://blog.laofu.online/img/assets/o_weixin.png"}, 
        }
};
</script>

<script src="http://static.tctip.com/js/tctip.min.js"></script>
``` 

   ![weixin](/img/assets/weixin.png)

#### 百度流量监控   

为了查看个人的博客的人气，添加了百度的统计模块，可以方便的看到博客的pv/uv.[注册地址](https://tongji.baidu.com/web/welcome/login){:target="_blank"}    

![static](/img/assets/statics.png)     

具体的添加方式如下 ：

 1. 在_incluides文件夹下添加一个baidu_analyze.html的文件,内容如下       

	 ``` html   
	 {% raw %}
	{%if site.baidu_analyze %}
	<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?{{site.baidu_analyze}}";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	</script>

	{% endif %}
	{% endraw %}
	 ```      
   {% raw %}{{site.baidu_analyze}} {% endraw %} 是一个变量，可以把你申请的baidu的key值作为_config.yml的配置值存储下来。

2. 下面只需要保证所有的post生成都能包含这个html就可以了 ，我的选择是在head里面中把baidu_analyze.html包含进去：  

  ![head](/img/assets/baidu_analyze.png)    

#### 添加thickbox插件       

这个插件是一个图片的浏览插件,[thickbox官方网站](http://codylindley.com/thickbox/){:target="_blank"}。首先先引入对应的js ,具体的使用是在img的标签上包含一个a标签,这个动作可以使用jQuery方便的实现：   

  ``` js       

	<script type="text/javascript">
	    
	  (function(){
	        $("article img").each(function(index,value){

	            var aDom=$("<a></a>").attr({"href":$(value).attr("src")+"?inlineId=myOnPageContent"}).addClass("thickbox");
	            $(value).wrap(aDom);

	        });
	    })();
	</script>

  ```     
  thickbox的演示后的效果:

  ![thickbox](/img/assets/thickbox.png)

#### 其它样式问题
- 图片的样式由由居中改成居左   

- 去除代码行号样式错乱问题