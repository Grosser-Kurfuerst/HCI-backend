package com.hci.hcibackend.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.entity.BmsBillboard;
import com.hci.hcibackend.service.BmsBillboardService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/billboard")
public class BillboardController extends BaseController{

    @Resource
    private BmsBillboardService bmsBillboardService;

    @GetMapping("/show")
    public ApiResult<BmsBillboard> getNotices(){
        List<BmsBillboard> list = bmsBillboardService.list(new
                LambdaQueryWrapper<BmsBillboard>().eq(BmsBillboard::isShow,true));
        return ApiResult.success(list.get(list.size()- 1));
    }
}
