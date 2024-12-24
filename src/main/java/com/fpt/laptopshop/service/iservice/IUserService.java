package com.fpt.laptopshop.service.iservice;

import java.util.List;

import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.domain.dto.UserDto;

public interface IUserService {

    User addUser(User user);

    List<User> findAll();

    User findById(long userId);

    void deleteById(long userId);

    User updateById(User user);

    User findByEmail(String email);

    User UserDtoToUser(UserDto userDto);
}
