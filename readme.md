studioWebsite
===================================
  studioWebsite是四川省模式识别与智能信息处理研究实验室网站，基于论文管理，教师，学生进行多功能的网站，包含资料阅读，上传下载。<br />
  
关于本项目所采用的技术
 -----------------------------------
  1. MVC:传统的MVC模式来进行开发（struts+hibernate+spring）<br />
  2. Database:sqlserver 2008 <br />
  3. IDE :eclipse <br/>
  4. test:junit(4.0) <br/>

### 目录结构
    cn.edu.cdu.lab.action -- 表示属于action层用来作为控制器<br/>
    cn.edu.cdu.lab.dao -- dao层用来访问数据库，进行数据库的一些基本的操作<br/>
    cn.edu.cdu.lab.dao.impl -- dao层的接口实现类层，是详细用来操作数据库<br/>
    cn.edu.cdu.lab.model -- model层，就是一个javaBean，主要功能是用来存储数据<br/>
    cn.edu.cdu.lab.service -- service接口层,用来声明service层的方法主体<br/>
    cn.edu.cdu.lab.service.impl -- service实现类层，用来实现service里面主体的方法<br/>
    cn.edu.cdu.lab.utils -- util层，是常用的一些工具类，比如说加密，以及验证码and more <br/>
    下面就是一些基本的配置，源码里面有详细的介绍，在这里我就不啰嗦了。<br/>

### 关于本项目所采用的技术
  小标题类似html的\<h3\><br />
  小标题的格式如下 ### 小标题<br />
  注意#和标题字符中间要有空格

### 注意!!!下面所有语法的提示我都先用小标题提醒了!!! 

### 单行文本框
    这是一个单行的文本框,只要两个Tab再输入文字即可
        
### 多行文本框  
    这是一个有多行的文本框
    你可以写入代码等,每行文字只要输入两个Tab再输入文字即可
    这里你可以输入一段代码

### 比如我们可以在多行文本框里输入一段代码,来一个Java版本的HelloWorld吧
    public class HelloWorld {

      /**
      * @param args
   */
   public static void main(String[] args) {
   System.out.println("HelloWorld!");

   }

    }
### 链接
1.[点击这里你可以链接到www.google.com](http://www.google.com)<br />
2.[点击这里你可以链接到我的博客](http://bolobeach.blogspot.com/)<br />
3.[如果有宝贵的意见请给我发邮件](bolobeach@gmail.com)<br/>

###只是显示图片
![github](http://github.com/unicorn.png "github")

###想点击某个图片进入一个网页,比如我想点击github的icorn然后再进入www.github.com
[![image]](http://www.github.com/)
[image]: http://github.com/github.png "github"

### 文字被些字符包围
> 文字被些字符包围
>
> 只要再文字前面加上>空格即可
>
> 如果你要换行的话,新起一行,输入>空格即可,后面不接文字
> 但> 只能放在行首才有效

### 文字被些字符包围,多重包围
> 文字被些字符包围开始
>
> > 只要再文字前面加上>空格即可
>
>  > > 如果你要换行的话,新起一行,输入>空格即可,后面不接文字
>
> > > > 但> 只能放在行首才有效

### 特殊字符处理
有一些特殊字符如<,#等,只要在特殊字符前面加上转义字符\即可<br />
你想换行的话其实可以直接用html标签\<br /\>