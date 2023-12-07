package com.hci.hcibackend.controller;

import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.dto.LoginDTO;
import com.hci.hcibackend.model.dto.RegisterDTO;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.service.UmsUserService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import static com.hci.hcibackend.utils.jwt.JwtUtil.USER_NAME;

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

    @PostMapping("/login")
    public ApiResult<String> login(@Valid @RequestBody LoginDTO dto) {
        String result = umsUserService.login(dto);
        if (ObjectUtils.isEmpty(result)) {
            return ApiResult.failed("账号密码错误");
        }
        return ApiResult.success(result);
    }

    @GetMapping("/info")
    public ApiResult<UmsUser> getUser(@RequestHeader(value = USER_NAME) String userName) {
        UmsUser user = umsUserService.getUserByUsername(userName);
        return ApiResult.success(user);
    }

    @GetMapping(value = "/logout")
    public ApiResult<Object> logOut() {
        return ApiResult.success(null, "注销成功");
    }
}
