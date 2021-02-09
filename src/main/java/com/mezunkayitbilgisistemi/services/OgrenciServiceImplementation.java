package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.Ogrenci;
import com.mezunkayitbilgisistemi.repository.OgrenciRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
@Transactional

class OgrenciServiceImplementation implements OgrenciService {

    @Autowired
    OgrenciRepository ogrenciRepository;

    @Override
    public List<Ogrenci> getAllOgrenciler(){
        return (List<Ogrenci>) ogrenciRepository.findAll();
    }

    @Override
    public Ogrenci getOgrenciById(int id){
        return ogrenciRepository.findById(id).get();
    }

    @Override
    public void addOgrenci (Ogrenci ogrenci){
        ogrenciRepository.save(ogrenci);
    }

    @Override
    public void deleteOgrenci(int id){
        ogrenciRepository.deleteById(id);
    }

}
