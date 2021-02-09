package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.Ogrenci;

import java.util.List;

public interface OgrenciService {

    public List<Ogrenci> getAllOgrenciler();
    public Ogrenci getOgrenciById(int id);
    public void addOgrenci(Ogrenci ogrenci);
    public void deleteOgrenci(int ogrenci);
}
