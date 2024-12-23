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
                            <div class="p-3  mt-2">
                                <div class="table mt-3">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h3>Table User</h3>
                                        <a href="/admin/users/create" class="btn btn-primary">Create a User</a>
                                    </div>
                                    <hr>
                                    <form method="post">
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Id</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Fullname</th>
                                                    <th scope="col">Role</th>
                                                    <th scope="col">Phone</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${users}">
                                                    <tr>
                                                        <th scope="row">${user.id}</th>
                                                        <td>${user.email}</td>
                                                        <td>${user.fullName}</td>
                                                        <td>${user.role.name}</td>
                                                        <td>${user.phone}</td>
                                                        <td>
                                                            <a class="btn btn-success"
                                                                href="/admin/users/${user.id}/view">View</a>
                                                            <a class="btn btn-warning"
                                                                href="/admin/users/${user.id}/update">Update</a>
                                                            <a class="btn btn-danger"
                                                                href="/admin/users/${user.id}/delete">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/Footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>