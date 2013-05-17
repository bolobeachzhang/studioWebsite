+##关于StudioWebsite
+---
+ StudioWebsite四川省模式识别与智能信息处理工作室网站，是一个基于实验室类型的网站，有论文，成果，以及教师和学生管理，包含上传或者下载。
+##获取源码
+
+---
+
+通过[http://bolobeachzhang.github.io/studioWebsite/)获取源码。
+
+##环境要求：
+
+---
+
+* php5.1.2及以上版本。
+* 可发布的web环境，apache或aginx
+
+##开始我们的helloworld之旅
+
+---
+
+###创建应用目录文件
+
+我们在web的根目录（`/var/www`或者其他地方）创建一个文件夹，命名为helloworld。将下载好的框架解压并放到该应用目录下。创建好的目录结构如下：
+
+  /var/www/helloworld/
+  wind/                      框架目录
+  controller/                    应用控制器目录，业务代码放在该目录下
+  controller/IndexController.php    默认访问的应用控制器
+  template/                    页面模板目录
+  template/index.htm              模板文件
+  index.php                    入口脚本文件
+
+
+###编辑入口脚本index.php
+
+在应用目录下创建入口脚本index.php，它的主要工作是加载框架并启动应用。代码如下：
+
+  require_once ('../../wind/Wind.php');
+  Wind::application()->run();
+
+*PS:当然也可以同时在index.php中设置错误级别，WIND_DEBUG模式等。相关内容后面会介绍*
+
+###创建IndexController.php
+
+在应用目录下创建controller/目录。controller目录是windframework默认定义的应用控制器存放的目录，我们也可以通过手动配置的方式来改变应用的访问路径。在我们创建的 controller/ 目录下创建IndexController.php类文件。文件内容如下：
+
+  <?php
+  /**
+  * the last known user to change this file in the repository  <$LastChangedBy: long.shi $>
+  * @author Qiong Wu <papa0924@gmail.com>
+  * @version $Id: IndexController.php 2806 2011-09-23 03:28:55Z long.shi $
+  * @package 
+  */
+  class IndexController extends WindController {
+
+    public function run()  {
+      echo 'hello world';
+    }
+  }
+  ?>
+
+*在windframework中文件名和类名是相同的，这一点有点类似于java。windframework提供了两个应用控制器的类型‘WindSimpleController’，‘WindController’。在这里我们继承自‘WindController’，这两个应用控制器的区别，在后面会具体介绍。*
+
+至此，我们的`hello world` 应用已经完成。快通过浏览器访问下我们的`hello world`吧:
+
+  http://localhost/helloworld/index.php 