package com.mezunkayitbilgisistemi.repository;

import com.mezunkayitbilgisistemi.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {
}
