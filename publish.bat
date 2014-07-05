:: ������github

@echo off

:: �û���
set usr=lendfating
set BUILD_PATH=\workspace\lendfating.github.com

:: ֧��utf-8����
chcp 65001

:: ������Ҫ����Եı�����վ
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

:: ����и��£������¸���������Դ�ļ���ͼƬ����Դ��
:: /D:m-d-y ������ָ�����ڻ�ָ�������Ժ���ĵ��ļ�,���û���ṩ���ڣ�ֻ������ЩԴʱ���Ŀ��ʱ���µ��ļ���
:: /E ����Ŀ¼����Ŀ¼��������Ŀ¼��
copy home.html %BUILD_PATH%\index.html
copy favicon.ico %BUILD_PATH%\favicon.ico
xcopy assets %BUILD_PATH%\assets\ /D/E/Y

:: �������򿽱�����ֱ������
if %errorlevel% NEQ 0  exit

:: ������϶�û������ͷ�����վ
:: cd _site
:: call git init
:: call git add .
:: call git commit -m "updated site %date:~,4%%date:~5,2%%date:~8,2%"
:: call git remote add origin git@github.com:!usr!/!usr!.github.com.git
:: call git remote set-url origin git@github.com:!usr!/!usr!.github.com.git
:: call git push origin master --force
