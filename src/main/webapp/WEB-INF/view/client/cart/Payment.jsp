<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                    <title>Laptopshop</title>
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->


                    <!-- Navbar start -->
                    <jsp:include page="../layout/Header.jsp" />
                    <!-- Navbar End -->


                    <!-- Single Page Header start -->
                    <div class="container-fluid page-header py-5">
                        <h1 class="text-center text-white display-6">Cart</h1>
                        <ol class="breadcrumb justify-content-center mb-0">
                            <li class="breadcrumb-item"><a href="/home">Home</a></li>
                            <li class="breadcrumb-item active text-white">Cart</li>
                        </ol>
                    </div>
                    <!-- Single Page Header End -->

                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Products</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${list.size() > 0}">
                                            <c:forEach var="cartDetail" items="${list}">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img src="/images/product/${cartDetail.product.image}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <p class="mb-0 mt-4">${cartDetail.product.name}</p>
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber var="priceProduct"
                                                            value="${cartDetail.product.price}" type="number"
                                                            pattern="##,###,###,##0.00" />
                                                        <p class="mb-0 mt-4">${priceProduct}</p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <!--  -->
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${cartDetail.quantity}"
                                                                data-product-price="${cartDetail.product.price}"
                                                                data-product-id="${cartDetail.id}" readonly>
                                                            <!--  -->
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber var="price" value="${cartDetail.price}"
                                                            type="number" pattern="##,###,###" />
                                                        <p class="mb-0 mt-4" data-product-detail-id="${cartDetail.id}">
                                                            ${price}đ</p>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                                <p class="text-success" ${sessionScope.sumCart !=0?"hidden":""}>Giỏ hàng của bạn
                                    hiện
                                    không có sản phẩm</p>
                            </div>
                            <form:form action="/place-order" method="post">
                                <div class="row pt-5" ${list==null?"hidden":""}>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="col-sm-6">
                                        <div class="col-12">
                                            <h3>Thông tin người nhận</h3>
                                        </div>
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Tên người nhận:</label>
                                            <input type="text" name="receiverName" class="form-control" id="name"
                                                placeholder="Nguyen Van A">
                                        </div>
                                        <div class="mb-3">
                                            <label for="address" class="form-label">Địa chỉ:</label>
                                            <input type="text" name="receiverAddress" class="form-control" id="address"
                                                placeholder="Tỉnh/Thành phố: ">
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="form-label">Số điện thoại:</label>
                                            <input type="text" name="receiverPhone" class="form-control" id="phone"
                                                placeholder="0 xxx xxx xx">
                                        </div>
                                        <div class="col-12 form-group mb-3">
                                            <label>Hình thức thanh toán</label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="paymentMethod"
                                                    value="COD" id="COD" checked>
                                                <label class="form-check-label" for="COD">
                                                    Thanh toán khi nhận hàng
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="paymentMethod"
                                                    value="BANKING" id="BANKING">
                                                <label class="form-check-label" for="BANKING">
                                                    Thanh toán bằng ví VNPAY
                                                </label>
                                            </div>
                                        </div>
                                        <div class="mt-3">
                                            <a href="/carts"><i class="fa-solid fa-arrow-left"></i> Quay lại giỏ
                                                hàng</a>
                                        </div>
                                        <input type="text" name="totalPrice" value="${totalPrice}"
                                            style="display: none;">

                                        </form>
                                    </div>
                                    <div class="col-sm-6 ">
                                        <div class="col-12">
                                            <h3>Thông tin đơn hàng</h3>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="bg-light rounded">
                                                <div class="p-4">
                                                    <div class="d-flex justify-content-between mb-4">
                                                        <p class="mb-0 me-4">
                                                            <Tạm tính:/p>
                                                                <fmt:formatNumber var="total" value="${totalPrice}"
                                                                    type="number" pattern="##,###,###" />
                                                                <p class="mb-0" data-cart-total-price="${totalPrice}">
                                                                    ${total}đ
                                                                </p>
                                                    </div>
                                                    <div class="d-flex justify-content-between">
                                                        <p class="mb-0 me-4">Phí vận chuyển</p>
                                                        <div class="">
                                                            <p class="mb-0">0 đ</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div
                                                    class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                    <p class="mb-0 ps-4 me-4">Tổng tiền:</p>
                                                    <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">${total}đ
                                                    </p>
                                                </div>
                                                <div class="justify-content-center">
                                                    <button type="submit"
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                                        type="button">Thanh toán</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                    <!-- Cart Page End -->
                    <!-- Footer Start -->
                    <jsp:include page="../layout/Footer.jsp" />
                    <!-- Footer End -->



                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>

                </body>

                </html>