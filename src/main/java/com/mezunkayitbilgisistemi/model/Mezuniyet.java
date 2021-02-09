package com.mezunkayitbilgisistemi.model;


import javax.persistence.*;
import java.sql.Date;

@Entity


public class Mezuniyet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

  //  @OneToMany
    //private int ogrenciId;

    @Column( nullable = false )
    private java.sql.Date okulaBaslamaTarihi;

    @Column( nullable = false )
    private java.sql.Date mezuniyetTarihi;

    @Column( nullable = false, length = 5)
    private Double diplomaPuan;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

  /*  public int getOgrenciId() {
        return ogrenciId;
    }

    public void setOgrenciId(int ogrenciId) {
        this.ogrenciId = ogrenciId;
    }
*/
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

    public Double getDiplomaPuan() {
        return diplomaPuan;
    }

    public void setDiplomaPuan(Double diplomaPuan) {
        this.diplomaPuan = diplomaPuan;
    }
}
