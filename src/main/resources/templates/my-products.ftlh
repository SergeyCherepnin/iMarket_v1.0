<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <title>iMarket</title>
</head>
<body style="background-color: aliceblue">
<h1><a href="/" style="color: midnightblue">iMarket</a></h1><hr>
<center>
<h3>Мои товары:</h3>
</center>
<div class="row row-cols-1 row-cols-md-4 g-4">
    <#list userProducts as product>
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
                    <div class="clearfix">
                        <div class="row">
                            <div class="col">
                                <form action="/product/delete/${product.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-danger">Удалить</button>
                                </form>
                            </div>
                            <div class="col">
                                <form action="/product/edit/${product.id}" method="get" style="text-align: right">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-warning">Редактировать</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    <#else>
        <h5>Товаров нет...</h5>
    </#list>
</div>
<div class="accordion" id="accordionExample">
    <div class="accordion-item">
        <h2 class="accordion-header" id="headingOne">
            <button style="background-color: slategrey" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                <h4 style="color: white">Добавить новый товар</h4>
            </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
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
                        <input type="file"  name="file1" class="form-control" id="inputGroupFile01" required>
                    </div><br>
                    <div class="input-group; col-3">
                        <label class="input-group-text" for="inputGroupFile02">Фото №2</label>
                        <input type="file" name="file2" class="form-control" id="inputGroupFile02">
                    </div><br>
                    <div class="input-group; col-3">
                        <label class="input-group-text" for="inputGroupFile03">Фото №3</label>
                        <input type="file" name="file3" class="form-control" id="inputGroupFile03">
                    </div><br>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <div class="col-8">
                        <button type="submit" class="btn btn-primary">Добавить товар</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>