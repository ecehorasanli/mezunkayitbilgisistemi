<%@ page import="com.mezunkayitbilgisistemi.model.User" %>
<%@ page import="org.springframework.context.support.AbstractApplicationContext" %>
<%@ page import="org.springframework.context.annotation.AnnotationConfigApplicationContext" %>
<%@ page import="com.mezunkayitbilgisistemi.services.OgretimUyeleriService" %>
<%@ page import="com.mezunkayitbilgisistemi.model.OgretimUyeleri" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>Öğretim Üyeleri Ekle / Güncelle</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
    <script>
        function kontrol(){
            if (document.form.ad.value == ""){
                alert ( "Öğretim Üyesi Ad Giriniz" );
                return false;
            }
            if (document.form.soyad.value == ""){
                alert ( "Öğretim Üyesi Soyad Giriniz" );
                return false;
            }
            <c:forEach items="${ogretimUyesiList}" var="danisman" >
            if ((document.form.ad.value == "${ogretimUyesi.ad}") && (document.form.soyad.value == "${ogretimUyesi.soyad}") && (document.form.user.value != "${ogretimUyesi.user.id}")){
                alert("Öğretim Üyesi Sistemde Kayıtlıdır !\r\n" + "${ogretimUyesi.ad}" + " ${ogretimUyesi.soyad}");
                return false;
            }
            </c:forEach>
            <%--            <c:forEach items="${danismanList}" var="danisman" >--%>
            <%--            if ((document.form.user.value != "${danisman.user.id}")){--%>
            <%--                alert("Yanlış Kullanıcı Girdiniz !")--%>
            <%--                return false;--%>
            <%--            }--%>
            <%--            </c:forEach>--%>
            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <spring:url value="/ogretimUyesi/addOgretimUyesi" var="addURL" />

    <h2>Öğretim Üyesi Ekle / Güncelle</h2>

    <%--@elvariable id="ogretimUyesiForm" type="java"--%>
    <form:form name="form" modelAttribute="ogretimUyesiForm" method="post" action="${addURL}" cssClass="form" onsubmit="return kontrol();" >

        <form:hidden path="id"/>

    <div class="form-group">
        <label>Öğretim Üyesi Adı</label>
        <form:input path="ad" cssClass="form-control" id="ad" maxlength="20"/>
    </div>

    <div class="form-group">
        <label>Öğretim Üyesi Soyadı</label>
        <form:input path="soyad" cssClass="form-control" id="soyad" maxlength="30"/>
    </div>

    <div class="form-group">

        <label>Kullanıcı Adı</label>

        <form:select path = "user" id = "user" cssClass="form-control">

            <form:option disabled="true" value = "" label = "Kullanıcı Seçiniz" />
            <form:options items = "${userList}" itemLabel="username"/>

        </form:select>

        <div class="form-group">

            <button type="submit" class="btn btn-success">Öğretim Üyesi Ekle / Güncelle</button>
            </form:form>

        </div>
</body>
</html>