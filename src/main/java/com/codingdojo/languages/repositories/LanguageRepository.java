package com.codingdojo.languages.repositories;

import com.codingdojo.languages.models.Language;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LanguageRepository extends CrudRepository<Language, Long> {
 List<Language> findAll();
}
