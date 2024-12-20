package com.fpt.laptopshop.controller;

import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.repository.UserRepository;
import com.fpt.laptopshop.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/admin/user")
    public String getMethodName(Model model) {
        model.addAttribute("newUser", new User());
        return "/admin/user/UserPage";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String getHomePage(Model model, @ModelAttribute("newUser") User user) {
        User saveUser = userService.addUser(user);
        System.out.println(saveUser);
        model.addAttribute("message", "Create user success");
        return "/admin/user/UserPage";
    }

}
