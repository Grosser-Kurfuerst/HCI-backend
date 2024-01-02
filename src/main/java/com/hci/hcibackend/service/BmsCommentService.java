package com.hci.hcibackend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hci.hcibackend.model.dto.CommentDTO;
import com.hci.hcibackend.model.entity.BmsComment;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.model.vo.CommentVO;

import java.util.List;


public interface BmsCommentService extends IService<BmsComment> {
    /**
     *
     *
     * @param topicid
     * @return {@link BmsComment}
     */
    List<CommentVO> getCommentsByTopicID(String topicid);

    BmsComment create(CommentDTO dto, UmsUser principal);
}