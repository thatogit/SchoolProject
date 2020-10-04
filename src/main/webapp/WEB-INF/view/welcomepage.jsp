<%@ page import="org.duplicateresearches.model.DocumentStorage" %>
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
                <li><a href="/show-documents">Document Management</a></li>
            </ul>
        </div>
    </div>
</div>


<c:choose>
<c:when test="${mode=='MODE_HOME'}">
 <div class="container" id="homediv">
    <div class="jumbotron text-center">
        <h1>Welcome to ProjectIV Research Thesis Repository System</h1>
        <h3>Please go ahead and search the research idea you have in mind</h3>
    </div>
</div>
</c:when>

    <c:when test="${mode=='MODE_REGISTER'}">
<div class="container text-center">
    <h3>New Student Registration</h3>
    <hr>
    <form class="form-horizontal" method="POST" action="save-student">
        <input type="hidden" name="id" value="${student.id }" />
        <div class="form-group">
            <label class="control-label col-md-3">Username</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="username"
                       value="${student.username }" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">First Name</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="firstname"
                       value="${student.firstname }" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Last Name</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="lastname"
                       value="${student.lastname }" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Student Number</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="studentnumber"
                       value="${student.studentnumber}" />
            </div>
        </div>
            <div class="form-group">
                <label class="control-label col-md-3">Email </label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="email"
                           value="${student.email}" />
                </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Password</label>
            <div class="col-md-7">
                <input type="password" class="form-control" name="password"
                       value="${student.password }" />
            </div>
        </div>
        <div class="form-group">
                    <input type="submit" class="btn btn-primary col-sm" value="Register" />
                    <input type="reset" class="btn btn-primary col-sm" value="Reset" />
        </div>
    </form>

    </c:when>

<c:when test="${mode=='ALL_STUDENTS'}">
    <div class="container text-center">
        <h1>STUDENT MANAGEMENT</h1>
    </div>

    <div class="container text-center">
        <h3>Add/Update Student Details</h3>
        <hr>
        <form class="form-horizontal" method="POST" action="save-student">
            <input type="hidden" name="id" value="${newStudent.id }" />
            <div class="form-group">
                <label class="control-label col-md-3">Username</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="username"
                           value="${newStudent.username }" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">First Name</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="firstname"
                           value="${newStudent.firstname }" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Last Name</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="lastname"
                           value="${newStudent.lastname }" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Student Number</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="studentnumber"
                           value="${newStudent.studentnumber}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Email </label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="email"
                           value="${newStudent.email}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Password</label>
                <div class="col-md-7">
                    <input type="password" class="form-control" name="password"
                           value="${newStudent.password }" />
                </div>
            </div>
            <div class="form-group ">
                <c:if test="${newStudent.id != 0}">
                    <input type="submit" class="btn btn-primary" value="Update" />
                </c:if>
                <c:if test="${newStudent.id == 0}">
                    <input type="submit" class="btn btn-primary" value="Create" />
                </c:if>
                <input type="reset" class="btn btn-primary" value="Reset" />
            </div>
        </form>
    </div>

    <div class="container text-center" id="tasksDiv">
        <h3>All Students</h3>
        <hr>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>UserName</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Student Number</th>
                    <th>Email</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.username}</td>
                        <td>${student.firstname}</td>
                        <td>${student.lastname}</td>
                        <td>${student.studentnumber}</td>
                        <td>${student.email}</td>
                        <td><a href="/delete-student?id=${student.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        <td><a href="/edit-student?id=${student.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</c:when>


    <c:when test="${mode=='ALL_DOCUMENTS'}">
    <div class="container text-center">
        <h1>DOCUMENT MANAGEMENT</h1>
    </div>

    <div class="container text-center">
        <h3>Add/Update Documents</h3>
        <hr>
        <form class="form-horizontal" method="POST" action="save-document">
            <input type="hidden" name="id" value="${newDocument.id }" />
            <div class="form-group">
                <label class="control-label col-md-3">Title</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="title"
                           value="${newDocument.title}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Document Type</label>
                <div class="col-md-7">

                    <select name="documentType" value="${newDocument.documentType}" style="width: 100%">
                        <option value="PDF" selected="true">PDF</option>
                        <option value="DOC">DOC</option>
                        <option value="TEXT">TEXT</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Student</label>
                <div class="col-md-7">
                    <select name="studentLink" value="${newDocument.student}" style="width: 100%" >
                        <c:forEach items="${studentList}" var="student">
                            <option value="${newDocument.student}" >${student.studentnumber}-${student.lastname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Keywords</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name = "keywords" title="Enter comma seperated keywords"
                           value="${newDocument.keywords }" />
                </div>
            </div>

            <div class="form-group ">
                <c:if test="${newDocument.id != 0}">
                    <input type="submit" class="btn btn-primary" value="Update" />
                </c:if>
                <c:if test="${newDocument.id == 0}">
                    <input type="submit" class="btn btn-primary" value="Create" />
                </c:if>
                <input type="reset" class="btn btn-primary" value="Reset" />
            </div>
        </form>
    </div>

    <div class="container text-center" id="tasksDiv">
        <h3>All Documents</h3>
        <hr>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Document Type</th>
                    <th>Keywords</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="document" items="${documents}">
                    <tr>
                        <td>${document.id}</td>
                        <td>${document.title}</td>
                        <td>${document.documentType}</td>
                        <td>${document.keywords}</td>
                        <td><a href="/delete-document?id=${document.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        <td><a href="/edit-document?id=${document.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    </c:when>



    <c:when test="${mode=='MODE_LOGIN'}">
        <div class="container text-center">
            <h3>Student Login</h3>
            <hr>
            <form class="form-horizontal" method="POST" action="/login-student">
                <c:if test="${not empty error}">
                    <div class="alert-danger">
                    <c:out value="${error}"></c:out>
                    </div>
                </c:if>

                <div class="form-group">
                    <label class="control-label col-md-3">Username</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="username"
                               value="${student.username }" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Password</label>
                    <div class="col-md-7">
                        <input type="password" class="form-control" name="password"
                               value="${student.password }" />
                    </div>
                </div>
                <div class="form-group ">
                    <input type="submit" class="btn btn-primary" value="Login" />
                </div>
            </form>
        </div>
    </c:when>
</c:choose>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

</body>
</html>