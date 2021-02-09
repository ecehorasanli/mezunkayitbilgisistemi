package com.mezunkayitbilgisistemi.model;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity

public class Kariyer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column( nullable = false )
    private java.sql.Date stajBaslamaTarihi;

    @Column( nullable = false )
    private java.sql.Date stajBitirmeTarihi;

    @Column(nullable = false, length = 70)
    private String stajsirketi;

    @Column( nullable = false, length = 45)
    private String calistigisirket;

    @ManyToOne
    @JoinColumn
    private Ogrenci ogrenci;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStajBaslamaTarihi() {
        return stajBaslamaTarihi;
    }

    public void setStajBaslamaTarihi(Date stajBaslamaTarihi) {
        this.stajBaslamaTarihi = stajBaslamaTarihi;
    }

    public Date getStajBitirmeTarihi() {
        return stajBitirmeTarihi;
    }

    public void setStajBitirmeTarihi(Date stajBitirmeTarihi) {
        this.stajBitirmeTarihi = stajBitirmeTarihi;
    }

    public String getStajsirketi() {
        return stajsirketi;
    }

    public void setStajsirketi(String stajsirketi) {
        this.stajsirketi = stajsirketi;
    }

    public String getCalistigisirket() {
        return calistigisirket;
    }

    public void setCalistigisirket(String calistigisirket) {
        this.calistigisirket = calistigisirket;
    }
}
