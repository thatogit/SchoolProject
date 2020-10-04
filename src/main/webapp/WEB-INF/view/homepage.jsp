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
                <li><a href="/uploadFile">Document upload</a></li>
            </ul>
        </div>
    </div>
</div>
<c:choose>
<c:when test="${mode=='MODE_UPLOAD'}">
<div class="container" id="homediv">
    <div class="container text-center">
        <h1>DOCUMENT MANAGEMENT</h1>
    </div>
    <form class="form-horizontal" method="POST" action="/upload" enctype="multipart/form-data">
        <div class="form-group">
            <label class="control-label col-md-2">Enter document Title:</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="title"
                       value="${newDoc.title}" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Enter student number:</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="studNum"
                       value="${newDoc.student_number}" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Enter document Keyword(s):</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="keyword"
                       value="${newDoc.keyword}" />
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">                      </label>
            <div class="col-md-7">
                <input type="file" >
            </div>
        </div>
        <div class="form-group ">
            <label class="control-label col-md-2">         </label>
            <input type="submit" class="btn btn-primary" value="Add/Edit" />
            <label class="control-label col-md-2">                        </label>
            <input type="reset" class="btn btn-primary" value="Clear" />
            <input type="submit" class="btn btn-primary" value="Cancel" />
        </div>
    </form>
</div>
</c:when>

<c:when test="${mode=='ALL_STUDENTS_DOC'}">
    <div class="container text-center" id="tasksDiv">
        <h3>All approved Student Thesis</h3>
        <hr>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Student#</th>
                    <th>Title</th>
                    <th>Keywords</th>
                    <th>Document Location</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.studentnumber}</td>
                        <td>${student.firstname}</td>
                        <td>${student.lastname}</td>
                        <td>${student.studentnumber}</td>
                        <td>${student.keyword}</td>
                        <td>${student.docLocation}</td>
                        <td><a href="/delete-student?id=${student.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        <td><a href="/edit-student?id=${student.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</c:when>
</c:choose>
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
</body>
</html>