package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.Kariyer;
import com.mezunkayitbilgisistemi.repository.KariyerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional

public class KariyerServiceImplementation implements KariyerService{

    @Autowired
    KariyerRepository kariyerRepository;

    @Override
    public List<Kariyer> getAllKariyer(){
        return (List<Kariyer>) kariyerRepository.findAll();
    }

    @Override
    public Kariyer getKariyer(int id) {
        return null;
    }


    public Kariyer getKariyerById(int id){   return kariyerRepository.findById(id).get();
    }

    @Override
    public void addKariyer(Kariyer kariyer){
        kariyerRepository.save(kariyer);
    }

    @Override
    public void deleteKariyer(int id){
        kariyerRepository.deleteById(id);
    }

}
