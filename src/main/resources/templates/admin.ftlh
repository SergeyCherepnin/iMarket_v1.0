<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
    <title>iMarket</title>
</head>
<body style="background-color: aliceblue">
<h1><a href="/" style="color: midnightblue">iMarket</a></h1>
<hr>
<h4>Панель администратора</h4>
<table style="border-style: solid; border-color: black; width: 80%">
    <thead style="background-color: darkgray; text-align: center">
    <tr>
        <th>Email</th>
        <th>Номер телефона</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Бан</th>
        <th>Редактирование</th>
        <th>Подробная информация</th>
    </tr>
    </thead>
    <#list users as user>
        <tr>
            <td style="text-align: center">${user.email}</td>
            <td style="text-align: center">${user.phoneNumber}</td>
            <td style="text-align: center"><#if user.active>активен<#else>заблокирован</#if></td>
            <td style="text-align: center"><#list user.roles as role>${role}</#list></td>
            <td style="text-align: center">
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Ban/Unban">
                </form>
            </td>
            <td style="text-align: center"><a href="/admin/user/edit/${user.id}">Изменить роль</a></td>
            <td style="text-align: center"><a href="/user/${user.id}">Подробнее</a></td>
        </tr>
    <#else>
        <h2>Пользователей нет</h2>
    </#list>
</table>
</body>
</html>