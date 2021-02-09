package com.mezunkayitbilgisistemi.controller;

import com.mezunkayitbilgisistemi.model.User;
import com.mezunkayitbilgisistemi.services.UserService;
import com.mezunkayitbilgisistemi.model.Ogrenci;
import com.mezunkayitbilgisistemi.services.OgrenciService;
import com.mezunkayitbilgisistemi.model.OgretimUyeleri;
import com.mezunkayitbilgisistemi.services.OgretimUyeleriService;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping(value = "/user")

public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(){

        ModelAndView model = new ModelAndView("user_list");
        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList);
        return model;
    }

    @RequestMapping(value = "/addUser/", method = RequestMethod.GET)
    public  ModelAndView addUser(){

        ModelAndView model= new ModelAndView();
        User user= new User();
        model.addObject("userForm", user);

        List<User> userList= userService.getAllUsers();
        model.addObject("userList", userList);
        model.setViewName("user_form");

        return model;
    }

    @RequestMapping(value ="/editUser/{id", method = RequestMethod.GET)
    public ModelAndView editUser(@PathVariable int id){
        ModelAndView model = new ModelAndView();

        User user = userService.getUserById(id);
        model.addObject("userForm", user);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList);
        model.setViewName("user_form");

        return model;
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("userForm") User user, RedirectAttributes redirectAttributes) {

        userService.addUser(user);
        redirectAttributes.addFlashAttribute("mesaj", "Kulllanıcı kaydedildi");
        return new ModelAndView("redirect:/user/list");

    }

    @RequestMapping(value = "/addUser2", method = RequestMethod.POST)
    public void add2(@RequestBody User user){

        userService.addUser(user);
    }

    @RequestMapping(value = "/deleteUser/{id", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id){

        try {
            userService.deleteUser(id);
            return new ModelAndView("redirect:/user/list");
        }catch (Exception e){
            return new ModelAndView("redirect:/user/list");
        }
    }
}
