package com.hci.hcibackend.controller;


import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.entity.BmsTip;
import com.hci.hcibackend.service.BmsTipService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/tip")
public class TipController extends BaseController {
    @Resource
    private BmsTipService bmsTipService;

    @GetMapping("/random")
    public ApiResult<BmsTip> getRandomTip() {
        BmsTip tip = bmsTipService.getRandomTip();
        return ApiResult.success(tip);
    }
}
