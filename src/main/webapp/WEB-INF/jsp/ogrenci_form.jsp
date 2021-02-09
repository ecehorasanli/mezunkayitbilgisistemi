<%@ page import="com.mezunkayitbilgisistemi.model.User" %>
<%@ page import="com.mezunkayitbilgisistemi.model.OgretimUyeleri" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<%--%>
<%-- User user = (User) request.getSession().getAttribute("user");--%>
<%-- if (user==null)--%>
<%--  response.sendRedirect("/student_login");--%>
<%--%>--%>

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
    <title>Öğrenci Ekle / Güncelle</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
    <script>
        function kontrol(){
            if (document.form.ad.value == ""){
                alert ( "Öğrenci Adını Giriniz" );
                return false;
            }
            if (document.form.soyad.value == ""){
                alert ( "Öğrenci Soyadı Giriniz" );
                return false;
            }
            if (document.form.email.value == ""){
                alert ( "Öğrenci Email Giriniz" );
                return false;
            }
            <!--<c:forEach items="${ogrenciList}" var="ogrenci" >
            if ((document.form.number.value == "${student.number}") && (document.form.user.value != "${student.user.id}")){
                alert("Bu Öğrenci Numarası Sistemde Kayıtlıdır !\r\n" + "${student.firstname}" + " ${student.lastname} " + (document.form.number.value))
                return false;
            }-->
            </c:forEach>
            if (document.form.telefon.value == ""){
                alert ( "Öğrenci Telefon Numarasını Giriniz" );
                return false;
            }
            if (document.form.bolum.value == ""){
                alert ( "Öğrenci Bölümünü Giriniz" );
                return false;
            }
            if (document.form.okulaBaslamaTarihi.value == ""){
                alert ( "Öğrenci Okula Başlama Tarihini Giriniz" );
                return false;
            }
            if (document.form.mezuniyetTarihi.value == ""){
                alert ( "Öğrenci Mezuniyet Tarihini Giriniz" );
                return false;
            }
            if (document.form.ogretimUyesi.value == ""){
                alert ( "Öğrenci Danışman Giriniz" );
                return false;
            }
            if (document.form.user.value == ""){
                alert ( "Öğrenci User Giriniz" );
                return false;
            }
            <c:forEach items="${ogrenciList}" var="ogrenci" >
            <%--if ((document.form.user.value != "${student.user.id}")){--%>
            <%-- alert("Yanlış Kullanıcı Girdiniz !")--%>
            <%-- return false;--%>
            <%--}--%>
            </c:forEach>
            return true;
        }
    </script>
</head>
<body>
<br/>
<div class="container">
    <spring:url value="/ogrenci/addOgrenci" var="addURL" />

    <h2>Öğrenci Ekle / Güncelle</h2>
    <br/>
    <%--@elvariable id="ogrenciForm" type="java"--%>
    <form:form name="form" modelAttribute="ogrenciForm" method="post" action="${addURL}" cssClass="form" onsubmit="return kontrol();">

        <form:hidden path="id"/>

        <div class="form-group">
            <label>Öğrencinin Adı</label>
            <form:input path="ad" cssClass="form-control" id="ad" maxlength="20"/>
        </div>

        <div class="form-group">
            <label>Öğrencinin Soyadı</label>
            <form:input path="soyad" cssClass="form-control" id="soyad" maxlength="20"/>
        </div>

        <div class="form-group">
            <label>Öğrencinin E-mail Adresi</label>
            <form:input path="email" cssClass="form-control" id="email" maxlength="20"/>
        </div>

        <div class="form-group">
            <label>Öğrencinin Telefonu</label>
            <form:input path="telefon" type="number" cssClass="form-control" id="telefon" maxlength="11"/>
        </div>

   <!--     <div class="form-group">
            <label>Öğrencinin Numarası</label>
            <form:input path="number" type="number" cssClass="form-control" id="number" maxlength="15"/>
        </div>
     -->

        <div class="form-group">
            <label>Öğrencinin Bölümü</label>
            <form:input path="bolum" cssClass="form-control" id="bolum" maxlength="30"/>
        </div>

        <div class="form-group">
            <label>Öğrencinin Okula Başladığı Tarihi</label>
            <form:input path="okulaBasladigiTarih" type="date" cssClass="form-control"  id="okulaBasladigiTarih" name="trip-start"/>
        </div>

        <div class="form-group">
            <label>Öğrencinin Mezuniyet Tarihi</label>
            <form:input path="mezunOlduguTarih" type="date" cssClass="form-control"  id="mezunOlduguTarih" name="trip-start"/>
        </div>

        <div class="form-group">
            <label>Öğrencinin Adresi</label>
            <form:input path="adres" cssClass="form-control" id="adres" maxlength="45"/>
        </div>


        <div class="form-group">
            <label>Öğrencinin Danışman Hocası</label>

            <form:select path = "ogretimUyeleri" id = "ogretimUyeleri" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Danisman Seçiniz" />
                <form:options items = "${ogretimUyeleriList}" itemLabel="ad"/>

            </form:select>
        </div>


        <div class="form-group">
            <label>Öğrencinin Kullanıcı Adı</label>

            <form:select path = "user" id = "user" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Kullanıcı Seçiniz" />
                <form:options items = "${userList}" itemLabel="username"/>

            </form:select>
        </div>


        <button type="submit" class="btn btn-success">Öğrenci Ekle / Güncelle</button>
    </form:form>

</div>
</body>
</html>