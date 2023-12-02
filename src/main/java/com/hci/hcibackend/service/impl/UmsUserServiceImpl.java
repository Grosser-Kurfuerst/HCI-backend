package com.hci.hcibackend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hci.hcibackend.common.exception.ApiAsserts;
import com.hci.hcibackend.mapper.UmsUserMapper;
import com.hci.hcibackend.model.dto.RegisterDTO;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.service.UmsUserService;
import com.hci.hcibackend.utils.MD5Utils;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UmsUserServiceImpl extends ServiceImpl<UmsUserMapper, UmsUser>
            implements UmsUserService {
    @Override
    public String register(RegisterDTO dto) {
        LambdaQueryWrapper<UmsUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(UmsUser::getUsername, dto.getName()).or().eq(UmsUser::getEmail, dto.getEmail());
        boolean res = baseMapper.selectList(wrapper).isEmpty();
        if (!res) {
            try {
                ApiAsserts.fail("账号或邮箱已存在！");
            }
            catch (Exception e) {
                System.out.println("账号或邮箱已存在！");
            }
            return "账号或邮箱已存在！";
        } else {
            UmsUser addUser = UmsUser.builder()
                    .username(dto.getName())
                    .alias(dto.getName())
                    .password(MD5Utils.getPwd(dto.getPass()))
                    .email(dto.getEmail())
                    .createTime(new Date())
                    .status(true)
                    .build();
            baseMapper.insert(addUser);
        }
        return "OK";
    }
}
