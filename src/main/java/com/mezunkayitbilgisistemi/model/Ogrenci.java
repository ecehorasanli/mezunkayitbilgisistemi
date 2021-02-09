package com.mezunkayitbilgisistemi.model;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;


import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity


public class Ogrenci {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column( nullable = false, length = 20)
    private String ad;

    @Column(nullable = false, length = 20)
    private String soyad;

    @Column(nullable = false, length = 30)
    private String email;

    @Column( nullable = false, length = 11)
    private int telefon;

    @Column( nullable = false, length = 30)
    private String bolum;

    @Column( nullable = false )
    private java.sql.Date okulaBaslamaTarihi;

    @Column( nullable = false)
    //@DateTimeFormat(pattern = "dd-MM-yyyy" )
    private java.sql.Date mezuniyetTarihi;

    @Column(nullable = false, length = 200)
    private String adres;

    @OneToOne(cascade = CascadeType.REMOVE)
    private User user;

    @OneToMany(mappedBy="OgrenciBilgileri", cascade = CascadeType.REMOVE )
    private Set<Mezuniyet> mezuniyet;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad){
        this.ad=ad;
    }

    public String getSoyad() {
        return soyad;
    }

    public void setSoyad(String soyad){
        this.soyad=soyad;
    }

    public String getEmail(){
        return email;
    }

    public void setEmail(String email){
        this.email=email;
    }

    public int getTelefon(){
        return telefon;
    }

    public void setTelefon(int telefon){
        this.telefon=telefon;
    }

    public String getBolum() {
        return bolum;
    }

    public void setBolum(String bolum) {
        this.bolum = bolum;
    }

    public Date getOkulaBaslamaTarihi() {
        return okulaBaslamaTarihi;
    }

    public void setOkulaBaslamaTarihi(Date okulaBaslamaTarihi) {
        this.okulaBaslamaTarihi = okulaBaslamaTarihi;
    }

    public Date getMezuniyetTarihi() {
        return mezuniyetTarihi;
    }

    public void setMezuniyetTarihi(Date mezuniyetTarihi) {
        this.mezuniyetTarihi = mezuniyetTarihi;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }
}
