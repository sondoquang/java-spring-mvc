<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Jquery library -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <title>User Page</title>
            </head>

            <body>
                <div class="container p-4 mt-5">
                    <div class="table mt-3">
                        <div class="d-flex justify-content-between mb-3">
                            <h2>User Information ${userId}</h2>
                        </div>
                        <hr>
                        <div class="card" style="width:60%;">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">User Id: ${user.id}</li>
                                <li class="list-group-item">Email: ${user.email}</li>
                                <li class="list-group-item">FullName: ${user.fullName}</li>
                                <li class="list-group-item">Address: ${user.address}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </body>

            </html>