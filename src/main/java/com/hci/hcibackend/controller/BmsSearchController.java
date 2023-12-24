package com.hci.hcibackend.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.vo.PostVO;
import com.hci.hcibackend.service.BmsPostService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/search")
public class BmsSearchController extends BaseController {

    @Resource
    private BmsPostService postService;

    @GetMapping
    public ApiResult<Page<PostVO>> searchList(@RequestParam("keyword") String keyword,
                                              @RequestParam("pageNum") Integer pageNum,
                                              @RequestParam("pageSize") Integer pageSize) {
        Page<PostVO> results = postService.searchByKey(keyword, new Page<>(pageNum, pageSize));
        return ApiResult.success(results);
    }

}