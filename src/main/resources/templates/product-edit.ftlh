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
<h4>Редактирование товара</h4>


<form method="post" enctype="multipart/form-data">
    <div class="col-md-3">
        Название объявления: <input type="text" value="${product.title}" name="title" class="form-control">
    </div>
    <div class="col-md-3">
        Описание объявления: <input type="text" value="${product.description}" name="description" class="form-control">
    </div>
    <div class="col-md-3">
        Цена: <input type="number" value="${product.price}" name="price" class="form-control">
    </div>
    <div class="col-md-3">
        Город: <input type="text" value="${product.city}" name="city" class="form-control"><br>
    </div>

    <div class="input-group; col-3">
        <label class="input-group-text" for="inputGroupFile01">Фото №1</label>
        <input type="file" name="file1" class="form-control" id="inputGroupFile01">
    </div>
    <br>

    <div class="input-group; col-3">
        <label class="input-group-text" for="inputGroupFile02">Фото №2</label>
        <input type="file" name="file2" class="form-control" id="inputGroupFile02">
    </div>
    <br>

    <div class="input-group; col-3">
        <label class="input-group-text" for="inputGroupFile03">Фото №3</label>
        <input type="file" name="file3" class="form-control" id="inputGroupFile03">
    </div>
    <br>

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <div class="col-8">
        <button type="submit" class="btn btn-primary">Обновить</button>
    </div>
</form>


<#--<div class="container">
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
<b>Автор: </b> <a href="/user/${product.user.id}"> ${product.user.name}</a><br>-->
</body>
</html>