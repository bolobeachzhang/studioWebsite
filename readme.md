+##����StudioWebsite
+---
+ StudioWebsite�Ĵ�ʡģʽʶ����������Ϣ����������վ����һ������ʵ�������͵���վ�������ģ��ɹ����Լ���ʦ��ѧ�����������ϴ��������ء�
+##��ȡԴ��
+
+---
+
+ͨ��[http://bolobeachzhang.github.io/studioWebsite/)��ȡԴ�롣
+
+##����Ҫ��
+
+---
+
+* php5.1.2�����ϰ汾��
+* �ɷ�����web������apache��aginx
+
+##��ʼ���ǵ�helloworld֮��
+
+---
+
+###����Ӧ��Ŀ¼�ļ�
+
+������web�ĸ�Ŀ¼��`/var/www`���������ط�������һ���ļ��У�����Ϊhelloworld�������غõĿ�ܽ�ѹ���ŵ���Ӧ��Ŀ¼�¡������õ�Ŀ¼�ṹ���£�
+
+  /var/www/helloworld/
+  wind/                      ���Ŀ¼
+  controller/                    Ӧ�ÿ�����Ŀ¼��ҵ�������ڸ�Ŀ¼��
+  controller/IndexController.php    Ĭ�Ϸ��ʵ�Ӧ�ÿ�����
+  template/                    ҳ��ģ��Ŀ¼
+  template/index.htm              ģ���ļ�
+  index.php                    ��ڽű��ļ�
+
+
+###�༭��ڽű�index.php
+
+��Ӧ��Ŀ¼�´�����ڽű�index.php��������Ҫ�����Ǽ��ؿ�ܲ�����Ӧ�á��������£�
+
+  require_once ('../../wind/Wind.php');
+  Wind::application()->run();
+
+*PS:��ȻҲ����ͬʱ��index.php�����ô��󼶱�WIND_DEBUGģʽ�ȡ�������ݺ�������*
+
+###����IndexController.php
+
+��Ӧ��Ŀ¼�´���controller/Ŀ¼��controllerĿ¼��windframeworkĬ�϶����Ӧ�ÿ�������ŵ�Ŀ¼������Ҳ����ͨ���ֶ����õķ�ʽ���ı�Ӧ�õķ���·���������Ǵ����� controller/ Ŀ¼�´���IndexController.php���ļ����ļ��������£�
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
+*��windframework���ļ�������������ͬ�ģ���һ���е�������java��windframework�ṩ������Ӧ�ÿ����������͡�WindSimpleController������WindController�������������Ǽ̳��ԡ�WindController����������Ӧ�ÿ������������ں���������ܡ�*
+
+���ˣ����ǵ�`hello world` Ӧ���Ѿ���ɡ���ͨ����������������ǵ�`hello world`��:
+
+  http://localhost/helloworld/index.php 