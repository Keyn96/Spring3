<%-- 
    Document   : delete
    Created on : 24.02.2016, 3:13:03
    Author     : НР
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Удалить</title>
    </head>
    <body>
        <div class="main">
            <h1 class="title">Удалить</h1>
            <form action="<c:url value="/material/deleteMaterial"/>" method="POST">
                <p>Вы дейстительно хотите удалить материал?</p>
                <input type="hidden" name="id_material" value="${material.id_material}"/>
                <input type="submit" value="Удалить"/>
            </form>
            <a class="button" href="<c:url value="/material/selectAll"/>">Назад</a>
        </div>
    </body>
</html>
