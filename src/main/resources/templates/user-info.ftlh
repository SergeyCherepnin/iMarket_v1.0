<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <title>iMarket</title>
</head>
    <body style="background-color: aliceblue">
        <h1><a href="/" style="color: midnightblue">iMarket</a></h1><hr>
        <h3>Информация о пользователе ${user.name}:</h3>
        <b>Номер телефона: </b> ${user.phoneNumber}<br>
        <b>Электронная почта: </b> ${user.email}<br><hr>
        <h3>Товары пользователя:</h3>
        <#list products as product>
            <div>
                <img src="/images/${product.previewImageId}" style="width: 18rem;">
                <p><b>${product.title}</b> ${product.price}руб. | <a href="/product/${product.id}">Подробнеее</a></p>
            </div>
        </#list>
        <#if errorMessage??>
            <h2 style="color: red">${errorMessage}</h2>
        </#if>
</body>
</html>