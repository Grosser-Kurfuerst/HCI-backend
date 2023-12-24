package com.hci.hcibackend.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hci.hcibackend.model.entity.BmsComment;
import com.hci.hcibackend.model.vo.CommentVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
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

    @Select("select bms_comment.*,ums_user.username from bms_comment join ums_user on ums_user.id = bms_comment.user_id where topic_id = #{topicid} order by create_time desc")
    List<CommentVO> getCommentsByTopicID(@Param("topicid") String topicid);
}