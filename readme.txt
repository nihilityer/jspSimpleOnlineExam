Login.jsp页面是登陆页，将登陆信息发送给HandleLogin.jsp，由HandleLogin页面进行验证然后重定向页面。

三个身份：
administrators    teachers    users

Index,ScoreQuery,OnlineExam,Questions,TestFormation,ExamManagement,PersonManagement,UnitManagement
首页   成绩查询页   考试页      试题管理页  组卷页         考试管理页       人员信息管理页      班级/单位管理页

ModifyPassword
密码修改页

session变量：
id              用户登陆id
name            用户名
classId         用户所在单位/班级
sex             用户性别
role            用户身份，只有三个值：root student teacher
indexLine       用于显示索引栏的变量

考试时因为非正常原因退出，必须保证系统数据库正常
修改时时间格式提交修改有问题，显示也有问题,考试管理页修改已正常
考试管理页修改按钮有显示bug
考试管理页,班级/单位管理页提交操作未完成,servlet实现(记得使用参数标记提交/修改)
组卷页未找到合理方法
这个最后加，当同时登陆同一个账户时，后登陆的用户将无法登陆。实现暂时没找。