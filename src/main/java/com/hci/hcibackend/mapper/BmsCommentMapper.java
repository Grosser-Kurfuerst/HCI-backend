package com.hci.hcibackend.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hci.hcibackend.model.entity.BmsComment;
import com.hci.hcibackend.model.vo.CommentVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface BmsCommentMapper extends BaseMapper<BmsComment> {

    /**
     * getCommentsByTopicID
     *
     * @param topicid
     * @return
     */
    List<CommentVO> getCommentsByTopicID(@Param("topicid") String topicid);
}