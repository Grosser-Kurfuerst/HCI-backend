package com.hci.hcibackend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hci.hcibackend.model.entity.BmsTopicTag;

import java.util.List;

public interface BmsTopicTagService extends IService<BmsTopicTag> {

    /**
     * 获取Topic Tag 关联记录
     *
     * @param topicId TopicId
     * @return
     */
    List<BmsTopicTag> selectByTopicId(String topicId);

}