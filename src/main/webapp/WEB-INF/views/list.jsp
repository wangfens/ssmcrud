<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

-<html>
<head>
    <title>用户界面</title>


    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">


        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>

    </div>
    <div class="row">

        <div class="col-md-4 col-md-offset-8">

            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">

            <table class="table table-hover">
                <tr>
                    <th>#</th>

                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>

                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M"?"男":"女"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <span class="glyphicon glyphicon-pencil"/>
                            <button class="btn btn-primary btn-sm">

                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                新增
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>


                        </th>
                    </tr>
                </c:forEach>
            </table>


        </div>


    </div>
    <div class="row">
        <div class="col-md-6">

            当前${pageInfo.pageNum}页,总共${pageInfo.pages}页面，总共${pageInfo.total}记录
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="#">首页</a></li>
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num }</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${APP_PATH}/emps?pn=${page_Num }">${page_Num }</a></li>
                        </c:if>
                    </c:forEach>


                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li><a href="#">尾页</a></li>
                </ul>
            </nav>

        </div>


    </div>
</div>
</body>
</html>
