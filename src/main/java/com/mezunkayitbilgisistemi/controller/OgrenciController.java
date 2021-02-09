package com.mezunkayitbilgisistemi.controller;

import com.mezunkayitbilgisistemi.model.Ogrenci;
import com.mezunkayitbilgisistemi.model.OgretimUyeleri;
import com.mezunkayitbilgisistemi.model.User;
import com.mezunkayitbilgisistemi.services.OgrenciService;
import com.mezunkayitbilgisistemi.services.OgretimUyeleriService;
import com.mezunkayitbilgisistemi.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.List;

@Controller
@RequestMapping(value ="/ogrenci" )
public class OgrenciController {

    //public int control=0;

    @Autowired
    OgrenciService ogrenciService;

    @Autowired
    OgretimUyeleriService ogretimUyeleriService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(){
        ModelAndView model = new ModelAndView("ogrenci_list");
        List<Ogrenci> ogrenciList = ogrenciService.getAllOgrenciler();
        model.addObject("ogrenciList", ogrenciList);
        return model;
    }

    @RequestMapping(value = "/addOgrenci/", method = RequestMethod.GET)
    public ModelAndView addOgrenci(){

        ModelAndView model = new ModelAndView();
        Ogrenci ogrenci = new Ogrenci();
        model.addObject("ogrenciForm", ogrenci);

        List<OgretimUyeleri> ogretimUyeleriList = ogretimUyeleriService.getAllOgretimUyeleri();
        model.addObject("ogretimUyeleriList", ogretimUyeleriList);

        List<Ogrenci> ogrenciList= ogrenciService.getAllOgrenciler();
        model.addObject("ogrenciList", ogrenciList);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList);

        model.setViewName("ogrenci_form");
        return model;
    }

    @RequestMapping(value = "/editOgrenci/{id}", method = RequestMethod.GET)
    public ModelAndView editOgrenci(@PathVariable int id){
        ModelAndView model= new ModelAndView();

        Ogrenci ogrenci= ogrenciService.getOgrenciById(id);
        model.addObject("ogrenciForm", ogrenci);

        List<OgretimUyeleri> ogretimUyeleriList= ogretimUyeleriService.getAllOgretimUyeleri();
        model.addObject("ogretimUyeleriList", ogretimUyeleriList);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList);

        List<Ogrenci> ogrenciList= ogrenciService.getAllOgrenciler();
        model.addObject("ogrenciList", ogrenciList);

        model.setViewName("ogrenci_form");
        return model;
    }

    @RequestMapping(value = "/addOgrenci", method = RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("ogrenciForm") Ogrenci ogrenci, RedirectAttributes redirectAttributes){

        System.out.println(ogrenci.getAd() + ogrenci.getSoyad());

        ogrenciService.addOgrenci(ogrenci);
        redirectAttributes.addFlashAttribute("mesaj", "Öğrenci Kaydedildi");
        return new ModelAndView("redirect:/ogrenci/list");

    }

    @RequestMapping(value = "/deleteOgrenci/{id}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id){

        try {
            ogrenciService.deleteOgrenci(id);
            return new ModelAndView("redirect:/ogrenci/list");
        }catch (Exception e){

            return new ModelAndView("redirect:/ogrenci/list");

        }
    }

}
