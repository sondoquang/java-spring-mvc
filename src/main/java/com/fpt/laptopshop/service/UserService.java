package com.fpt.laptopshop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.fpt.laptopshop.domain.Role;
import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.domain.dto.UserDto;
import com.fpt.laptopshop.repository.RoleRepository;
import com.fpt.laptopshop.repository.UserRepository;
import com.fpt.laptopshop.service.iservice.IUserService;

@Service
public class UserService implements IUserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
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
    public Page<User> findAll(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @Override
    public User findById(long userId) {
        User user = userRepository.findById(userId).get();
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
            Role role = roleRepository.findByName(user.getRole().getName());
            user.setRole(role);
            return userRepository.save(user);
        } else {
            throw new RuntimeException("User not found!");
        }
    }

    @Override
    public User UserDtoToUser(UserDto userDto) {
        User user = new User();
        user.setFullName(userDto.getFirstName() + " " + userDto.getLastName());
        user.setEmail(userDto.getEmail());
        user.setPassword(userDto.getPassword());
        return user;
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public Integer getCountUser() {
        return Integer.parseInt(userRepository.count() + "");
    }
}
