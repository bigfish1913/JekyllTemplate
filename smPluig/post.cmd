@REM @Author: fuwei
@REM @Date:   2017-05-31 17:14:38
@REM @Last Modified by:   fuwei
@REM Modified time: 2017-06-02 13:25:30

@echo off

cd ..
git add .

git commit -m 'text'

git push origin gh-pages  

start http://blog.laofu.online

 