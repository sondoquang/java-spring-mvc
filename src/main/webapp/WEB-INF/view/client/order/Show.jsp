<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                    <title>Order-History</title>
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
                        <h1 class="text-center text-white display-6">Order history</h1>
                        <ol class="breadcrumb justify-content-center mb-0">
                            <li class="breadcrumb-item"><a href="/home">Home</a></li>
                            <li class="breadcrumb-item active text-white">Order History</li>
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
                                            <th scope="col">Sản Phẩm</th>
                                            <th scope="col">Tên Sản Phẩm</th>
                                            <th scope="col">Đơn Giá</th>
                                            <th scope="col">Số Lượng</th>
                                            <th scope="col">Thành Tiền</th>
                                            <th scope="col">Trạng Thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td colspan="2">Order Id = ${order.id}</td>
                                                <td colspan="1">
                                                    <fmt:formatNumber type="number" value=" ${order.totalPrice}" />
                                                    đ
                                                </td>
                                                <td colspan="2"></td>
                                                <td colspan="1">
                                                    ${order.status = true?'Complete':'Pending'}
                                                </td>
                                            </tr>
                                            <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img src="/images/product/${orderDetail.product.image}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <a href="/product/${orderDetail.product.id}"
                                                                target="_blank">
                                                                ${orderDetail.product.name}
                                                            </a>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.price}" />
                                                            đ
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${orderDetail.quantity}">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.price * orderDetail.quantity}" /> đ
                                                        </p>
                                                    </td>
                                                    <td></td>

                                                </tr>
                                            </c:forEach>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <p class="text-success" ${orders.size()>0?"hidden":""} >Giỏ hàng của bạn
                                    hiện
                                    không có sản phẩm</p>
                            </div>
                            <div class="row pt-5" ${list==null?"hidden":""}>
                                <div class="col-sm-12 ">
                                    <div class="col-12">
                                        <h3>Thông tin đơn hàng</h3>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="bg-light rounded">
                                            <div class="p-4">
                                                <div class="d-flex justify-content-between mb-4">
                                                    <p class="mb-0 me-4">Tạm tính:</p>
                                                    <fmt:formatNumber var="total" value="${totalPrice}" type="number"
                                                        pattern="##,###,###" />
                                                    <p class="mb-0" data-cart-total-price="${totalPrice}">${total}đ
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
                                            <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <div style="display: none;">
                                                    <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                        varStatus="status">
                                                        <div class="mb-3">
                                                            <div class="form-group">
                                                                <label>Id:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.id}"
                                                                    path="cartDetails[${status.index}].id" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Quantity:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.quantity}"
                                                                    path="cartDetails[${status.index}].quantity" />
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <div class="text-end">
                                                    <button type="submit"
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">Xác
                                                        nhận thanh toán
                                                    </button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
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