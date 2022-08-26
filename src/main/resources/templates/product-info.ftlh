<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <title>iMarket</title>
    </head>
    <body style="background-color: aliceblue">
        <h1><a href="/" style="color: midnightblue">iMarket</a></h1><hr>
        <h4>Подробная информация о товаре</h4>
        <div class="container">
            <div class="row">
            <#list images as img>
                <img src="/images/${img.id}" style="width: 20rem;" class="img-thumbnail"/><br><br>
            </#list>
            </div>
        </div>
        <b>Название товара: </b> ${product.title}<br>
        <b>Описание товара: </b> ${product.description}<br>
        <b>Цена: </b> ${product.price}<br>
        <b>Город: </b> ${product.city}<br>
        <b>Автор: </b> <a href="/user/${product.user.id}"> ${product.user.name}</a><br>
    </body>
</html>