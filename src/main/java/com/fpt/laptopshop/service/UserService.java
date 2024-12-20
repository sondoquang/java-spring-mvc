package com.fpt.laptopshop.service;

import java.util.List;

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

    @Override
    public List<User> findAll() {
        List<User> users = userRepository.findAll();
        if (users.isEmpty()) {
            throw new RuntimeException("Find user don't successful!");
        }
        return users;
    }

    @Override
    public User findById(long userId) {
        User user = userRepository.findById(userId);
        if (user == null) {
            throw new RuntimeException("User not found!");
        }
        return user;
    }

    @Override
    public void deleteById(long userId) {
        User user = findById(userId);
        if (user != null) {
            userRepository.delete(user);
        } else {
            throw new RuntimeException("User not found!");
        }
    }

    @Override
    public User updateById(User user) {
        User updateUser = findById(user.getId());
        if (updateUser != null) {
            return userRepository.save(user);
        } else {
            throw new RuntimeException("User not found!");
        }
    }
}
