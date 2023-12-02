package com.hci.hcibackend.controller;

import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.dto.RegisterDTO;
import com.hci.hcibackend.service.UmsUserService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ums/user")
public class UserController extends BaseController {

    @Resource
    private UmsUserService umsUserService;

    @PostMapping("/register")
    public ApiResult<String> register(@Valid @RequestBody RegisterDTO dto) {
        String result = umsUserService.register(dto);
        if (!result.equals("OK")) {
            return ApiResult.failed(result);
        }
        return ApiResult.success(result);
    }
}
