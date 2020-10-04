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
                <li><a href="/search">Search Thesis</a></li>
            </ul>
        </div>
    </div>
</div>


<div class="container" id="homediv">
    <div class="jumbotron text-center">
        <h2>Search existing research topics</h2>
    </div>
    <form class="form-horizontal" method="POST" action="/search" enctype="multipart/form-data">
        <div class="form-group">
            <label class="form-control-placeholder"  font-style="normal"> Enter a name or keywords:</label>
            </br><div class="col-md-7">
            <input class="form-control" maxlength="2048" title="Search" aria-autocomplete="both" aria-autocomplete="both" type="text" placeholder="Search" aria-label="Search">
        </div>
       </div>
        <div class="form-group ">
            <label class="control-label col-md-2"></label>
            <input type="submit" class="btn btn-light" value="Search" />
            <input type="reset" class="btn btn-light" value="Clear" />
        </div>
    </form>
</div>

    <div class="container text-center" id="tasksDiv">
        <h3>All approved Student Thesis</h3>
        <hr>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>Document Location</th>
                    <th>Download</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.title}</td>
                        <td>${student.docLocation}</td>
                        <td><a href="/delete-student?id=${student.id}"><span class="glyphicon glyphicon-circle-arrow-down"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="text/javascript">
    if (document.getElementById("tasksDiv")){
        document.getElementById("map").style.display="none";
    }
</script>
</body>
</html>