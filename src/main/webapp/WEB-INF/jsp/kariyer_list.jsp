<%@ page import="com.mezunkayitbilgisistemi.model.OgretimUyeleri" %>
<%@ page import="com.mezunkayitbilgisistemi.model.User" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.mezunkayitbilgisistemi.services.OgretimUyeleriService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
    User user = (User) request.getSession().getAttribute("user");
    OgretimUyeleri ogretimUyeleri  = (OgretimUyeleri) request.getSession().getAttribute("ogretimUyeleri");
    if (ogretimUyeleri == null)
        response.sendRedirect("/ogrenci_login");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kariyer Bilgileri</title>
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
                <li><a href="/ogretimUyeleri/list">DogretimUyeleri Bilgileri</a></li>
                <li ><a href="/mezuniyet/list">Mezuniyet Bilgileri</a></li>
                <li><a href="/kariyer/list">Kariyer Bilgileri</a></li>
            </ul><br>

            <spring:url value="/logout" var="addURL" />

            <form:form method="post" action="${addURL}" cssClass="form" >
                <input class="btn btn-info" type="submit" value="Çıkış Yap">
            </form:form>
        </div>
        <br>



        <div class="col-sm-10">
            <div class="well">

                <c:if test="${message != null}">
                    <div class="alert alert-danger" role="alert"> ${message} </div>
                </c:if>

                <c:if test="${message == null}">
                    <div class="alert alert-primary" role="alert"> ${message} </div>
                </c:if>
                <table class="table table-striped">
                    <thead class="thead-dark">
                    <th scope="row">Staj Şirketi</th>
                    <th scope="row">Staja Başlama tarihi</th>
                    <th scope="row">Staj bitirme tarihi</th>
                    <th scope="row">Çalıştığı Şirket</th>
                    <th scope="row">Güncelle</th>
                    <th scope="row">Sil</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${kariyerList}" var="kariyerbirim" >
                        <tr>
                            <td>${kariyer.stajSirkeri}</td>
                            <<td><fmt:formatDate value="${kariyer.stajaBaslamaTarihi}" pattern="dd/MM/yyyy" /></td>
                            <td><fmt:formatDate value="${kariyer.stajBitirmeTarihi}" pattern="dd/MM/yyyy" /></td>
                            <td>${kariyer.kontakttel}</td>
                            <td>
                                <spring:url value="/kariyer/editKariyer/${kariyer.id}" var="editURL" />
                                <a class="btn btn-info" href="${editURL}" role="button" >Güncelle</a>
                            </td>
                            <td>
                                <spring:url value="/kariyer/deleteKariyer/${kariyer.id}" var="deleteURL" />
                                <a class="btn btn-danger" href="${deleteURL}" role="button" >Sil</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <spring:url value="/kariyer/addSKariyer/" var="addURL" />
                <a class="btn btn-success" href="${addURL}" role="button" >Kariyer Ekle</a>


            </div>

        </div>
    </div>
</div>


</body>
</html>