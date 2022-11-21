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

<h4>Регистрация</h4>
<form action="/registration" method="post">
    <div class="col-md-3">
        <label for="inputName" class="form-label">Имя пользователя</label>
        <input type="text" name="name" class="form-control" id="inputName" required>
    </div>
    <div class="col-md-3">
        <label for="inputEmail4" class="form-label">eMail</label>
        <input type="email" name="email" class="form-control" id="inputEmail4" required>
    </div>
    <div class="col-md-3">
        <label for="inputPassword4" class="form-label">Password</label>
        <input type="password" name="password" class="form-control" id="inputPassword4" required>
    </div>
    <div class="col-md-3">
        <label for="inputPhoneN" class="form-label">PhoneNumber</label>
        <input type="phone" name="phoneNumber" class="form-control" id="inputPhoneN" placeholder="+79001234567"
               required>
    </div>
    <br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <div class="col-8">
        <button type="submit" class="btn btn-primary">Зарегистрироваться</button>
    </div>
</form>


<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>

</body>
</html>