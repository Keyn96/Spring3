<%-- 
    Document   : table
    Created on : 24.02.2016, 3:12:41
    Author     : НР
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
    </head>
    <body>
        <div class="main">
            <h1 class="title">${title}</h1> 
            <form action="<c:url value="${send}"/>" method="POST">
                <c:if test="${material.id_material!= null}">
                    <input type="hidden" name="id_material" value="${material.id_material}"/>
                </c:if>
                <table class="table_form"> 
                    <tr>
                        <td><label for="name">Наименование</label></td>
                        <td><input id="name" name="name" type="text" value="${material.name}"/></td>
                    </tr>
                    <tr>
                        <td><label for="weight">Вес</label></td>
                        <td><input id="weight" name="weight" type="text" value="${material.weight}"/></td>
                    </tr>
                    <tr>
                        <td><label for="manufacturer">Производитель</label></td>
                        <td><input id="manufacturer" name="manufacturer" type="text" value="${material.manufacturer}"/></td>
                    </tr>
                    <tr>
                        <td><label for="cost">Стоимость</label></td>
                        <td><input id="cost" name="cost" type="text" value="${material.cost}"/></td>
                    </tr>
                    <tr>
                        <td><label for="quantity">Количество</label></td>
                        <td><input id="quantity" name="quantity" type="text" value="${material.quantity}"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Отправить"/></td>
                    </tr>
                </table>
            </form>
                    <a class="button" href="<c:url value="/material/selectAll"/>">Назад</a>
        </div>
    </body>
</html>
