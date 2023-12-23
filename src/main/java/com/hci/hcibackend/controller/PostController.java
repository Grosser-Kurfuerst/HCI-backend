package com.hci.hcibackend.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.dto.CreateTopicDTO;
import com.hci.hcibackend.model.entity.BmsPost;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.model.vo.PostVO;
import com.hci.hcibackend.service.BmsPostService;
import com.hci.hcibackend.service.UmsUserService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import static com.hci.hcibackend.utils.jwt.JwtUtil.USER_NAME;


@RestController
@RequestMapping("/post")

public class PostController extends BaseController {
    @Resource
    private BmsPostService bmsPostService;
    @Resource
    private UmsUserService umsUserService;
    @GetMapping("/list")
    public ApiResult<Page<PostVO>> list(@RequestParam(value = "tab", defaultValue = "latest") String tab,
                                        @RequestParam(value = "pageNo", defaultValue = "1")  Integer pageNo,
                                        @RequestParam(value = "size", defaultValue = "10") Integer pageSize) {
        Page<PostVO> list = bmsPostService.getList(new Page<>(pageNo, pageSize), tab);
        return ApiResult.success(list);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ApiResult<BmsPost> create(@RequestHeader(value = USER_NAME) String userName
            , @RequestBody CreateTopicDTO dto) {
        UmsUser user = umsUserService.getUserByUsername(userName);
        BmsPost topic = bmsPostService.create(dto, user);
        return ApiResult.success(topic);
    }


}
