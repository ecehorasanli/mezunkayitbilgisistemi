package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.OgretimUyeleri;
import com.mezunkayitbilgisistemi.repository.OgretimUyeleriRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional

public class OgretimUyeleriServiceImplementation implements OgretimUyeleriService{

    @Autowired
    OgretimUyeleriRepository ogretimUyeleriRepository;

    @Override
    public List<OgretimUyeleri> getAllOgretimUyeleri(){
        return (List<OgretimUyeleri>) ogretimUyeleriRepository.findAll();
    }

    @Override
    public OgretimUyeleri getOgretimUyeleriId(int id){
        return ogretimUyeleriRepository.findById(id).get();
    }

    @Override
    public void addOgretimUyeleri(OgretimUyeleri ogretimUyeleri){
        ogretimUyeleriRepository.save(ogretimUyeleri);
    }

    @Override
    public void deleteOgretimUyeleri(int id){
        ogretimUyeleriRepository.deleteById(id);
    }
}
