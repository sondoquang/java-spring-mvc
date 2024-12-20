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
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h2>Create a User</h2>
                            <form:form action="/admin/user/create" method="post" modelAttribute="newUser">

                                <div class="mb-3">
                                    <label class="form-label">Email address:</label>
                                    <form:input type="text" class="form-control" path="email"
                                        placeholder="Enter email" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password:</label>
                                    <form:input type="password" class="form-control" path="password"
                                        placeholder="Enter Password" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Phone number:</label>
                                    <form:input type="text" class="form-control" path="phone"
                                        placeholder="Enter phone number" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">FullName:</label>
                                    <form:input type="text" class="form-control" path="fullName"
                                        placeholder="Enter FullName" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Address:</label>
                                    <form:input type="text" class="form-control" path="address"
                                        placeholder="Enter address" />
                                </div>
                                <div class="mt-3">
                                    <button type="submit" class="btn btn-primary">Create</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>