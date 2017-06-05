
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


[github地址](https://github.com/fuwei199006/JekyllTemplate){:target="_blank"}
