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
                <title>Confirm Delete User</title>
            </head>

            <body>
                <div class="container p-4 mt-5">
                    <p class="text-danger">Delete user with id: ${userId}</p>
                    <div class="alert alert-warning" role="alert">
                        Are you sure to delete this user!
                    </div>
                    <p>${message}</p>
                    <form action="/admin/users/${userId}/delete" method="post">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </body>

            </html>