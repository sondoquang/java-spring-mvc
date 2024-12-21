<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>User - SB Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/Header.jsp" />
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <jsp:include page="../layout/SideBar.jsp" />
                    </div>
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manager Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="">Dashboard</a></li>
                                    <li class="breadcrumb-item">User</li>
                                </ol>
                            </div>
                            <div class="p-4 mt-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h2>Update a User</h2>
                                        <form:form action="/admin/users/update" method="post" modelAttribute="newUser">
                                            <div class="mb-3" hidden>
                                                <label class="form-label">Id:</label>
                                                <form:input type="text" class="form-control" path="id" />
                                            </div>
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
                                            <p>${message}</p>
                                            <div class="mt-3">
                                                <button type="submit" class="btn btn-warning">Update</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/Footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>