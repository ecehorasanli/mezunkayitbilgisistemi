package com.mezunkayitbilgisistemi.controller;


import com.mezunkayitbilgisistemi.model.Kariyer;
import com.mezunkayitbilgisistemi.services.KariyerService;
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
@RequestMapping(value = "/kariyer")

public class KariyerController {

    @Autowired
    KariyerService kariyerService;

    @RequestMapping(value="/list", method= RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView model = new ModelAndView("kariyer_list");
        List<Kariyer> kariyerList = kariyerService.getAllKariyer();
        model.addObject("kariyerList", kariyerList );

        return model;
    }

    @RequestMapping(value="/addKariyer/", method=RequestMethod.GET)
    public ModelAndView addKariyer() {

        ModelAndView model = new ModelAndView();
        Kariyer kariyer = new Kariyer();
        model.addObject("kariyerForm", kariyer);

        List<Kariyer> kariyerList = kariyerService.getAllKariyer();
        model.addObject("kariyerList", kariyerList );

        model.setViewName("kariyer_form");
        return model;
    }

    @RequestMapping(value="/editKariyer/{id}", method=RequestMethod.GET)
    public ModelAndView editKariyer(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Kariyer kariyer = kariyerService.getKariyer(id);
        model.addObject("kariyerForm", kariyer);

        List<Kariyer> kariyerList = kariyerService.getAllKariyer();
        model.addObject("kariyerList", kariyerList);

        model.setViewName("kariyer_form");
        return model;
    }

    @RequestMapping(value="/addKariyer", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("kariyerForm") Kariyer kariyer, RedirectAttributes redirectAttributes) {

        kariyerService.addKariyer(kariyer);
        redirectAttributes.addFlashAttribute("mesaj", "Kariyer Oluşturuldu");
        return new ModelAndView("redirect:/kariyer/list");

    }

    @RequestMapping(value="/deleteStajbirim/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        try {
            kariyerService.deleteKariyer(id);
            return new ModelAndView("redirect:/kariyer/list");
        }catch (Exception e){
            return new ModelAndView("redirect:/kariyer/list");
        }
    }

}
