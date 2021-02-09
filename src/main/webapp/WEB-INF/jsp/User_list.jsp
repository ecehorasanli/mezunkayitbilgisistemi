<%@ page import="com.mezunkayitbilgisistemi.model.User" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.mezunkayitbilgisistemi.services.OgretimUyeleriService" %>
<%@ page import="com.mezunkayitbilgisistemi.model.OgretimUyeleri" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%
    User user = (User) request.getSession().getAttribute("user");
    OgretimUyeleri ogretimUyeleri = (OgretimUyeleri) request.getSession().getAttribute("ogretimUyeleri");
    if (ogretimUyeleri == null)
        response.sendRedirect("/ogrenci_login");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kullanıcı Bilgileri</title>
    <%--    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />--%>
    <%--    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
    <%--    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        html, body{
            height: 100%;
        }
        .container-fluid{
            height: 100%;
        }
        .row.content{
            height: 100%;
        }
        .sidenav {
            background-color: #f1f1f1;
            height: 100%;
        }
    </style>
</head>
<body>


<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-2 sidenav hidden-xl">
            <h2>Staj Takip Sistemi</h2>
            <br/>
            <hr class="mt-2 mb-3" style="border: 1px solid red;"/>
            <ul class="nav nav-pills nav-stacked">
                <br/>
                <br/>
                <br/>
                <br/>

                <li><a href="/ogrenci/list">Öğrenci Bilgileri</a></li>
                <li  class="active"><a href="/user/list">Kullanıcı Bilgileri</a></li>
                <li><a href="/ogretimUyeleri/list">Öğretim Üyeleri Bilgileri</a></li>
                <li><a href="/kariyer/list">Kariyer Bilgileri</a></li>
                <li><a href="/mezuniyet/list">Mezuniyet Bilgileri</a></li>
            </ul><br>

            <spring:url value="/logout" var="addURL" />

            <form:form method="post" action="${addURL}" cssClass="form" >
                <input class="btn btn-info" type="submit" value="Çıkış Yap">
            </form:form>
        </div>
        <br>



        <div class="col-sm-10">
            <div class="well">

                <spring:url value="/user/addUser/" var="addURL" />
                <a class="btn btn-success pull-right" href="${addURL}" role="button" >Yeni Kullanıcı Ekle</a>

                <c:if test="${message != null}">
                    <div class="alert alert-success" role="alert"> ${message} </div>
                </c:if>

                <table class="table table-striped">
                    <thead class="thead-dark">
                    <th scope="row">Kullanıcı Adı</th>
                    <th scope="row">Şifre</th>
                    <th scope="row">Ad</th>
                    <th scope="row">Soyad</th>
                    <th scope="row">Öğertim Üyesi</th>
                    <th scope="row">Güncelle</th>
                    <th scope="row">Sil</th>
                    </thead>
                    <tbody>

                    <c:forEach items="${userList}" var="user" >
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.password}</td>

                            <c:if test="${user.ogrenci.ad == null}">
                                <td>${user.ogretimUyesi.ad}</td>
                                <td>${user.ogretimUyesi.soyad}</td>

                                <c:if test="${user.ogretimUyesi.ad != null}">
                                    <td>✓</td>
                                </c:if>

                                <c:if test="${user.ogretimUyesi.ad == null}">
                                    <td></td>
                                </c:if>

                            </c:if>

                            <c:if test="${user.ogrenci.firstname != null}">
                                <td>${user.ogrenci.ad}</td>
                                <td>${user.ogrenci.soyad}</td>
                                <td>${user.ogrenci.ogretimUyesi.ad} ${user.student.ogretimUyesi.soyad}</td>
                            </c:if>

                            <td>
                                <spring:url value="/user/editUser/${user.id}" var="editURL" />
                                <a class="btn btn-info" href="${editURL}" role="button" >Güncelle</a>
                            </td>

                            <td>
                                <spring:url value="/user/deleteUser/${user.id}" var="deleteURL" />
                                <a class="btn btn-danger" href="${deleteURL}" role="button" >Sil</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>