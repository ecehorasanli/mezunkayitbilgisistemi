package com.mezunkayitbilgisistemi.model;

import javax.persistence.Column;
import javax.persistence.*;

@Entity

public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column(nullable = false, length=20)
    private String username;

    @Column( nullable = false, length=20)
    private String password;

    @OneToOne(mappedBy = "user", cascade = CascadeType.REMOVE)
    @PrimaryKeyJoinColumn
    private Ogrenci ogrenci;

    @OneToOne(mappedBy = "user", cascade = CascadeType.REMOVE)
    @PrimaryKeyJoinColumn
    private OgretimUyeleri ogretimUyeleri;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Ogrenci getOgrenci() {
        return ogrenci;
    }

    public void setOgrenci(Ogrenci ogrenci) {
        this.ogrenci = ogrenci;
    }

    public void setOgretimUyeleri(OgretimUyeleri ogretimUyeleri) {
        this.ogretimUyeleri = ogretimUyeleri;
    }

    public OgretimUyeleri getOgretimUyeleri() {
        return ogretimUyeleri;
    }

}
