package com.fpt.laptopshop.controller;

import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.service.IUserService;
import com.fpt.laptopshop.service.UserService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final IUserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/users")
    public String getUsers(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "/admin/user/TableUser";
    }

    @GetMapping(value = "/admin/users/{userId}/view")
    public String getUserDetailById(Model model, @PathVariable long userId) {
        User user = userService.findById(userId);
        model.addAttribute("user", user);
        return "/admin/user/UserDetail";
    }

    @GetMapping(value = "/admin/users/create")
    public String handleForwardCreate(Model model, @ModelAttribute("newUser") User user) {
        model.addAttribute("newUser", new User());
        return "/admin/user/UserPage";
    }

    @PostMapping(value = "/admin/users/create")
    public String handleCreateUser(Model model, @ModelAttribute("newUser") User user) {
        User saveUser = userService.addUser(user);
        if (saveUser == null) {
            model.addAttribute("message", "Create user failed !");
            return "/admin/user/TableUser";
        }
        return "redirect:/admin/users";
    }

    @GetMapping(value = "/admin/users/{userId}/update")
    public String handleForwardUpdateUser(Model model, @PathVariable long userId) {
        User user = userService.findById(userId);
        model.addAttribute("newUser", user);
        return "/admin/user/UserUpdate";
    }

    @PostMapping(value = "/admin/users/update")
    public String handleUpdateUser(Model model, @ModelAttribute("newUser") User user) {
        User updateUser = userService.updateById(user);
        if (updateUser == null) {
            model.addAttribute("message", "Update user failed !");
        } else
            model.addAttribute("message", "Update user success");
        return "redirect:/admin/users";
    }

    @GetMapping(value = "/admin/users/{userId}/delete")
    public String forwardDeleteUser(Model model, @PathVariable long userId) {
        model.addAttribute("userId", userId);
        return "/admin/user/UserDelete";
    }

    @PostMapping(value = "/admin/users/{userId}/delete")
    public String deleteUser(Model model, @PathVariable long userId) {
        userService.deleteById(userId);
        model.addAttribute("message", "Delete success");
        return "redirect:/admin/users";
    }
}
