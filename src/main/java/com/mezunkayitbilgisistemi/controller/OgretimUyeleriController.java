package com.mezunkayitbilgisistemi.controller;

import com.mezunkayitbilgisistemi.model.OgretimUyeleri;
import com.mezunkayitbilgisistemi.model.User;
import com.mezunkayitbilgisistemi.services.OgretimUyeleriService;
import com.mezunkayitbilgisistemi.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping(value = "/ogretimuyeleri")

public class OgretimUyeleriController {

    @Autowired
    OgretimUyeleriService ogretimUyeleriService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(){

        ModelAndView model =new ModelAndView("ogretimUyeleri_list");
        List<OgretimUyeleri> ogretimUyeleriList = ogretimUyeleriService.getAllOgretimUyeleri();

        return model;
    }

    @RequestMapping(value = "/addOgretimUyeleri/", method = RequestMethod.GET)
    public ModelAndView addOgretimUyeleri(){

        ModelAndView model = new ModelAndView();
        OgretimUyeleri ogretimUyeleri = new OgretimUyeleri();
        model.addObject("ogretimUyeleriForm", ogretimUyeleri);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList);

        List<OgretimUyeleri> ogretimUyeleriList = ogretimUyeleriService.getAllOgretimUyeleri();
        model.addObject("ogretimUyeleriList", ogretimUyeleriList);

        model.setViewName("ogretimUyeleri_form");
        return model;
    }

    @RequestMapping(value="/editOgretimUyeleri/{id}", method=RequestMethod.GET)
    public ModelAndView editDanisman(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        OgretimUyeleri ogretimUyeleri = ogretimUyeleriService.getOgretimUyeleriId(id);
        model.addObject("ogretimUyeleriForm", ogretimUyeleri);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList );

        List<OgretimUyeleri> ogretimUyeleriList = ogretimUyeleriService.getAllOgretimUyeleri();
        model.addObject("ogretimUyeleriList", ogretimUyeleriList );

        model.setViewName("ogretimUyeleri_form");
        return model;
    }

    @RequestMapping(value="/addOgretimUyeleri2", method=RequestMethod.POST)
    public void add2(@RequestBody OgretimUyeleri ogretimUyeleri) {

        ogretimUyeleriService.addOgretimUyeleri(ogretimUyeleri);

    }

    @RequestMapping(value="/addOgretimUyeleri", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("ogretimUyeleriForm") OgretimUyeleri ogretimUyeleri, RedirectAttributes redirectAttributes) {

        ogretimUyeleriService.addOgretimUyeleri(ogretimUyeleri);
        redirectAttributes.addFlashAttribute("mesaj", "Öğretim Üyesi Kaydedildi");
        return new ModelAndView("redirect:/ogretimUyeleri/list");

    }

    @RequestMapping(value="/deleteOgretimUyeleri/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id){

        try {
            ogretimUyeleriService.deleteOgretimUyeleri(id);
            return new ModelAndView("redirect:/ogretimUyeleri/list");
        }catch (Exception e){
            return new ModelAndView("redirect:/ogretimUyeleri/list");
        }
    }
}
