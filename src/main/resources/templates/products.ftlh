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
<#if user.email??>
    <nav class="navbar" style="background-color: lightskyblue">
        <div class="container-fluid">
            <h3><a href="/" style="color: midnightblue">iMarket</a></h3>
            <div class="d-flex justify-content-end">
                <#if user.isAdmin()>
                    <a class="btn btn-primary btn-sm" href="/admin">Панель администратора</a>
                </#if>
                <a class="btn btn-primary btn-sm" href="/user/${user.id}">Мой профиль</a>
                <form action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input class="btn btn-primary btn-sm" type="submit" value="Выйти">
                </form>
            </div>
        </div>
    </nav>

    <h3 style="text-align: center">Пользователь: <i>${user.name}</i></h3>

<#else>
    <h1><a href="/" style="color: midnightblue">iMarket</a>
        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example" style="float: right">
            <a href="/login" class="btn btn-primary">Войти</a>
            <a href="/registration" class="btn btn-primary">Зарегистрироваться</a>
        </div>
    </h1>
</#if>
<br><br>
<form action="/" method="get" class="d-flex" role="search">
    <input class="form-control me-2" type="text" name="title" placeholder="Поиск по названию объявления">
    <button class="btn btn-outline-" type="submit">Поиск</button>
</form>
<#if user.email??>
    <hr>
    <a href="/my-products" class="btn btn-success" style="width: 100%; height: 60px; background-color: darkslateblue">
        <h3>Мои товары</h3></a><br>
    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button style="background-color: slategrey; text-align: center" class="accordion-button" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true"
                        aria-controls="collapseOne">
                    <h4 style="color: white">Добавить новый товар</h4>
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                 data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <form action="/product/create" method="post" enctype="multipart/form-data">
                        <div class="col-md-3">
                            Название объявления: <input type="text" name="title" class="form-control" required>
                        </div>
                        <div class="col-md-3">
                            Описание объявления: <input type="text" name="description" class="form-control">
                        </div>
                        <div class="col-md-3">
                            Цена: <input type="number" name="price" class="form-control" required>
                        </div>
                        <div class="col-md-3">
                            Город: <input type="text" name="city" class="form-control"><br>
                        </div>
                        <div class="input-group; col-3">
                            <label class="input-group-text" for="inputGroupFile01">Фото №1</label>
                            <input type="file" name="file1" class="form-control" id="inputGroupFile01" required>
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
                            <button type="submit" class="btn btn-primary">Добавить товар</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</#if>
<center>
    <h3>Найденные товары:</h3>
</center>

<div class="row row-cols-1 row-cols-md-4 g-4">
    <#list products as product>
        <div class="col">
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-black bg-light my-3 product" style="width: 18rem;">
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} ₽</p>
                    </div>
                    <div class="card-footer">
                        ${product.city}
                    </div>
                </div>
            </a>
        </div>
    <#else>
        <h5>Товаров нет...</h5>
    </#list>
</div>
</body>
</html>