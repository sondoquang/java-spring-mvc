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
                                    <li class="breadcrumb-item active"><a href="/admin/products">products</a></li>
                                    <li class="breadcrumb-item">detail</li>
                                </ol>
                            </div>
                            <div class="p-4 ">
                                <div class="table mt-3">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h2>Product Information with id: ${product.id}</h2>
                                    </div>
                                    <hr>
                                    <div class="card" style="width:60%;">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item">
                                                <img src="${urlImage}" alt="product">
                                            </li>
                                            <li class="list-group-item">Product Id: ${product.id}</li>
                                            <li class="list-group-item">Name Product: ${product.name}</li>
                                            <li class="list-group-item">Detail Description: ${product.detailDesc}</li>
                                            <li class="list-group-item">Short Description: ${product.shortDesc}</li>
                                            <li class="list-group-item">Price: ${product.price}</li>
                                            <li class="list-group-item">Quantity: ${product.quantity}</li>

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
                <script src="/js/scripts.js"></script>
            </body>

            </html>