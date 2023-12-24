package com.hci.hcibackend.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hci.hcibackend.mapper.BmsCommentMapper;
import com.hci.hcibackend.model.entity.BmsComment;
import com.hci.hcibackend.model.vo.CommentVO;
import com.hci.hcibackend.service.BmsCommentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Slf4j
@Service
public class BmsCommentServiceImpl extends ServiceImpl<BmsCommentMapper, BmsComment> implements BmsCommentService {
    @Override
    public List<CommentVO> getCommentsByTopicID(String topicid) {
        List<CommentVO> lstBmsComment = new ArrayList<CommentVO>();
        try {
            lstBmsComment = this.baseMapper.getCommentsByTopicID(topicid);
        } catch (Exception e) {
            log.info("lstBmsComment失败");
        }
        return lstBmsComment;
    }
}