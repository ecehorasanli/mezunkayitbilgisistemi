package com.mezunkayitbilgisistemi.services;

import com.mezunkayitbilgisistemi.model.User;

import java.util.List;

public interface UserService {

    public List<User> getAllUsers();
    public User getUserById(int id);
    public void addUser(User user);
    public void deleteUser(int id);

}
