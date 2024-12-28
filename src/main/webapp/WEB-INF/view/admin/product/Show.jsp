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
                <title>Product - SB Admin</title>
                <style>
                    td,
                    th {
                        text-align: center !important;
                        align-content: center !important;
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
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Product</li>
                                </ol>
                            </div>
                            <div class="p-3  mt-2">
                                <div class="table mt-3">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h3>Table Product</h3>
                                        <a href="/admin/products/create" class="btn btn-primary">Create a Product</a>
                                    </div>
                                    <hr>
                                    <form method="post">
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Id</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Factory</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${products}">
                                                    <tr>
                                                        <th scope="row">${product.id}</th>
                                                        <td>${product.name}</td>
                                                        <td>
                                                            <fmt:formatNumber var="price" value="${product.price}"
                                                                type="number" pattern="##,###,###" />
                                                            ${price}
                                                        </td>
                                                        <td>${product.factory}</td>
                                                        <td>
                                                            <a class="btn btn-success"
                                                                href="/admin/products/${product.id}/view">View</a>
                                                            <a class="btn btn-warning"
                                                                href="/admin/products/${product.id}/update">Update</a>
                                                            <a class="btn btn-danger"
                                                                href="/admin/products/${product.id}/delete">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </form>
                                    <nav class="mt-5">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item p-0">
                                                <a class="page-link"
                                                    href="/admin/products?page=${param.pageNo>11?pageNo-1:1}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach var="page" begin="1" end="${size}" step="1">
                                                <li class="page-item p-0"><a
                                                        class="page-link ${pageNo == page?'active':''}"
                                                        href="/admin/products?page=${page}">${page}</a></li>
                                            </c:forEach>
                                            <li class="page-item p-0">
                                                <a class="page-link"
                                                    href="/admin/products?page=${param.pageNo<size?pageNo+1:size}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
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