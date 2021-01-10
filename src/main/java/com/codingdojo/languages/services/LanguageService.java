package com.codingdojo.languages.services;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.repositories.LanguageRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class LanguageService {
    private final LanguageRepository repo;

    public LanguageService(LanguageRepository repo){
        this.repo=repo;
    }
    public List<Language> allLanguauges(){
        return repo.findAll();
    }
    public Language findlanguage(Long id){
       Optional<Language> lang=repo.findById(id);
       if (lang.isPresent()){
           return lang.get();
       }
       return null;
    }
    public Language createLanguage(Language lang)
    {
        return repo.save(lang);
    }
    public void deleteLanguage(Long id){
        Optional<Language> optionalang = repo.findById(id);
        if(optionalang.isPresent()) {
           repo.deleteById(id);
        }


    }
    public Language updateLanguage(Language lang) {
        Optional<Language> optionalLang = repo.findById(lang.getId());
        if(optionalLang.isPresent()) {
            Language language= optionalLang.get();
            language.setName(lang.getName());
            language.setCreator(lang.getCreator());
            language.setCurrentVersion(lang.getCurrentVersion());
            repo.save(language);
            return language;
        } else {
            return null;
        }

    }

}
