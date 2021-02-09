package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.Mezuniyet;
import com.mezunkayitbilgisistemi.model.Ogrenci;

import java.util.List;

public interface MezuniyetService {
    public List<Mezuniyet> getAllMezuniyet();
    public Mezuniyet getMezuniyetId(int id);
    public void addMezuniyet(Mezuniyet mezuniyet);
    public void deleteMezuniyet(int id);
}
