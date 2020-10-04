<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
    <title>research-topic duplicate | home</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div role="navigation">
    <div class="navbar navbar-inverse">
        <a href="/welcome" class="navbar-brand">Research duplicate prevention</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/login">Login</a></li>
                <li><a href="/register">New Registration</a></li>
                <li><a href="/show-students">All Students</a></li>
            </ul>
        </div>
    </div>
</div>

<c:choose>
<c:when test="${mode=='MODE_HOMEP'}">
    <div class="container" id="homediv">
        <div class="jumbotron text-center">
            <h1>Welcome to ProjectIV Research Thesis Repository System</h1>
            <h3>Please go ahead and search the research idea you have in mind</h3>
        </div>
    </div>
</c:when>

<div class="container" id="homediv">
    <div class="jumbotron text-center">
        <h1>Upload Research Thesis document</h1>
    </div>
    <form class="form-horizontal" method="POST" action="/upload" enctype="multipart/form-data">
        <div class="form-group">
            <label class="control-label col-md-3">Enter document Title:</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="title"
                       value="${doc.title}" />
            </div>
        </div>
        <form method="POST" action="/upload" >
            <input type="file" name="file" /><br/><br/>
            <input type="submit" value="Submit" />
        </form>

        <div class="form-group">
            <label class="control-label col-md-3">Enter document Keyword</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="username"
                       value="${student.username}" />
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-3">Enter document Keyword</label>
            <div class="col-md-7">
                <input type="file" class="glyphicon glyphicon-upload" name="file"
                       value="${student.username}" />
            </div>
        </div>
        <div class="form-group ">
            <input type="submit" class="glyphicon glyphicon-upload" value="Upload" />
        </div>
    </form>
</div>

</c:choose>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
</body>
</html>