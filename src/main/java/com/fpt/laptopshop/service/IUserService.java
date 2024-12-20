package com.fpt.laptopshop.service;

import java.util.List;

import com.fpt.laptopshop.domain.User;

public interface IUserService {

    User addUser(User user);

    List<User> findAll();

    User findById(long userId);

    void deleteById(long userId);

    User updateById(User user);
}
