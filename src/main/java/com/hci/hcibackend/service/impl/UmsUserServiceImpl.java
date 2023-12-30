package com.hci.hcibackend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hci.hcibackend.common.exception.ApiAsserts;
import com.hci.hcibackend.mapper.BmsCollectMapper;
import com.hci.hcibackend.mapper.BmsFollowMapper;
import com.hci.hcibackend.mapper.BmsTopicMapper;
import com.hci.hcibackend.mapper.UmsUserMapper;
import com.hci.hcibackend.model.dto.LoginDTO;
import com.hci.hcibackend.model.dto.RegisterDTO;
import com.hci.hcibackend.model.entity.BmsFollow;
import com.hci.hcibackend.model.entity.BmsPost;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.model.vo.ProfileVO;
import com.hci.hcibackend.service.UmsUserService;
import com.hci.hcibackend.utils.MD5Utils;
import com.hci.hcibackend.utils.jwt.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Set;

@Slf4j
@Service
public class UmsUserServiceImpl extends ServiceImpl<UmsUserMapper, UmsUser>
            implements UmsUserService {

    @Autowired
    private BmsTopicMapper bmsTopicMapper;

    @Autowired
    private BmsFollowMapper bmsFollowMapper;

    @Autowired
    private BmsCollectMapper bmsCollectMapper;

    @Autowired
    private com.hci.hcibackend.service.BmsPostService bmsPostService;

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

    @Override
    public UmsUser getUserByUsername(String username) {
        return baseMapper.selectOne(new LambdaQueryWrapper<UmsUser>().eq(UmsUser::getUsername, username));
    }

    @Override
    public String login(LoginDTO dto) {
        String token = null;
        try {
            UmsUser user = getUserByUsername(dto.getUsername());
            String md5password = MD5Utils.getPwd(dto.getPassword());
            if (!md5password.equals(user.getPassword())) {
                throw new Exception("密码错误");
            }
            token = JwtUtil.generateToken(user.getUsername());
        } catch (Exception e) {
            log.warn("用户不存在or密码验证失败=======>{}", dto.getUsername());
        }
        return token;
    }

    @Override
    public ProfileVO getUserProfile(String id) {
        ProfileVO profile = new ProfileVO();
        UmsUser user = baseMapper.selectById(id);
        BeanUtils.copyProperties(user, profile);
        // 用户文章数
        int count = Math.toIntExact(bmsTopicMapper.selectCount(new LambdaQueryWrapper<BmsPost>().eq(BmsPost::getUserId, id)));
        profile.setTopicCount(count);

        // 粉丝数
        int followers = Math.toIntExact(bmsFollowMapper.selectCount((new LambdaQueryWrapper<BmsFollow>().eq(BmsFollow::getParentId, id))));
        profile.setFollowerCount(followers);
        return profile;
    }

    @Override
    public Page<BmsPost> selectTopicsByUserId(Page<BmsPost> topicPage, String id) {

        // 获取关联的话题ID
        Set<String> ids = bmsCollectMapper.getTopicIdsByUserId(id);
        LambdaQueryWrapper<BmsPost> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(BmsPost::getId, ids);

        return bmsPostService.page(topicPage, wrapper);
    }
}
