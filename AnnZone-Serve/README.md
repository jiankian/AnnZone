**服务端使用方法：**

请先了解act框架
[http://actframework.org/](http://actframework.org/)

console包下面的控制器为API的接口

打开项目：

IDEA下开发的，IDEA打开项目根目录下的`pom.xml`，然后`Open As Project`即可

MySQL数据库导入 数据库 导入最新的日期的文件名的sql即可

数据库文件在项目`根目录/db_export/mysql/{db name}_{date}.sql`

在配置文件`db.properties` 配置好数据库的用户名和密码 jdbc配置


默认的超级管理员用户：

 1. 用户名：jiankian 密码：**（作者本人的账户）
 2. 用户名：admin 密码：admin888 
 
 修改jiankian用户，自己看源码密码的生成方式，数据库替换下就行了！权限都是一样的，现在的版本仅仅考虑单用户登录，但是权限机制有保留，后面慢慢把用户权限拆分开
 
使用了jjwt库作为Token身份认证系统，Act框架新版本内置了更方便的jwt机制，但是如果同时使用了模板引擎和session，会出现session跨方法时候就丢失了，我们网页版不可能把每次浏览器的请求都包含Token进去吧？

**数据库操作没法插入emoji**


[http://blog.csdn.net/tongsh6/article/details/52292336](http://blog.csdn.net/tongsh6/article/details/52292336)