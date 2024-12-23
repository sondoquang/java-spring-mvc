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
                <title>Product - SB Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${product.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" })
                        }
                        avatarFile.change(function (e) {
                            console.log("chay")
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                                <h1 class="mt-4">Manager Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/admin">dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/products">products</a></li>
                                    <li class="breadcrumb-item">update</li>
                                </ol>
                            </div>
                            <div class="p-4 mt-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h2>Update a Product</h2>
                                        <form:form action="/admin/products/update" method="post"
                                            modelAttribute="product" enctype="multipart/form-data">
                                            <div class="row">
                                                <c:set var="errorName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorDetailDesc">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorShortDesc">
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>
                                                <div class="">
                                                    <form:input path="id" class="form-control d-none" />
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Name:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                        path="name" placeholder="Enter name product" />
                                                    ${errorName}
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Price:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                        path="price" placeholder="Enter Password" />
                                                    ${errorPrice}
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <div class="mb-3 col-12">
                                                        <label class="form-label">Detail description:</label>
                                                        <form:textarea type="text"
                                                            class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                            path="detailDesc" />
                                                        ${errorDetailDesc}
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Short description:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                                                        path="shortDesc" />
                                                    ${errorShortDesc}
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Quantity :</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                        path="quantity" placeholder="Enter address" />
                                                    ${errorQuantity}
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Factory :</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="APPLE">Apple (MacBook)</form:option>
                                                        <form:option value="ASUS">Asus</form:option>
                                                        <form:option value="LENOVO">Lenovo</form:option>
                                                        <form:option value="DELL">Dell</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="ACER">Acer</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Target :</label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="GAMING">Gaming</form:option>
                                                        <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng
                                                        </form:option>
                                                        <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                        </form:option>
                                                        <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                        <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Image:</label>
                                                    <div class="input-group">
                                                        <input type="file" class="form-control" id="avatarFile"
                                                            accept=".png, .jpg, .web, .jpeg" name="photoImage" />
                                                        <label class="input-group-text" for="avatarFile">Upload</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <img style="max-height: 250px; object-fit: cover;"
                                                        alt="avatar preview" id="avatarPreview">
                                                </div>
                                                <p>${message}</p>
                                                <div class="mt-3">
                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                </div>
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
                <script src="/js/scripts.js"></script>
            </body>

            </html>