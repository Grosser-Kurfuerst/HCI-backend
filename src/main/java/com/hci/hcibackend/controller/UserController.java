package com.hci.hcibackend.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.dto.LoginDTO;
import com.hci.hcibackend.model.dto.RegisterDTO;
import com.hci.hcibackend.model.entity.BmsPost;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.service.BmsPostService;
import com.hci.hcibackend.service.UmsUserService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

import static com.hci.hcibackend.utils.jwt.JwtUtil.USER_NAME;

@RestController
@RequestMapping("/ums/user")
public class UserController extends BaseController {

    @Resource
    private UmsUserService umsUserService;

    @Resource
    private BmsPostService bmsPostService;
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


    @GetMapping("/{username}")
    public ApiResult<Map<String, Object>> getUserByName(@PathVariable("username") String username,
                                                        @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                                                        @RequestParam(value = "size", defaultValue = "10") Integer size) {
        Map<String, Object> map = new HashMap<>(16);
        UmsUser user = umsUserService.getUserByUsername(username);
        Assert.notNull(user, "用户不存在");
        Page<BmsPost> page = bmsPostService.page(new Page<>(pageNo, size),
                new LambdaQueryWrapper<BmsPost>().eq(BmsPost::getUserId, user.getId()));
        map.put("user", user);
        map.put("topics", page);
        return ApiResult.success(map);
    }
}
