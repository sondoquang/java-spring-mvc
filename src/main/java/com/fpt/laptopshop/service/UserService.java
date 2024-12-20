package com.fpt.laptopshop.service;

import org.springframework.stereotype.Service;

import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.repository.UserRepository;

@Service
public class UserService implements IUserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User addUser(User user) {
        User saveUser = userRepository.save(user);
        if (saveUser == null) {
            throw new RuntimeException("Add user failed!");
        }
        return saveUser;
    }
}
