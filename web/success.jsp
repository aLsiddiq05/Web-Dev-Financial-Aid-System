<%-- 
    Document   : success
    Created on : Jun 2, 2023, 4:11:36 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success Page</title>
    </head>
    <body>
    <center>
        <c:if test="${requestScope.msg != null}">
            <h3><c:out value="${requestScope.msg}"></c:out></h3>
        </c:if><br><br>
        <c:if test="${sessionScope.fileName1 != null}">
            <c:set var="file1" scope="session" value="${sessionScope.fileName1}"/>  
        </c:if>
        <c:if test="${sessionScope.fileName2 != null}">
            <c:set var="file2" scope="session" value="${sessionScope.fileName2}"/>  
        </c:if>
        <a href="<c:url value='DownloadServlet?fileName=${file1}'/>">Download File 1</a>&nbsp;&nbsp;&nbsp;
        <a href="<c:url value='DownloadServlet?fileName=${file2}'/>">Download File 2</a>&nbsp;&nbsp;&nbsp;
        <a href="<c:url value='fileList.jsp'/>">View List</a>
    </center>
</body>
</html>

