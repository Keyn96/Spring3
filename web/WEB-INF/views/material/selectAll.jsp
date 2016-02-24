<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Список</title>
    </head>
    <body>
        <div class="main">
            <h1 class="title">Список прогнозов</h1>
            <table class="data_table">
                <tr>
                    <th>ИД</th>
                    <th>Название</th>
                    <th>Вес в кг</th>
                    <th>Производитель</th>
                    <th>Стоимость в рублях</th>
                    <th>Количество в упаковках</th>
                    <th colspan="3">Действия</th>
                </tr>
                <c:forEach var="material" items="${materials}">
                    <tr>
                        <td>${material.id_material}</td>
                        <td>${material.name}</td>
                        <td>${material.weight}</td>
                        <td>${material.manufacturer}</td>
                        <td>${material.cost}</td>
                        <td>${material.quantity}</td>
                        <td><a href="<c:url value="${material.id_material}/select"/>">Просмотреть</a></td>
                        <td><a href="<c:url value="${material.id_material}/update"/>">Редактировать</a></td>
                        <td><a href="<c:url value="${material.id_material}/delete"/>">Удалить</a></td>
                    </tr>
                </c:forEach>
            </table>
            <a class="button" href="<c:url value="insert"/>">Добавить</a>
        </div>
    </body>
</html>