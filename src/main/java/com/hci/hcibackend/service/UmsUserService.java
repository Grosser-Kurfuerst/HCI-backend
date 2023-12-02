package com.hci.hcibackend.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.hci.hcibackend.model.dto.RegisterDTO;
import com.hci.hcibackend.model.entity.UmsUser;


public interface UmsUserService extends IService<UmsUser> {

    /**
     *
     * @param dto 接受表单中的数据
     * @return 注册结果
     */
    String register(RegisterDTO dto);
}
