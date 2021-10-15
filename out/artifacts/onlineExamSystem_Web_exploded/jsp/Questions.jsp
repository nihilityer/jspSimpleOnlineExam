<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/7/30
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico">
    <title>试题管理页</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/main.css" type="text/css">
<c:set var="page" value="Questions" />
<c:if test="${indexLine eq null}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<c:if test="${role eq 'student'}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<body>
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
<div>
    <sql:query var="allBank" dataSource="${onlineSystem}">
        select * from qbankcontext;
    </sql:query>
    <c:if test="${allBank.rowCount >= 1}">
    <form method="post">
        题库名：<label>
            <select name="bankName">
                <c:forEach var="row" items="${allBank.rows}">
                    <option value="${row.bank_name}">${row.bank_name}</option>
                </c:forEach>
            </select>
        </label>
        <input type="submit" value="查询此题库">
    </form>
    </c:if>
    <c:if test="${allBank.rowCount < 1}">
        <c:out value="<h1>没有题目记录</h1>"/>
    </c:if>
    <c:set var="bankName" value="${param.bankName}" />
    <c:if test="${bankName ne null}">
        <div style="width: 80%; float: right">
            <form method="post">
                要修改的题目id：<input type="text" name="questionOn" value="1">
                <input type="hidden" name="bankName" value="${bankName}">
                <input type="submit" value="修改">
            </form>
            <c:set var="isIn" value="${param.isIn}"/>
            <c:choose>
                <c:when test="${fn:startsWith(bankName, 'c')}">
                    <c:if test="${isIn eq null}">
                        <form method="post">
                            <input type="hidden" name="bankName" value="${bankName}">
                            <input type="hidden" name="isIn" value="notNull">
                            <div style="width: 78%;border: #11191a 1px;">
                                要插入的题目：<label>
                                <input type="text" name="titleQ">
                            </label><br>
                                A选项：<label>
                                <input type="text" name="QA">
                            </label><br>
                                B选项：<label>
                                <input type="text" name="QB">
                            </label><br>
                                C选项：<label>
                                <input type="text" name="QC">
                            </label><br>
                                D选项：<label>
                                <input type="text" name="QD">
                            </label><br>
                                正确答案：<label>
                                <select name="QT">
                                <option value="a">A</option>
                                <option value="b">B</option>
                                <option value="c">C</option>
                                <option value="d">D</option>
                            </select>
                            </label>
                                <input type="submit" value="提交">
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${isIn ne null}">
                        <c:set var="titleQ" value="${param.titleQ}"/>
                        <c:set var="QA" value="${param.QA}"/>
                        <c:set var="QB" value="${param.QB}"/>
                        <c:set var="QC" value="${param.QC}"/>
                        <c:set var="QD" value="${param.QD}"/>
                        <c:set var="QT" value="${param.QT}"/>
                        <sql:update dataSource="${onlineSystem}">
                            insert into ${bankName} (cq_title,cq_a,cq_b,cq_c,cq_d,cq_true) values(?,?,?,?,?,?);
                            <sql:param value="${titleQ}"/>
                            <sql:param value="${QA}"/>
                            <sql:param value="${QB}"/>
                            <sql:param value="${QC}"/>
                            <sql:param value="${QD}"/>
                            <sql:param value="${QT}"/>
                        </sql:update>
                    </c:if>
                </c:when>
                <c:when test="${fn:startsWith(bankName, 'i')}">
                    <c:if test="${isIn eq null}">
                        <form method="post">
                            <input type="hidden" name="bankName" value="${bankName}">
                            <input type="hidden" name="isIn" value="notNull">
                            <div style="width: 78%;border: #11191a 1px;">
                                要插入的题目：<label>
                                <input type="text" name="titleQ">
                            </label><br>
                                正确答案：<label>
                                <select name="QT">
                                    <option value="T">T</option>
                                    <option value="F">F</option>
                                </select>
                            </label>
                                <input type="submit" value="提交">
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${isIn ne null}">
                        <c:set var="titleQ" value="${param.titleQ}"/>
                        <c:set var="QT" value="${param.QT}"/>
                        <sql:update dataSource="${onlineSystem}">
                            insert into ${bankName} (iq_title,iq_true) values(?,?);
                            <sql:param value="${titleQ}"/>
                            <sql:param value="${QT}"/>
                        </sql:update>
                    </c:if>
                </c:when>
                <c:when test="${fn:startsWith(bankName, 'f')}">
                    <c:if test="${isIn eq null}">
                        <form method="post">
                            <input type="hidden" name="bankName" value="${bankName}">
                            <input type="hidden" name="isIn" value="notNull">
                            <div style="width: 78%;border: #11191a 1px;">
                                要插入的题目：<label>
                                <input type="text" name="titleQ">
                            </label><br>
                                正确答案：<label>
                                <input type="text" name="QT">
                            </label>
                                <input type="submit" value="提交">
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${isIn ne null}">
                        <c:set var="titleQ" value="${param.titleQ}"/>
                        <c:set var="QT" value="${param.QT}"/>
                        <sql:update dataSource="${onlineSystem}">
                            insert into ${bankName} (fq_title,fq_true) values(?,?);
                            <sql:param value="${titleQ}"/>
                            <sql:param value="${QT}"/>
                        </sql:update>
                    </c:if>
                </c:when>
                <c:when test="${fn:startsWith(bankName, 'a')}">
                    <c:if test="${isIn eq null}">
                        <form method="post">
                            <input type="hidden" name="bankName" value="${bankName}">
                            <input type="hidden" name="isIn" value="notNull">
                            <div style="width: 78%;border: #11191a 1px;">
                                要插入的题目：<label>
                                <input type="text" name="titleQ">
                            </label><br>
                                正确答案：<label>
                                <input type="text" name="QT">
                            </label>
                                <input type="submit" value="提交">
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${isIn ne null}">
                        <c:set var="titleQ" value="${param.titleQ}"/>
                        <c:set var="QT" value="${param.QT}"/>
                        <sql:update dataSource="${onlineSystem}">
                            insert into ${bankName} (aq_title,aq_rt) values(?,?);
                            <sql:param value="${titleQ}"/>
                            <sql:param value="${QT}"/>
                        </sql:update>
                    </c:if>
                </c:when>
            </c:choose>
            <c:set var="questionOn" value="${param.questionOn}" />
            <c:if test="${questionOn ne null}">
                <c:set var="typeQ" value="${param.typeQ}"/>
                <c:if test="${typeQ ne null}">
                    <c:set var="titleQ" value="${param.titleQ}"/>
                    <c:set var="QT" value="${param.QT}"/>
                    <c:choose>
                        <c:when test="${typeQ eq 'c'}">
                            <c:set var="QA" value="${param.QA}"/>
                            <c:set var="QB" value="${param.QB}"/>
                            <c:set var="QC" value="${param.QC}"/>
                            <c:set var="QD" value="${param.QD}"/>
                            <sql:update dataSource="${onlineSystem}">
                                update ${bankName} set cq_title=?,cq_a=?,cq_b=?,cq_c=?,cq_d=?,cq_true=? where cq_id=?;
                                <sql:param value="${titleQ}" />
                                <sql:param value="${QA}" />
                                <sql:param value="${QB}" />
                                <sql:param value="${QC}" />
                                <sql:param value="${QD}" />
                                <sql:param value="${QT}" />
                                <sql:param value="${questionOn}" />
                            </sql:update>
                            <c:set var="questionOn" value="${null}"/>
                        </c:when>
                        <c:when test="${typeQ eq 'i'}">
                            <sql:update dataSource="${onlineSystem}">
                                update ${bankName} set iq_title=?,iq_true=? where iq_id=?;
                                <sql:param value="${titleQ}"/>
                                <sql:param value="${QT}"/>
                                <sql:param value="${questionOn}"/>
                            </sql:update>
                            <c:set var="questionOn" value="${null}"/>
                        </c:when>
                        <c:when test="${typeQ eq 'f'}">
                            <sql:update dataSource="${onlineSystem}">
                                update ${bankName} set fq_title=?,fq_true=? where fq_id=?;
                                <sql:param value="${titleQ}"/>
                                <sql:param value="${QT}"/>
                                <sql:param value="${questionOn}"/>
                            </sql:update>
                            <c:set var="questionOn" value="${null}"/>
                        </c:when>
                        <c:when test="${typeQ eq 'a'}">
                            <sql:update dataSource="${onlineSystem}">
                                update ${bankName} set aq_title=?,aq_true=? where aq_id=?;
                                <sql:param value="${titleQ}"/>
                                <sql:param value="${QT}"/>
                                <sql:param value="${questionOn}"/>
                            </sql:update>
                            <c:set var="questionOn" value="${null}"/>
                        </c:when>
                    </c:choose>
                </c:if>
                <form method="post">
                    <input type="hidden" name="questionOn" value="${questionOn}">
                    <input type="hidden" name="bankName" value="${bankName}">
                <c:if test="${fn:startsWith(bankName, 'c')}">
                    <input type="hidden" name="typeQ" value="c">
                    <sql:query var="questionOneRow" dataSource="${onlineSystem}">
                        select * from ${bankName} where cq_id=?;
                        <sql:param value="${questionOn}"/>
                    </sql:query>
                    <c:if test="${questionOneRow.rowCount == 1}">
                        <c:forEach var="row" items="${questionOneRow.rows}">
                            <table border="1" style="width: 75%">
                                <tr>
                                    <th>${row.cq_id}</th>
                                    <th><label>
                                        <input type="text" name="titleQ" value="${row.cq_title}">
                                    </label></th>
                                </tr>
                                <tr>
                                    <th>A</th>
                                    <th><label>
                                        <input type="text" name="QA" value="${row.cq_a}">
                                    </label></th>
                                </tr>
                                <tr>
                                    <th>B</th>
                                    <th><label>
                                        <input type="text" name="QB" value="${row.cq_b}">
                                    </label></th>
                                </tr>
                                <tr>
                                    <th>C</th>
                                    <th><label>
                                        <input type="text" name="QC" value="${row.cq_c}">
                                    </label></th>
                                </tr>
                                <tr>
                                    <th>D</th>
                                    <th><label>
                                        <input type="text" name="QD" value="${row.cq_d}">
                                    </label></th>
                                </tr>
                                <tr>
                                    <th>true_answer</th>
                                    <th><label>
                                        <input type="text" name="QT" value="${row.cq_true}">
                                    </label></th>
                                </tr>
                            </table>
                            <input type="submit" value="确认">
                            </form>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${fn:startsWith(bankName, 'i')}">
                    <input type="hidden" name="typeQ" value="i">
                    <sql:query var="questionOneRow" dataSource="${onlineSystem}">
                        select * from ${bankName} where iq_id=?;
                        <sql:param value="${questionOn}"/>
                    </sql:query>
                    <c:if test="${questionOneRow.rowCount == 1}">
                        <c:forEach var="row" items="${questionOneRow.rows}">
                            <table border="1" style="width: 75%">
                                <tr>
                                    <th>${row.iq_id}</th>
                                    <th><label>
                                        <input type="text" name="titleQ" value="${row.iq_title}">
                                    </label></th>
                                </tr>
                                <tr>
                                    <td>true_answer</td>
                                    <td style="text-align: center"><label>
                                        <input type="text" name="QT" value="${row.iq_true}">
                                    </label></td>
                                </tr>
                            </table>
                            <input type="submit" value="确认">
                            </form>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${fn:startsWith(bankName, 'f')}">
                    <input type="hidden" name="typeQ" value="f">
                    <sql:query var="questionOneRow" dataSource="${onlineSystem}">
                        select * from ${bankName} where fq_id=?;
                        <sql:param value="${questionOn}"/>
                    </sql:query>
                    <c:if test="${questionOneRow.rowCount == 1}">
                        <c:forEach var="row" items="${questionOneRow.rows}">
                            <table border="1" style="width: 75%">
                                <tr>
                                    <th>${row.fq_id}</th>
                                    <th><label>
                                        <input type="text" name="titleQ" value="${row.fq_title}">
                                    </label></th>
                                </tr>
                                <tr>
                                    <td>true_answer</td>
                                    <td style="text-align: center"><label>
                                        <input type="text" name="QT" value="${row.fq_true}">
                                    </label></td>
                                </tr>
                            </table>
                            <input type="submit" value="确认">
                            </form>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${fn:startsWith(bankName, 'a')}">
                    <input type="hidden" name="typeQ" value=a">
                    <sql:query var="questionOneRow" dataSource="${onlineSystem}">
                        select * from ${bankName} where aq_id=?;
                        <sql:param value="${questionOn}"/>
                    </sql:query>
                    <c:if test="${questionOneRow.rowCount == 1}">
                        <c:forEach var="row" items="${questionOneRow.rows}">
                            <table border="1" style="width: 75%">
                                <tr>
                                    <th>${row.aq_id}</th>
                                    <th><label>
                                        <input type="text" name="titleQ" value="${row.aq_title}">
                                    </label></th>
                                </tr>
                                <tr>
                                    <td>true_answer</td>
                                    <td style="text-align: center"><label>
                                        <input type="text" name="QT" value="${row.aq_true}">
                                    </label></td>
                                </tr>
                            </table>
                            <input type="submit" value="确认">
                            </form>
                        </c:forEach>
                    </c:if>
                </c:if>
            </c:if>
        </div>
    </c:if>
    <div style="width: 75%; float: right">
        <c:if test="${bankName eq null}">
            <h1>暂没有查询题库</h1>
        </c:if>
        <c:if test="${bankName ne null}">
            <sql:query var="questionInfo" dataSource="${onlineSystem}">
                select * from ${bankName};
            </sql:query>
            <c:if test="${questionInfo.rowCount < 1}">
                <h1>题库中没有记录</h1>
            </c:if>
            <c:if test="${questionInfo.rowCount >= 1}">
                <c:forEach var="row" items="${questionInfo.rows}">
                    <c:if test="${fn:startsWith(bankName, 'c')}">
                        <p>
                            <c:out value="${row.cq_id}"/>&nbsp;&nbsp;&nbsp;<c:out value="${row.cq_title}"/><br>
                            <c:out value="${row.cq_a}"/><br>
                            <c:out value="${row.cq_b}"/><br>
                            <c:out value="${row.cq_c}"/><br>
                            <c:out value="${row.cq_d}"/><br>
                            <c:out value="${row.cq_true}"/>
                        </p>
                    </c:if>
                    <c:if test="${fn:startsWith(bankName, 'i')}">
                        <p>
                            <c:out value="${row.iq_id}"/>&nbsp;&nbsp;&nbsp;<c:out value="${row.iq_title}"/><br>
                            <c:out value="${row.iq_true}"/>
                        </p>
                    </c:if>
                    <c:if test="${fn:startsWith(bankName, 'f')}">
                        <p>
                            <c:out value="${row.fq_id}"/>&nbsp;&nbsp;&nbsp;<c:out value="${row.fq_title}"/><br>
                            <c:out value="${row.fq_true}"/>
                        </p>
                    </c:if>
                    <c:if test="${fn:startsWith(bankName, 'a')}">
                        <p>
                            <c:out value="${row.aq_id}"/>&nbsp;&nbsp;&nbsp;<c:out value="${row.aq_title}"/><br>
                            <c:if test="${row.aq_rt eq null}">
                                <c:out value="<h1>没有准确答案</h1>"/>
                            </c:if>
                            <c:if test="${row.aq_rt ne null}">
                                <c:out value="${row.aq_rt}"/>
                            </c:if>
                        </p>
                    </c:if>
                </c:forEach>
            </c:if>
        </c:if>
    </div>
</div>
<a href="#top" style="text-decoration:none"><div class="footer"><b>在线考试系统</b></div></a>
</body>
</html>
