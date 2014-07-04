:: 发布到github

@echo off

:: 用户名
set usr=lendfating

:: 支持utf-8编码
chcp 65001

:: 根据需要有针对的编译网站
set blog_type = %1
if defined blog_type (
	cd %blog_type%
	call jekyll build
) else (
	cd study
	call jekyll build
	cd ../project
	call jekyll build
	cd ../other
	call jekyll build
)
cd ..

:: 如果有更新，则重新更新所有资源文件（图片等资源）
:: /D:m-d-y 复制在指定日期或指定日期以后更改的文件,如果没有提供日期，只复制那些源时间比目标时间新的文件。
:: /E 复制目录和子目录，包括空目录。
copy home.html _site\index.html
copy favicon.ico _site\favicon.ico
xcopy assets _site\assets\ /D/E/Y

:: 如果编译或拷贝出错，直接跳出
if %errorlevel% NEQ 0  exit

:: 如果以上都没有问题就发布网站
:: cd _site
:: call git init
:: call git add .
:: call git commit -m "updated site %date:~,4%%date:~5,2%%date:~8,2%"
:: call git remote add origin git@github.com:!usr!/!usr!.github.com.git
:: call git remote set-url origin git@github.com:!usr!/!usr!.github.com.git
:: call git push origin master --force
