<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
    <link rel="shortcut icon"  href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico">
    <title>密码修改页</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/mainTable.css" type="text/css">
<%--<link href="${pageContext.servletContext.contextPath}/css/ModifyPasswordFormStyle.css" type="text/css" rel="stylesheet">--%>
<c:set var="page" value="Index" />
<c:if test="${indexLine eq null}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<script type="text/javascript">
    function onLoad() {
        const message = '<%=request.getParameter("message")%>';
        if(message ==='success'){
            alert("密码修改成功");
            window.location.href = 'ModifyPassword.jsp';
        }
        else if(message ==='fail'){
            alert("密码修改失败");
            window.location.href = 'ModifyPassword.jsp';
        }
    }
    function onSubmit() {
        const password = document.getElementById('password');
        const repeat_password = document.getElementById('repeat_password');
        if (repeat_password.value===""||repeat_password.value==null||password.value===""||password.value==null){
            alert("请完整密码和确认密码！");
            return false;
        }
        else if(password.value!==repeat_password.value){
            alert("两次输入的密码不一致，请重新输入！");
            return false;
        }
        else {
            return true;
        }
    }
</script>
<body onload="onLoad()">
<div class="title"><b>在线考试系统</b>
    <span class="userinfo">用户名：<c:out value="${name}"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="ModifyPassword.jsp">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Exit">退出</a> </span>
</div>
<div class="leftBar">
    <ul>
        <c:forTokens items="Index,ScoreQuery,OnlineExam,Questions,TestFormation,ExamManagement,PersonManagement,UnitManagement" begin="0" end="${indexLine}" delims="," var="name">
            <c:if test="${name eq page}" >
                <c:set var="class1" value="background-color: #c8c8dc" />
            </c:if>
            <c:if test="${name ne page}">
                <c:set var="class1" value="background-color: #bff3f3" />
            </c:if>
            <li style="${class1}"><a href="<c:out value="${name}.jsp"/>">${name}</a></li>
        </c:forTokens>
    </ul>
</div>
<div class="main">
    <div class="div_form">
        <form action="ModifyPassword" method="post" name="form" onsubmit="return onSubmit()">
            <table>
                <tr><td colspan="2"><div class="info"><strong>修改密码</strong></div></td></tr>
                <tr>
                    <td width="90px"><img src="${pageContext.servletContext.contextPath}/image/UserPasswordIcon.png" width="20px" height="20px" alt="oh"><span>新&nbsp&nbsp密&nbsp&nbsp码：</span></td>
                    <td><label for="password"></label><input id="password" type="password" name="password" value="<c:out value=""/>"></td>
                </tr>
                <tr>
                    <td><img src="${pageContext.servletContext.contextPath}/image/UserPasswordIcon.png" width="20px" height="20px" alt=""><span>确定密码：</span></td>
                    <td><label for="repeat_password"></label><input id="repeat_password" type="password" name="repeat_password" value="<c:out value=""/>"></td>
                </tr>
                <tr>
                    <td colspan="2"><input class="button" type="submit" value="确定" name="submit"><input class="button" type="reset" name="reset" value="重置"></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<a href="#top" style="text-decoration:none"><div class="footer"><b>在线考试系统</b></div></a>
</body>
</html>
