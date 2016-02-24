
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Просмотр</title>
    </head>
    <body>
        <div class="main">
            <h1 class="title">Информация оматериале</h1>
            <p>Материал: ИД -<b>${material.id_material}</b> 
                         Наименование - <b>${material.name}</b>
                         Вес - <b>${material.weight}</b>
                         Производитель - <b>${material.manufacturer}</b>
                         Стоимость - <b>${material.cost}</b>
                         Количество - <b>${material.quantity}</b>
            
            
            
            </p>
            <a class="button" href="<c:url value="/material/selectAll"/>">Назад</a>
        </div>
    </body>
</html>
