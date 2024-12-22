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
                            <div class="p-4 mt-5">
                                <div class="row">
                                    <div class="col-md-10 col-12 mx-auto">
                                        <h2>Create a User</h2>
                                        <hr>
                                        <form:form action="/admin/users/create" method="post" modelAttribute="newUser"
                                            enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Email:</label>
                                                    <form:input type="email" class="form-control" path="email"
                                                        placeholder="Enter email" />
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Password:</label>
                                                    <form:input type="password" class="form-control" path="password"
                                                        placeholder="Enter Password" />
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Phone number:</label>
                                                    <form:input type="text" class="form-control" path="phone"
                                                        placeholder="Enter phone number" />
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">FullName:</label>
                                                    <form:input type="text" class="form-control" path="fullName"
                                                        placeholder="Enter FullName" />
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Address:</label>
                                                    <form:input type="text" class="form-control" path="address"
                                                        placeholder="Enter address" />
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Role :</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="admin">Admin</form:option>
                                                        <form:option value="user">User</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Upload Avatar :</label>
                                                    <div class="input-group">
                                                        <input type="file" class="form-control" id="avatarFile"
                                                            accept=".png, .jpg, .web, .jpeg" name="fileAvatar" />
                                                        <label class="input-group-text" for="avatarFile">Upload</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                        id="avatarPreview">
                                                </div>
                                                <p>${message}</p>
                                                <div class="mt-3">
                                                    <button type="submit" class="btn btn-primary">Create</button>
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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>