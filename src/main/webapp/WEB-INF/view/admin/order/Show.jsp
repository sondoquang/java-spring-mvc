<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Order - SB Admin</title>
                <style>
                    td,
                    th {
                        text-align: center;
                        align-content: center;
                    }
                </style>
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
                                <h1 class="mt-4">Dashboard</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">order</li>
                                </ol>
                            </div>
                            <div class="p-3  mt-2">
                                <div class="table mt-3">
                                    <div class="d-flex justify-content-start align-items-center mb-3">
                                        <h3>Table Order</h3>
                                    </div>
                                    <hr>
                                    <form method="post">
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="text-center">Id</th>
                                                    <th scope="col" class="text-center">Total Price</th>
                                                    <th scope="col" class="text-center">Customer</th>
                                                    <th scope="col" class="text-center">Status</th>
                                                    <th scope="col" style="width:250px; text-align: center;"
                                                        class="text-center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="order" items="${orders}">
                                                    <tr>
                                                        <th scope="row">${order.id}</th>
                                                        <td>
                                                            <fmt:formatNumber var="totalPrice"
                                                                value="${order.totalPrice}" type="number"
                                                                pattern="##,###,###" />
                                                            ${totalPrice}
                                                        </td>
                                                        <td>${order.user.fullName}</td>
                                                        <td>${order.status == true?"Complete":"Pending"}</td>
                                                        <td style="width:250px; text-align: center;">
                                                            <a class="btn btn-success"
                                                                href="/admin/order/${order.id}/view">View</a>
                                                            <a class="btn btn-warning"
                                                                href="/admin/order/${order.id}/update">Update</a>
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