package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.User;
import com.mezunkayitbilgisistemi.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional

public class UserServiceImplementation implements  UserService{

    @Autowired
    UserRepository userRepository;

    @Override
    public List<User> getAllUsers(){
        return (List<User>) userRepository.findAll();
    }

    @Override
    public User getUserById(int id){
        return userRepository.findById(id).get();
    }

    @Override
    public void addUser(User user){
        userRepository.save(user);
    }

    @Override
    public void deleteUser(int id){
        userRepository.deleteById(id);
    }
}
