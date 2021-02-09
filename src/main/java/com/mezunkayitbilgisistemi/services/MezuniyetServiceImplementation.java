package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.Mezuniyet;
import com.mezunkayitbilgisistemi.repository.MezuniyetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional

public class MezuniyetServiceImplementation implements MezuniyetService {

    @Autowired
    MezuniyetRepository mezuniyetRepository;

    @Override
    public List<Mezuniyet> getAllMezuniyet(){
        return (List<Mezuniyet>)  mezuniyetRepository.findAll();
    }

    @Override
    public Mezuniyet getMezuniyetId(int id) {
        return null;
    }

    public Mezuniyet getMezuniyetById (int id){
         return mezuniyetRepository.findById(id).get();
     }

    @Override
    public void addMezuniyet(Mezuniyet mezuniyet){
        mezuniyetRepository.save(mezuniyet);
    }

   @Override
    public void deleteMezuniyet(int id){
        mezuniyetRepository.deleteById(id);
    }

}
