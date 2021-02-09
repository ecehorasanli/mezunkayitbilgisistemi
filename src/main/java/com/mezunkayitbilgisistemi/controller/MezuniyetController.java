package com.mezunkayitbilgisistemi.controller;

import com.mezunkayitbilgisistemi.model.Kariyer;
import com.mezunkayitbilgisistemi.model.Mezuniyet;
import com.mezunkayitbilgisistemi.model.Ogrenci;
import com.mezunkayitbilgisistemi.services.KariyerService;
import com.mezunkayitbilgisistemi.services.MezuniyetService;
import com.mezunkayitbilgisistemi.services.OgrenciService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/mezuniyet")

public class MezuniyetController {

    @Autowired
    MezuniyetService mezuniyetService;

    @Autowired
    OgrenciService ogrenciService;

    @Autowired
    KariyerService kariyerService;

    @RequestMapping(value="/list", method= RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView model = new ModelAndView("mezuniyet_list");
        List<Mezuniyet> mezuniyetList = mezuniyetService.getAllMezuniyet();
        model.addObject("mezuniyetList", mezuniyetList);
        return model;
    }

    @RequestMapping(value="/addMezuniyet/", method=RequestMethod.GET)
    public ModelAndView addMezuniyet() {

        ModelAndView model = new ModelAndView();
        Mezuniyet mezuniyet= new Mezuniyet();
        model.addObject("mezuniyetForm", mezuniyet);

        List<Ogrenci> ogrenciList = ogrenciService.getAllOgrenciler();
        model.addObject("ogrenciList", ogrenciList );

        List<Kariyer> kariyerList = kariyerService.getAllKariyer();
        model.addObject("kariyerList", kariyerList );

        model.setViewName("mezuniyet_form");

        return model;
    }

    @RequestMapping(value="/editMezuniyet/{id}", method=RequestMethod.GET)
    public ModelAndView editMezuniyet(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Mezuniyet mezuniyet = mezuniyetService.getMezuniyetId(id);
        model.addObject("mezuniyetForm", mezuniyet);

        List<Ogrenci> ogrenciList = ogrenciService.getAllOgrenciler();
        model.addObject("ogrenciList", ogrenciList );

        List<Kariyer> kariyerList = kariyerService.getAllKariyer();
        model.addObject("kariyerList", kariyerList );

        model.setViewName("mezuniyet_form2");

        return model;
    }

    @RequestMapping(value="/addMezuniyet", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("mezuniyetForm") Mezuniyet mezuniyet) {

        mezuniyetService.addMezuniyet(mezuniyet);
        return new ModelAndView("redirect:/mezuniyet/list");

    }

    @RequestMapping(value = "/deleteMezuniyet/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        try {
            mezuniyetService.deleteMezuniyet(id);
            return new ModelAndView("redirect:/mezuniyet/list");
        }catch (Exception e){
            return new ModelAndView("redirect:/mezuniyet/list");
        }
    }
}
