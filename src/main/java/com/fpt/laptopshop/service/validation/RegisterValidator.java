package com.fpt.laptopshop.service.validation;

import org.springframework.stereotype.Service;

import com.fpt.laptopshop.domain.dto.UserDto;
import com.fpt.laptopshop.service.iservice.IUserService;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, UserDto> {
    private final IUserService userService;

    public RegisterValidator(IUserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(UserDto user, ConstraintValidatorContext context) {
        boolean valid = true;

        // Check if password fields match
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Passwords do not match !")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // Check email //
        if (userService.findByEmail(user.getEmail()) != null) {
            context.buildConstraintViolationWithTemplate("Email already exists !")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // Additional validations can be added here

        return valid;
    }
}
