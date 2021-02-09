package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.OgretimUyeleri;

import java.util.List;

public interface OgretimUyeleriService {

    public List<OgretimUyeleri> getAllOgretimUyeleri();
    public OgretimUyeleri getOgretimUyeleriId(int id);
    public void addOgretimUyeleri(OgretimUyeleri ogretimUyeleri);
    public void deleteOgretimUyeleri(int id);

}
