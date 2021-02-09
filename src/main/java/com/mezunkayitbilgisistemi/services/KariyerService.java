package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.Kariyer;

import java.util.List;

public interface KariyerService {

    public List<Kariyer> getAllKariyer();
    public Kariyer getKariyer (int id);
    public void addKariyer(Kariyer kariyer);
    public void deleteKariyer(int id);
}
