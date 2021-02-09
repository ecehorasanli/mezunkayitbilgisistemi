<%@ page import="com.mezunkayitbilgisistemi.model.User" %>
<%@ page import="com.mezunkayitbilgisistemi.model.OgretimUyeleri" %>
<%@ page import="com.mezunkayitbilgisistemi.model.Ogrenci" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>Mezuniyet Bilgisi Ekle / Güncelle</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<script>
    function kontrol(){
        if (document.form.ad.value == ""){
            alert ( "Okula Başlama Tarihi Giriniz: " );
            return false;
        }
        return true;
    }
</script>
<body>
<div class="container">

    <spring:url value="/mezuniyet/addMezuniyet" var="addURL" />

    <h2>Kariyer Ekle</h2>

    <%--@elvariable id="stajbilgisiForm" type="java"--%>
    <form:form name="form" modelAttribute="stajbilgisiForm" method="post" action="${addURL}" cssClass="form" onsubmit="return kontrol();" >

        <form:hidden path="id"/>

    <div class="form-group">

        <div class="form-group">
            <label>Öğrenci Adı</label>

            <form:select path = "ogrenci" id = "ogrenci" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Öğrenci Seçiniz" />
                <form:options items = "${ogrenciList}" itemLabel="ad"/>

            </form:select>

        </div>

        <div class="form-group">
            <label>Öğrenci Numarası</label>

            <form:select path = "Ogrenci" id = "ogrenci" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Öğrenci Numarası Seçiniz" />
                <form:options items = "${ogrenciList}" itemLabel="number"/>

            </form:select>

        </div>


        <div class="form-group">
            <label>Kariyer</label>

            <form:select path = "kariyer" id = "kariyer" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Kariyer Seçiniz" />

                <form:options items = "${kariyerList}" itemLabel="ad"/>

            </form:select>

        </div>


        <div class="form-group">
            <label>Okula Başlama Tarihi</label>
            <form:input path="okulaBaslamaTarihi" type="date" cssClass="form-control"  id="okulaBaslamaTarihi" name="trip-start" />
        </div>


        <button type="submit" class="btn btn-success">Mezuniyet Ekle / Güncelle</button>

        <div class="form-group">
            <label>Mezun Olma Tarihi</label>
            <form:input path="mezuniyetTarihi" type="date" cssClass="form-control"  id="mezuniyetTarihi" name="trip-start" />
        </div>


        <button type="submit" class="btn btn-success">Mezuniyet Ekle / Güncelle</button>

        </form:form>

    </div>
</body>
</html>