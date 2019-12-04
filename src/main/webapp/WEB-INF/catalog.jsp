<%@ page import="ru.itpark.domain.Auto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Auto Catalog</title>
    <%@include file="bootstrap-css.jsp" %>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <h1>Catalog</h1>

            <div class="row">
                <% if (request.getAttribute("items") != null) {%>
                <% for (Auto item : (List<Auto>) request.getAttribute("items")) {%>
                <div class="col-sm-6 mt-3">
                    <div class="card">
                        <img src="<%=request.getContextPath() %>/images/<%= item.getImage()%>" class="card-img-top"
                             alt="<%=item.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= item.getName()%>
                            </h5>
                            <p class="card-text"><%= item.getDescription()%>
                            </p>
                        </div>
                    </div>
                </div>
                <%}%>
                <%}%>
            </div>
            <form action="<%=request.getContextPath()%>" method="post" enctype="multipart/form-data" class="mt-3">
                <div class="form-group">
                    <label for="name">Auto Name</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="description">Auto Description</label>
                    <textarea id="description" name="description" class="form-control" required></textarea>
                </div>

                <div class="custom-file">
                    <input type="file" id="file" name="image" class="custom-file-input" accept="image/*" required>
                    <label class="custom-file-label" for="file">Choose image...</label>
                 </div>
                <button type="submit" class="btn btn-primary mt-3">Create</button>
            </form>
        </div>
    </div>
</div>
<%@include file="bootstrap-scripts.jsp" %>
</body>
</html>