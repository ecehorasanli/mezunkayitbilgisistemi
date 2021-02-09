package com.mezunkayitbilgisistemi.model;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.*;
import java.util.Set;

@Entity


public class OgretimUyeleri {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int id;

    @Column(nullable = false, length = 15)
    private String ogrtad;

    @Column( nullable = false, length = 15)
    private String ogrtsoyad;

    @Column( nullable = false, length = 30)
    private String ogrtbolumad;

    @Column( nullable = false, length = 15)
    private String ogrtunvan;

    @Column( nullable = false, length = 15)
    private String ogrtemail;

    @Column( nullable = false, length = 15)
    private String ogrttelefon;

   @ManyToOne
    private Ogrenci ogrenci;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOgrtad() {
        return ogrtad;
    }

    public void setOgrtad(String ogrtad) {
        this.ogrtad = ogrtad;
    }

    public String getOgrtsoyad() {
        return ogrtsoyad;
    }

    public void setOgrtsoyad(String ogrtsoyad) {
        this.ogrtsoyad = ogrtsoyad;
    }

    public String getOgrtbolumad() {
        return ogrtbolumad;
    }

    public void setOgrtbolumad(String ogrtbolumad) {
        this.ogrtbolumad = ogrtbolumad;
    }

    public String getOgrtunvan() {
        return ogrtunvan;
    }

    public void setOgrtunvan(String ogrtunvan) {
        this.ogrtunvan = ogrtunvan;
    }

    public String getOgrtemail() {
        return ogrtemail;
    }

    public void setOgrtemail(String ogrtemail) {
        this.ogrtemail = ogrtemail;
    }

    public String getOgrttelefon() {
        return ogrttelefon;
    }

    public void setOgrttelefon(String ogrttelefon) {
        this.ogrttelefon = ogrttelefon;
    }
/*
    public OgrenciBilgileri getOgrenciBilgileri() {
        return ogrenciBilgileri;
    }

    public void setOgrenciBilgileri(OgrenciBilgileri ogrenciBilgileri) {
        this.ogrenciBilgileri = ogrenciBilgileri;
    }

 */
}
