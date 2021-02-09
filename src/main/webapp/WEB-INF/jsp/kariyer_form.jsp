<%@ page import="com.mezunkayitbilgisistemi.model.OgretimUyeleri" %>
<%@ page import="com.mezunkayitbilgisistemi.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    OgretimUyeleri ogretimUyeleri  = (OgretimUyeleri) request.getSession().getAttribute("ogretimUyeleri");
    if (ogretimUyeleri == null)
        response.sendRedirect("/ogrenci_login");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Kariyer Ekle / Güncelle</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
    <script>
        function kontrol(){
            if (document.form.bolum.value == ""){
                alert ( "Bölüm Giriniz" );
                return false;
            }
            if (document.form.stajBaslamaTarihi.value == ""){
                alert ( "staj başlama tarihi Giriniz" );
                return false;
            }
            if (document.form.stajBitirmeTarihi.value == ""){
                alert ( "Staj Bitirme Tarihi Giriniz" );
                return false;
            }
            if (document.form.stajSirketi.value == ""){
                alert ( "Staj Şirketini Giriniz" );
                return false;
            }
            if (document.form.calistigiSirket.value == ""){
                alert ( "Çalıştığı Şirketi Giriniz" );
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">

    <spring:url value="/kariyer/addKariyer" var="addURL" />

    <h2>Kariyer Ekle</h2>

    <%--@elvariable id="kariyerForm" type="java"--%>
    <form:form  name="form" modelAttribute="kariyerForm" method="post" action="${addURL}" cssClass="form" onsubmit="return kontrol();">

        <form:hidden path="id"/>

    <div class="form-group">

        <label>Şirket Adı</label>

        <form:select path = "kariyer" id = "kariyer" cssClass="form-control">

            <form:option disabled="true" value = "" label = "Kariyer Seçiniz" />
            <form:options items = "${kariyerList}" itemLabel="ad"/>

        </form:select>

        <div class="form-group">

            <div class="form-group">
                <label>Kariyer Adı</label>
                <form:input path="ad" cssClass="form-control" id="ad" maxlength="45"/>
            </div>

            <div class="form-group">
                <label>Bölüm Ad</label>
                <form:input path="bolum" cssClass="form-control" id="bolum" maxlength="20"/>
            </div>

            <div class="form-group">
                <label>Staj Şirketi</label>
                <form:input path="stajSirketi" cssClass="form-control" id="stajSirketi" maxlength="50"/>
            </div>

            <div class="form-group">
                <label>Staj Başlama Tarihi</label>
                <form:input path="stajBaslamaTarihi" cssClass="form-control" id="stajBaslamaTarihi" />
            </div>

            <div class="form-group">
                <label>Staj Bitirme Tarihi</label>
                <form:input path="stajBitirmeTarihi" type="number" cssClass="form-control" id="stajBitirmeTarihi" />
            </div>

            <div class="form-group">
                <label>Çalıştığı Şirket</label>
                <form:input path="calistigiSirket" cssClass="form-control" id="calistigiSirket" maxlength="45"/>
            </div>

            <button type="submit" class="btn btn-success">Kariyer Ekle / Güncelle</button>
            </form:form>

        </div>
</body>
</html>