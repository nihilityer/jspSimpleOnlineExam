<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/8/22
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico">
    <title>正在考试……</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/main.css" type="text/css">
    <c:if test="${indexLine eq null}">
        <c:redirect url="../Login.jsp?message=fail"/>
    </c:if>
</head>
<body>
<div class="title"><b>在线考试系统</b>
    <span class="userinfo">用户名：<c:out value="${name}"/></span>
</div>
<div>
    <c:if test="${questionID eq null}">
        <c:set value="${param.question}" scope="session" var="questionID"/>
        <c:if test="${questionID eq null}">
            <c:redirect url="OnlineExam.jsp" />
        </c:if>
    </c:if>
    <c:if test="${examId eq null}">
        <c:set value="${param.examId}" scope="session" var="examId"/>
        <c:if test="${examId eq null}">
            <c:redirect url="OnlineExam.jsp" />
        </c:if>
    </c:if>
    <c:if test="${examName eq null}">
        <c:set value="${param.examName}" scope="session" var="examName"/>
        <c:if test="${examName eq null}">
            <c:redirect url="OnlineExam.jsp" />
        </c:if>
    </c:if>
    <c:if test="${start eq null}">
        <c:set value="${param.start}" scope="session" var="start"/>
        <c:if test="${start eq null}">
            <c:redirect url="OnlineExam.jsp" />
        </c:if>
    </c:if>
    <c:if test="${num eq null}">
        <c:set value="${param.num}" scope="session" var="num"/>
        <c:if test="${num eq null}">
            <c:redirect url="OnlineExam.jsp" />
        </c:if>
    </c:if>
    <c:if test="${time eq null}">
        <c:set value="${param.time}" scope="session" var="time"/>
        <c:if test="${time eq null}">
            <c:redirect url="OnlineExam.jsp" />
        </c:if>
    </c:if>
    <c:if test="${surplusTime eq null}">
        <c:set var="surplusTime" scope="session" value="${time * 60}"/>
    </c:if>
    <sql:query var="anserInfo" dataSource="${onlineSystem}">
        select order_number from examofa;
    </sql:query>
    <c:set var="rowNum" scope="session" value="${anserInfo.rowCount+1}"/>
    <c:if test="${startTime eq null}">
        <c:if test="${startTime eq null}">
            <c:set var="startTime" scope="session" value="<%=new java.util.Date()%>" />
        </c:if>
        <sql:update dataSource="${onlineSystem}">
            insert into usedinfo (user_id,start_exam_time,exam_id,exam_name,question_num,start_id) values (?,?,?,?,?,?);
            <sql:param value="${id}" />
            <sql:param value="${startTime}" />
            <sql:param value="${examId}" />
            <sql:param value="${examName}" />
            <sql:param value="${num}" />
            <sql:param value="${rowNum}" />
        </sql:update>
        <c:set scope="session" var="startOfA" value="${rowNum}" />
    </c:if>
    <sql:query var="questionInfo" dataSource="${onlineSystem}">
        select q_type,true_a,bank_name,bankid_of_q,score from examofq where order_number=?;
        <sql:param value="${start + questionID -1}" />
    </sql:query>
    <c:if test="${questionInfo.rowCount >= 1}">
        <c:forEach var="row" items="${questionInfo.rows}">
            <c:set var="trueAnswer" scope="session" value="${row.true_a}"/>
            <c:if test="${row.q_type eq 'c'}">
                <sql:query var="question" scope="page" dataSource="${onlineSystem}">
                    select * from ${row.bank_name} where cq_id=?;
                    <sql:param value="${row.bankid_of_q}" />
                </sql:query>
                <c:forEach var="rowP" items="${question.rows}">
                    <div><c:out value="${questionID}" />&nbsp;<c:out value="${rowP.cq_title}" />(<c:out value="${row.score}" />分)<br>
                    <form method="post" action="NextQuestion" id="examForm">
                        <label>
                            <input type="radio" value="a" name="user_a">
                        </label><c:out value="${rowP.cq_a}" /><br>
                        <label>
                            <input type="radio" value="b" name="user_a">
                        </label><c:out value="${rowP.cq_b}" /><br>
                        <label>
                            <input type="radio" value="b" name="user_a">
                        </label><c:out value="${rowP.cq_c}" /><br>
                        <label>
                            <input type="radio" value="b" name="user_a">
                        </label><c:out value="${rowP.cq_d}" /><br>
                        <input type="hidden" name="q_type" value="c">
                </c:forEach>
                <c:if test="${questionInfo.rowCount < 1}">
                    <p>数据库错误!</p>
                </c:if>
            </c:if>
            <c:if test="${row.q_type eq 'i'}">
                <sql:query var="question" scope="page" dataSource="${onlineSystem}">
                    select * from ${row.bank_name} where iq_id=?;
                    <sql:param value="${row.bankid_of_q}" />
                </sql:query>
                <c:forEach var="rowP" items="${question.rows}">
                    <div><c:out value="${questionID}" />&nbsp;<c:out value="${rowP.iq_title}" />(<c:out value="${row.score}" />分)<br>
                        <form method="post" action="NextQuestion" id="examForm">
                            <label>
                                <input type="radio" value="T" name="user_a">
                            </label><c:out value="对"/>
                            <label>
                                <input type="radio" value="F" name="user_a">
                            </label><c:out value="错"/>
                            <input type="hidden" name="q_type" value="i">
                </c:forEach>
                <c:if test="${questionInfo.rowCount < 1}">
                    <p>数据库错误!</p>
                </c:if>
            </c:if>
            <c:if test="${row.q_type eq 'f'}">
                <sql:query var="question" scope="page" dataSource="${onlineSystem}">
                    select * from ${row.bank_name} where fq_id=?;
                    <sql:param value="${row.bankid_of_q}" />
                </sql:query>
                <c:forEach var="rowP" items="${question.rows}">
                    <div><c:out value="${questionID}" />&nbsp;<c:out value="${rowP.fq_title}" />(<c:out value="${row.score}" />分)<br>
                        <form method="post" action="NextQuestion" id="examForm">
                            <label>
                                <c:out value="答案："/><input type="text" name="user_a">
                            </label>
                            <input type="hidden" name="q_type" value="f">
                </c:forEach>
                <c:if test="${questionInfo.rowCount < 1}">
                    <p>数据库错误!</p>
                </c:if>
            </c:if>
            <c:if test="${row.q_type eq 'a'}">
                <sql:query var="question" scope="page" dataSource="${onlineSystem}">
                    select * from ${row.bank_name} where aq_id=?;
                    <sql:param value="${row.bankid_of_q}" />
                </sql:query>
                <c:forEach var="rowP" items="${question.rows}">
                    <div><c:out value="${questionID}" />&nbsp;<c:out value="${rowP.aq_title}" />(<c:out value="${row.score}" />分)<br>
                        <form method="post" action="NextQuestion" id="examForm">
                            <label>
                                <c:out value="答案："/><input type="text" name="user_a">
                            </label>
                            <input type="hidden" name="q_type" value="a">
                </c:forEach>
                <c:if test="${questionInfo.rowCount < 1}">
                    <p>数据库错误!</p>
                </c:if>
            </c:if>
                            <input type="hidden" name="q_type" value="${row.q_type}">
                            <input type="hidden" name="bank_name" value="${row.bank_name}">
                            <input type="hidden" name="bankid_q" value="${row.bankid_of_q}">
                            <input type="hidden" name="score" value="${row.score}">
                            <input type="hidden" id="isNext" name="isNext" value="">
                            <input type="hidden" name="surplusTime" id="subTime" value="">
                            <c:if test="${questionID ne '1' and questionID ne 1}">
                                <input type="button" value="上一题" onclick="upTitle()">
                            </c:if>
                            <c:if test="${questionID ne num}">
                                <input type="button" value="下一题" onclick="downTitle()">
                            </c:if>
                            <input type="button" value="交卷" onclick="subTitle()">
                            <P>剩余时间: <b id="time"></b></P>
                        </form>
                    </div>
        </c:forEach>
    </c:if>
</div>
</body>
<script>
    let times = ${surplusTime};
    const timeDiv = document.getElementById("time");
    let timeObj = null;
    function timer() {
        if (times === 0) {
            document.getElementById("examForm")
            document.getElementById("examForm").submit();
            window.clearInterval(timeObj);
            return;
        }
        timeDiv.innerHTML = Math.floor(times / 60) + "分" + times % 60 + "秒";
        times --;
    }
    function upTitle() {
        document.getElementById("subTime").value = times;
        document.getElementById("isNext").value = 'up';
        document.getElementById('examForm').submit();
    }
    function downTitle() {
        document.getElementById("subTime").value = times;
        document.getElementById("isNext").value = 'down';
        document.getElementById('examForm').submit();
    }
    function subTitle() {
        document.getElementById("subTime").value = times;
        document.getElementById("isNext").value = 'sub';
        document.getElementById('examForm').submit();
    }
    timeObj = window.setInterval(timer,1000);
</script>
</html>
