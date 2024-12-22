package com.fpt.laptopshop.service;

import org.springframework.stereotype.Service;

import com.fpt.laptopshop.domain.Role;
import com.fpt.laptopshop.repository.RoleRepository;

@Service
public class RoleService implements IRoleService {

    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Override
    public Role findByName(String name) {
        Role role = roleRepository.findByName(name);
        if (role != null) {
            return role;
        }
        throw new RuntimeException("Role not found !");
    }

}
