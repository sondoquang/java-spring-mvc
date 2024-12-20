package com.fpt.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpt.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}
