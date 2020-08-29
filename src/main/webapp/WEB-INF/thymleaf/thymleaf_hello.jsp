<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <main role="main" class="container">

        <div class="starter-template">
            <h1>Spring Boot Web Thymeleaf Example</h1>
            <h2>
                <span th:text="'Hello, ' + ${message}"></span>
            </h2>
        </div>

        <ol>
            <li th:each="task : ${tasks}" th:text="${task}"></li>
        </ol>

    </main>
</body>
</html>