<%@ page import="com.mezunkayitbilgisistemi.model.User" %>
<%@ page import="org.springframework.context.support.AbstractApplicationContext" %>
<%@ page import="org.springframework.context.annotation.AnnotationConfigApplicationContext" %>
<%@ page import="com.mezunkayitbilgisistemi.services.OgretimUyeleriService" %>
<%@ page import="com.mezunkayitbilgisistemi.model.OgretimUyeleri" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>Öğretim Üyeleri Listesi</title>
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
            <h2>Mezun Kayıt/Bilgi Sistemi</h2>
            <br/>
            <hr class="mt-2 mb-3" style="border: 1px solid red;"/>
            <ul class="nav nav-pills nav-stacked">
                <br/>
                <br/>
                <br/>
                <br/>
                <li><a href="/ogrenci/list">Öğrenci Bilgileri</a></li>
                <li><a href="/user/list">Kullanıcı Bilgileri</a></li>
                <li class="active"><a href="/ogretimUyeleri/list">Öğretim Üyelesi Bilgileri</a></li>
                <li><a href="/Mezuniyet/list">Mezuniyet Bilgileri</a></li>
                <li><a href="/Kariyer/list">Kariyer Bilgileri</a></li>
            </ul><br>

            <spring:url value="/logout" var="addURL" />

            <form:form method="post" action="${addURL}" cssClass="form" >
                <input class="btn btn-info" type="submit" value="Çıkış Yap">
            </form:form>
        </div>
        <br>

        <div class="col-sm-10">
            <div class="well">

                <spring:url value="/ogretimUyeleri/addOgretimUyeleri/" var="addURL" />
                <a class="btn btn-success pull-right" href="${addURL}" role="button" >Yeni Kullanıcı Ekle</a>

                <c:if test="${message != null}">
                    <div class="alert alert-success" role="alert"> ${message} </div>
                </c:if>

                <table class="table table-striped">
                    <thead class="thead-dark">
                    <th scope="row">Öğretim Üyesi Ad Soyad</th>
                    <th scope="row">Username</th>
                    <th scope="row">Güncelle</th>
                    <th scope="row">Sil</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${ogretimUyeleriList}" var="ogretimUyeleri" >
                        <tr>
                            <td>${ogretimUyeleri.ad} ${ogretimUyeleri.soyad}</td>
                            <td>${ogretimUyeleri.user.username}</td>

                            <td>
                                <spring:url value="/ogretimUyeleri/editOgretimUyeleri/${ogretimUyeleri.id}" var="editURL" />
                                <a class="btn btn-info" href="${editURL}" role="button" >Güncelle</a>
                            </td>

                            <td>
                                <spring:url value="/ogretimUyeleri/deleteOgretimUyeleri/${ogretimUyeleri.id}" var="deleteURL" />
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