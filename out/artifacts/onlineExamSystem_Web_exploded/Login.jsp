<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
  <link rel="shortcut icon"  href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico" type="image/vnd.microsoft.icon">
  <link rel="icon"  href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico" type="image/vnd.microsoft.icon">
  <title>This is Login Page</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/LoginStyle.css" type="text/css">
<script type="text/javascript">
  function  onLoad() {
    const message = '<%=request.getParameter("message")%>';
    if (message === 'fail'){
      alert('用户名或密码错误！');
      window.location.href='Login.jsp';
    }
  }
  function onSubmit() {
    const username = document.getElementById('username');
    const password = document.getElementById('password');
    if (username.value === "" || username.value == null || password.value === "" || password.value == null){
      alert("请完整输入用户名和密码");
      return false;
    }
    else {
      return true;
    }
  }
</script>
<body>
<div class="title">在线考试系统</div>
<div class="main">
  <form action="jsp/HandleLogin.jsp" method="post" name="form" onsubmit="return onSubmit()">
    <table>
      <tr><td colspan="2"><div class="info">用户登录&nbsp/&nbsp<strong>LOGIN</strong></div></td></tr>
      <tr>
        <td width="70px"><img src="${pageContext.servletContext.contextPath}/image/UserNameIcon.png" width="20px" height="20px" alt="unIco"><span>用户名：</span></td>
        <td><label for="username"></label><input id="username" type="text" name="username"></td>
      </tr>
      <tr>
        <td><img src="${pageContext.servletContext.contextPath}/image/UserPasswordIcon.png" width="20px" height="20px" alt="upIco"><span>密&nbsp&nbsp&nbsp&nbsp码：</span></td>
        <td><label for="password"></label><input id="password" type="password" name="password"></td>
      </tr>
      <tr>
        <td colspan="2"><input class="button" type="submit" value="登录" name="submit"><input class="button" type="reset" name="reset" value="重置"></td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
