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
                                    <li class="breadcrumb-item active"><a href="/admin">dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/users">users</a></li>
                                    <li class="breadcrumb-item">detail</li>
                                </ol>
                            </div>
                            <div class="p-4 ">
                                <div class="table mt-3">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h2>User Information with id: ${userId}</h2>
                                    </div>
                                    <hr>
                                    <div class="card" style="width:60%;">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item">User Id: ${user.id}</li>
                                            <li class="list-group-item">Email: ${user.email}</li>
                                            <li class="list-group-item">FullName: ${user.fullName}</li>
                                            <li class="list-group-item">Address: ${user.address}</li>
                                            <li class="list-group-item">Password: ${user.password}</li>
                                            <li class="list-group-item">RoleId: ${user.role.id}</li>

                                        </ul>
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