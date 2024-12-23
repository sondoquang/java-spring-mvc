package com.fpt.laptopshop.service.iservice;

import com.fpt.laptopshop.domain.Role;

public interface IRoleService {
    Role findByName(String name);
}
