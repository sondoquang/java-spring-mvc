package com.fpt.laptopshop.service.iservice;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.domain.dto.UserDto;

public interface IUserService {

    User addUser(User user);

    Page<User> findAll(Pageable pageable);

    User findById(long userId);

    void deleteById(long userId);

    User updateById(User user);

    User findByEmail(String email);

    User UserDtoToUser(UserDto userDto);

    Integer getCountUser();
}
