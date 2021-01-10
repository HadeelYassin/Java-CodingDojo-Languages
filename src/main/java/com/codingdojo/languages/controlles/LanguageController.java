package com.codingdojo.languages.controlles;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.services.LanguageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;
@Controller
public class LanguageController {
    private final LanguageService serv ;

     public LanguageController(LanguageService serv){
         this.serv=serv;
     }
     @RequestMapping("/languages")
     public String index(Model model,@ModelAttribute("language") Language language){
         List<Language> allLanguages=serv.allLanguauges();
         model.addAttribute("allLanguages",allLanguages);
         return "index.jsp";
     }
     @RequestMapping(value="/languages", method= RequestMethod.POST)
     public String create(@Valid @ModelAttribute("language") Language language, BindingResult result) {
         if (result.hasErrors()) {
             return "index.jsp";
         }
         else {
             serv.createLanguage(language);
             return "redirect:/languages";
         }
     }
    @RequestMapping(value="/languages/{id}" ,method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
        serv.deleteLanguage(id);
        return "redirect:/languages";
    }

    @RequestMapping(value="languages/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id , Model model){
      Language lang=  serv.findlanguage(id);
        model.addAttribute("language", lang);
        return "edit.jsp";

    }
    @RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            serv.updateLanguage(language);
            return "redirect:/languages";
        }
    }
    @RequestMapping(value="/languages/{id}")
    public String showLanguage(@PathVariable("id") Long id, Model model){
         Language language=serv.findlanguage(id);
         model.addAttribute("language",language);
         return "show.jsp";
    }

}
