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
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <style>
                    td,
                    th {
                        text-align: center;
                        align-content: center;
                    }
                </style>
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
                                                    <th scope="col" class="text-center">Sản Phẩm</th>
                                                    <th scope="col">Tên Sản phẩm</th>
                                                    <th scope="col">Giá Sản Phẩm </th>
                                                    <th scope="col">Số lượng</th>
                                                    <th scope="col">Thành tiền</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${orderDetails}">
                                                    <tr>
                                                        <td scope="row" style="width: 100px;text-align: center;">
                                                            <img src="/images/product/${item.product.image}"
                                                                class="rounded-circle" alt=""
                                                                style="width: 70px; height: 70px;">
                                                        </td>
                                                        <td>${item.product.id}</td>
                                                        <td>
                                                            <fmt:formatNumber var="price" value="${item.product.price}"
                                                                type="number" pattern="##,###,###" />
                                                            ${price}
                                                        </td>
                                                        <td>${item.quantity}</td>
                                                        <fmt:formatNumber var="totalPrice" value="${item.price}"
                                                            type="number" pattern="##,###,###" />
                                                        <td>${totalPrice}</td>
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