:: ������github

@echo off

:: �û���
set usr=lendfating

:: ֧��utf-8����
chcp 65001

:: ������Ҫ����Եı�����վ
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

:: ����и��£������¸���������Դ�ļ���ͼƬ����Դ��
:: /D:m-d-y ������ָ�����ڻ�ָ�������Ժ���ĵ��ļ�,���û���ṩ���ڣ�ֻ������ЩԴʱ���Ŀ��ʱ���µ��ļ���
:: /E ����Ŀ¼����Ŀ¼��������Ŀ¼��
copy home.html _site\index.html
copy favicon.ico _site\favicon.ico
xcopy assets _site\assets\ /D/E/Y

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
