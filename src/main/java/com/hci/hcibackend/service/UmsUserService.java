package com.hci.hcibackend.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hci.hcibackend.model.dto.LoginDTO;
import com.hci.hcibackend.model.dto.RegisterDTO;
import com.hci.hcibackend.model.entity.BmsPost;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.model.vo.ProfileVO;

import java.util.Set;


public interface UmsUserService extends IService<UmsUser> {

    /**
     *
     * @param dto 接受表单中的数据
     * @return 注册结果
     */
    String register(RegisterDTO dto);

    /**
     *
     * @param dto 接受表单中的数据
     * @return 登录结果
     */
    String login(LoginDTO dto);

    UmsUser getUserByUsername(String username);

    ProfileVO getUserProfile(String id);

    Page<BmsPost> selectTopicsByUserId(Page<BmsPost> topicPage, String id);
}
