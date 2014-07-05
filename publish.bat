:: 发布到github

@echo off

:: 用户名
set usr=lendfating
set BUILD_PATH=\workspace\lendfating.github.com

:: 支持utf-8编码
chcp 65001

:: 根据需要有针对的编译网站
set blog_type = %1
if defined blog_type (
	cd %blog_type%
	call jekyll build -d %BUILD_PATH%\%blog_type%
) else (
	cd study
	call jekyll build -d %BUILD_PATH%\study
	cd ../project
	call jekyll build -d %BUILD_PATH%\project
	cd ../other
	call jekyll build -d %BUILD_PATH%\other
)
cd ..

:: 如果有更新，则重新更新所有资源文件（图片等资源）
:: /D:m-d-y 复制在指定日期或指定日期以后更改的文件,如果没有提供日期，只复制那些源时间比目标时间新的文件。
:: /E 复制目录和子目录，包括空目录。
copy home.html %BUILD_PATH%\index.html
copy favicon.ico %BUILD_PATH%\favicon.ico
xcopy assets %BUILD_PATH%\assets\ /D/E/Y

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
