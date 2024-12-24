package com.fpt.laptopshop.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.domain.dto.UserDto;
import com.fpt.laptopshop.service.iservice.IRoleService;
import com.fpt.laptopshop.service.iservice.IUserService;

import jakarta.validation.Valid;

@Controller
public class AccountController {

    private final IUserService userService;
    private final IRoleService roleService;

    public AccountController(IUserService userService, IRoleService roleService, PasswordEncoder passwordEncoder) {
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
    public String postRegister(@ModelAttribute("userDto") @Valid UserDto userDto,
            BindingResult result) {
        if (result.hasErrors()) {
            return "client/auth/Register";
        }
        User user = userService.UserDtoToUser(userDto);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(roleService.findByName("USER"));
        userService.addUser(user);
        return "redirect:account/login";
    }

    @GetMapping("/account/login")
    public String getLogin() {
        return "client/auth/Login";
    }

    @PostMapping("/account/login")
    public String postLogin() {
        return "redirect:home";
    }

}
