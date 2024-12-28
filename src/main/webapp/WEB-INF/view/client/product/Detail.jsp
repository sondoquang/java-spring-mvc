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
                    <title>Laptopshop</title>
                </head>

                <body>


                    <!-- Navbar start -->
                    <jsp:include page="../layout/Header.jsp" />
                    <!-- Navbar End -->

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5 mt-4">
                                <div class="col-lg-8 col-xl-9">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/home">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">detail-product</li>
                                        </ol>
                                    </nav>
                                    <div class="row g-4">
                                        <div class="col-lg-6">
                                            <div class="border rounded">
                                                <a href="#">
                                                    <img src="/images/product/${product.image}"
                                                        class="img-fluid rounded" alt="Image">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <h4 class="fw-bold mb-3">${product.name}</h4>
                                            <p class="mb-3">Factory: ${product.factory} </p>
                                            <fmt:formatNumber var="price" value="${product.price}" type="number"
                                                pattern="##,###,###,##0.00"></fmt:formatNumber>
                                            <h5 class="fw-bold mb-3">${price} đ</h5>
                                            <div class="d-flex mb-4">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p class="mb-4">${product.shortDesc}</p>
                                            <div class="input-group quantity mb-5" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text"
                                                    class="form-control form-control-sm text-center border-0" value="1"
                                                    name="quantity" data-product-index="0">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <form:form action="/product/${productId}/add" method="post">
                                                <input type="text" class="form-control d-none" name="quantity"
                                                    id="cartDetails0.quantity" value="1">
                                                <button type="submit"
                                                    class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart
                                                </button>
                                            </form:form>
                                        </div>
                                        <div class="col-lg-12">
                                            <nav>
                                                <div class="nav nav-tabs mb-3">
                                                    <button class="nav-link active border-white border-bottom-0"
                                                        type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                        data-bs-target="#nav-about" aria-controls="nav-about"
                                                        aria-selected="true">Description</button>
                                                </div>
                                            </nav>
                                            <div class="tab-content mb-5">
                                                <div class="tab-pane active" id="nav-about" role="tabpanel"
                                                    aria-labelledby="nav-about-tab">
                                                    <p>${product.detailDesc}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <form action="#">
                                            <h4 class="mb-5 fw-bold">Leave a Reply</h4>
                                            <div class="row g-4">
                                                <div class="col-lg-6">
                                                    <div class="border-bottom rounded">
                                                        <input type="text" class="form-control border-0 me-4"
                                                            placeholder="Yur Name *">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="border-bottom rounded">
                                                        <input type="email" class="form-control border-0"
                                                            placeholder="Your Email *">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="border-bottom rounded my-4">
                                                        <textarea name="" id="" class="form-control border-0" cols="30"
                                                            rows="8" placeholder="Your Review *"
                                                            spellcheck="false"></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="d-flex justify-content-between py-3 mb-5">
                                                        <div class="d-flex align-items-center">
                                                            <p class="mb-0 me-3">Please rate:</p>
                                                            <div class="d-flex align-items-center"
                                                                style="font-size: 12px;">
                                                                <i class="fa fa-star text-muted"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <a href="#"
                                                            class="btn border border-secondary text-primary rounded-pill px-4 py-3">
                                                            Post Comment</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-xl-3">
                                    <div class="row g-4 fruite">
                                        <div class="col-lg-12">
                                            <div class="input-group w-100 mx-auto d-flex mb-4">
                                                <input type="search" class="form-control p-3" placeholder="keywords"
                                                    aria-describedby="search-icon-1">
                                                <span id="search-icon-1" class="input-group-text p-3"><i
                                                        class="fa fa-search"></i></span>
                                            </div>
                                            <div class="mb-4">
                                                <h4>Categories</h4>
                                                <ul class="list-unstyled fruite-categorie">
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a>
                                                            <span>(3)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Dell</a>
                                                            <span>(5)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Asus</a>
                                                            <span>(2)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Acer</a>
                                                            <span>(8)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Lenovo</a>
                                                            <span>(5)</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Thay thế nếu có thời gian -->
                            <h1 class="fw-bold mb-0">Related products</h1>
                            <div class="vesitable">
                                <div class="owl-carousel vegetable-carousel justify-content-center">
                                    <div class="border border-primary rounded position-relative vesitable-item">
                                        <div class="vesitable-img">
                                            <img src="/client/img/vegetable-item-6.jpg"
                                                class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; right: 10px;">Vegetable</div>
                                        <div class="p-4 pb-0 rounded-bottom">
                                            <h4>Parsely</h4>
                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                                incididunt</p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                                                <a href="#"
                                                    class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border border-primary rounded position-relative vesitable-item">
                                        <div class="vesitable-img">
                                            <img src="/client/img/vegetable-item-1.jpg"
                                                class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; right: 10px;">Vegetable</div>
                                        <div class="p-4 pb-0 rounded-bottom">
                                            <h4>Parsely</h4>
                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                                incididunt</p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                                                <a href="#"
                                                    class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border border-primary rounded position-relative vesitable-item">
                                        <div class="vesitable-img">
                                            <img src="/client/img/vegetable-item-3.png"
                                                class="img-fluid w-100 rounded-top bg-light" alt="">
                                        </div>
                                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; right: 10px;">Vegetable</div>
                                        <div class="p-4 pb-0 rounded-bottom">
                                            <h4>Banana</h4>
                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                                incididunt</p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                                <a href="#"
                                                    class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border border-primary rounded position-relative vesitable-item">
                                        <div class="vesitable-img">
                                            <img src="/client/img/vegetable-item-4.jpg"
                                                class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; right: 10px;">Vegetable</div>
                                        <div class="p-4 pb-0 rounded-bottom">
                                            <h4>Bell Papper</h4>
                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                                incididunt</p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                                <a href="#"
                                                    class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border border-primary rounded position-relative vesitable-item">
                                        <div class="vesitable-img">
                                            <img src="/client/img/vegetable-item-5.jpg"
                                                class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; right: 10px;">Vegetable</div>
                                        <div class="p-4 pb-0 rounded-bottom">
                                            <h4>Potatoes</h4>
                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                                incididunt</p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                                <a href="#"
                                                    class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border border-primary rounded position-relative vesitable-item">
                                        <div class="vesitable-img">
                                            <img src="/client/img/vegetable-item-6.jpg"
                                                class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; right: 10px;">Vegetable</div>
                                        <div class="p-4 pb-0 rounded-bottom">
                                            <h4>Parsely</h4>
                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                                incididunt</p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                                <a href="#"
                                                    class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border border-primary rounded position-relative vesitable-item">
                                        <div class="vesitable-img">
                                            <img src="/client/img/vegetable-item-5.jpg"
                                                class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; right: 10px;">Vegetable</div>
                                        <div class="p-4 pb-0 rounded-bottom">
                                            <h4>Potatoes</h4>
                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                                incididunt</p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                                <a href="#"
                                                    class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border border-primary rounded position-relative vesitable-item">
                                        <div class="vesitable-img">
                                            <img src="/client/img/vegetable-item-6.jpg"
                                                class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; right: 10px;">Vegetable</div>
                                        <div class="p-4 pb-0 rounded-bottom">
                                            <h4>Parsely</h4>
                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                                incididunt</p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                                <a href="#"
                                                    class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                    cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Single Product End -->

                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <div class="tab-class text-center">
                                <div class="row g-4">
                                    <div class="col-lg-4 text-start">
                                        <h1>Our Organic Products</h1>
                                    </div>
                                    <div class="col-lg-8 text-end">
                                        <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                            <li class="nav-item">
                                                <a class="d-flex m-2 py-2 bg-light rounded-pill active"
                                                    data-bs-toggle="pill" href="#tab-1">
                                                    <span class="text-dark" style="width: 130px;">All Products</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane fade show p-0 active">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-5.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Grapes</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-5.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Grapes</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-2.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Raspberries</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-4.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Apricots</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-3.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Banana</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-1.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Oranges</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-2.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Raspberries</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-5.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Grapes</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tab-2" class="tab-pane fade show p-0">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-5.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Grapes</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-2.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Raspberries</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tab-3" class="tab-pane fade show p-0">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-1.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Oranges</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-6.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Apple</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tab-4" class="tab-pane fade show p-0">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-5.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Grapes</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-4.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Apricots</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tab-5" class="tab-pane fade show p-0">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-3.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Banana</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-2.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Raspberries</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/client/img/fruite-item-1.jpg"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Fruits</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>Oranges</h4>
                                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing
                                                                    elit
                                                                    sed
                                                                    do eiusmod te incididunt</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg
                                                                    </p>
                                                                    <a href="#"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer Start -->
                    <jsp:include page="../layout/Footer.jsp" />
                    <!-- Footer End -->

                    <!-- Copyright Start -->
                    <div class="container-fluid copyright bg-dark py-4">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                    <span class="text-light"><a href="#"><i
                                                class="fas fa-copyright text-light me-2"></i>Your
                                            Site Name</a>, All right reserved.</span>
                                </div>
                                <div class="col-md-6 my-auto text-center text-md-end text-white">
                                    <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                                    <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                                    <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                                    Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                                    Distributed
                                    By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Copyright End -->



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