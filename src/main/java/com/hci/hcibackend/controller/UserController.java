package com.hci.hcibackend.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.mapper.BmsCollectMapper;
import com.hci.hcibackend.model.dto.LoginDTO;
import com.hci.hcibackend.model.dto.RegisterDTO;
import com.hci.hcibackend.model.entity.*;
import com.hci.hcibackend.service.BmsPostService;
import com.hci.hcibackend.service.UmsUserService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import static com.hci.hcibackend.utils.jwt.JwtUtil.USER_NAME;

@RestController
@RequestMapping("/ums/user")
@Slf4j
public class UserController extends BaseController {

    @Resource
    private UmsUserService umsUserService;

    @Autowired
    private BmsCollectMapper bmsCollectMapper;

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

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ApiResult<Map<String, String>> login(@Valid @RequestBody LoginDTO dto) {
        String token = umsUserService.login(dto);
        if (ObjectUtils.isEmpty(token)) {
            return ApiResult.failed("账号密码错误");
        }
        Map<String, String> map = new HashMap<>(16);
        map.put("token", token);
        return ApiResult.success(map, "登录成功");
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

    @PostMapping("/update")
    public ApiResult<UmsUser> updateUser(@RequestBody UmsUser umsUser) {
        umsUserService.updateById(umsUser);
        return ApiResult.success(umsUser);
    }

    //获得文章
    @GetMapping("/topic")
    public ApiResult<Map<String, Object>> getTopicsByUser(
            @RequestParam(value = "name") String userName,
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "size", defaultValue = "10") Integer size) {

        Map<String, Object> map = new HashMap<>(16);
        UmsUser user = umsUserService.getUserByUsername(userName);
        Assert.notNull(user, "用户不存在");

        Page<BmsPost> topics = umsUserService.selectTopicsByUserId(new Page<>(page, size), user.getId());

        map.put("topics", topics);

        return ApiResult.success(map);
    }

    //获得文章id
    @GetMapping("/topicsId")
    public ApiResult<Map<String, Object>> getTopicsByUser(
            @RequestParam(value = "name") String userName) {

        Map<String, Object> map = new HashMap<>(16);
        UmsUser user = umsUserService.getUserByUsername(userName);
        Assert.notNull(user, "用户不存在");
        Set<String>  topicsId = bmsCollectMapper.getTopicIdsByUserId(user.getId());

        map.put("topicsId", topicsId);

        return ApiResult.success(map);
    }

    @PostMapping("/topic")
    public ApiResult<Map<String, Object>> createCollect(
            @RequestParam(value = "user_id") String user_id,
            @RequestParam(value = "topic_id") String topic_id) {

        // 检查是否已经存在相同的记录
        LambdaQueryWrapper<BmsCollect> queryWrapper = new LambdaQueryWrapper<BmsCollect>()
                .eq(BmsCollect::getUserId, user_id)
                .eq(BmsCollect::getTopicId, topic_id);

        int count = Math.toIntExact(bmsCollectMapper.selectCount(queryWrapper));

        if (count > 0) {
            // 已经存在相同的记录，返回错误信息
            return ApiResult.failed("记录已存在，不可重复添加");
        }

        BmsCollect collect = new BmsCollect();
        collect.setUserId(user_id);
        collect.setTopicId(topic_id);
        this.bmsCollectMapper.insert(collect);

        return ApiResult.success();
    }

    @DeleteMapping("/topic")
    public ApiResult<Map<String, Object>> deleteCollect(
            @RequestParam(value = "user_id") String user_id,
            @RequestParam(value = "topic_id") String topic_id) {
        LambdaQueryWrapper<BmsCollect> wrapper = new LambdaQueryWrapper<BmsCollect>()
                .eq(BmsCollect::getUserId, user_id)
                .eq(BmsCollect::getTopicId, topic_id);

        // 执行删除操作
        int deletedRows = bmsCollectMapper.delete(wrapper);

        // 检查是否删除成功
        if (deletedRows > 0) {
            return ApiResult.success();
        } else {
            return ApiResult.failed("删除失败，记录不存在");
        }
    }


}
