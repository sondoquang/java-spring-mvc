package com.fpt.laptopshop.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.domain.dto.UserDto;
import com.fpt.laptopshop.service.iservice.IRoleService;
import com.fpt.laptopshop.service.iservice.IUserService;

@Controller
public class RegisterController {

    private final IUserService userService;
    private final IRoleService roleService;

    public RegisterController(IUserService userService, IRoleService roleService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
    }

    private final PasswordEncoder passwordEncoder;

    @GetMapping("/account/register")
    public String getRegister(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "client/auth/Register";
    }

    @PostMapping("/account/register")
    public String postRegister(@ModelAttribute("userDto") UserDto userDto) {
        User user = userService.UserDtoToUser(userDto);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(roleService.findByName("USER"));
        userService.addUser(user);
        return "redirect:/account/login";
    }

    @GetMapping("/account/login")
    public String getLogin(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "client/auth/Login";
    }

    @PostMapping("/account/login")
    public String postLogin(@ModelAttribute("userDto") UserDto userDto) {
        User user = this.userService.UserDtoToUser(userDto);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(roleService.findByName("ROLE"));
        userService.addUser(user);
        return "redirect:/account/login";
    }

}
