<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/8/23
  Time: 19:38
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
    <title>选择题目</title>
    <c:if test="${indexLine eq null}">
        <c:redirect url="../Login.jsp?message=fail"/>
    </c:if>
    <c:if test="${role eq 'student'}">
        <c:redirect url="../Login.jsp?message=fail"/>
    </c:if>
    <c:if test="${nowInsertExamSId eq null}">
        <c:redirect url="TestFormation.jsp"/>
    </c:if>
</head>
<body>
<div style="align: center;">
    <sql:query var="bankName" dataSource="${onlineSystem}">
        select bank_name,bank_type from qbankcontext;
    </sql:query>
    <form method="post" action="InsertExamQuestion">
        <c:if test="${bankName.rowCount >= 1}">
            <c:forEach var="row" items="${bankName.rows}">
                <sql:query var="question" dataSource="${onlineSystem}">
                    select * from ${row.bank_name};
                </sql:query>
                <c:if test="${question.rowCount >= 1}">
                    <c:if test="${row.bank_type eq 'c'}">
                        <c:forEach var="Q" items="${question.rows}">
                            <label>
                                <input type="checkbox" name="question" value="<c:out value="${row.bank_name}@${Q.cq_id}"/>">
                            </label><c:out value="${Q.cq_title}"/><br>
                        </c:forEach>
                    </c:if>
                    <c:if test="${row.bank_type eq 'i'}">
                        <c:forEach var="Q" items="${question.rows}">
                            <label>
                                <input type="checkbox" name="question" value="<c:out value="${row.bank_name}@${Q.iq_id}"/>">
                            </label><c:out value="${Q.iq_title}"/><br>
                        </c:forEach>
                    </c:if>
                    <c:if test="${row.bank_type eq 'f'}">
                        <c:forEach var="Q" items="${question.rows}">
                            <label>
                                <input type="checkbox" name="question" value="<c:out value="${row.bank_name}@${Q.fq_id}"/>">
                            </label><c:out value="${Q.fq_title}"/><br>
                        </c:forEach>
                    </c:if>
                    <c:if test="${row.bank_type eq 'a'}">
                        <c:forEach var="Q" items="${question.rows}">
                            <label>
                                <input type="checkbox" name="question" value="<c:out value="${row.bank_name}@${Q.aq_id}"/>">
                            </label><c:out value="${Q.aq_title}"/><br>
                        </c:forEach>
                    </c:if>
                </c:if>
            </c:forEach>
        </c:if>
        <input type="submit" value="确定">
    </form>
</div>
</body>
</html>
