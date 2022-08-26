<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <title>
            iMarket
        </title>
    </head>
    <body style="background-color: aliceblue">
        <h1><a href="/" style="color: midnightblue">iMarket</a></h1><hr>
        <center>
        <h4>Авторизация</h4>
        <form action="/login" method="post">
            <div class="row mb-2">
                <label for="inputEmail" class="col-sm-2 col-form-label">Почта</label>
                <div class="col-sm-6">
                    <input type="email"  name="username" class="form-control" id="inputEmail">
                </div>
            </div>
            <div class="row mb-2">
                <label for="inputPassword" class="col-sm-2 col-form-label">Пароль</label>
                <div class="col-sm-6">
                    <input type="password" name="password" class="form-control" id="inputPassword">
                </div>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="col-2">
                <button type="submit" class="btn btn-primary">Войти</button>
            </div>
        </form>
        <a href="/registration">Зарегистрироваться</a>
        </center>
    </body>
</html>