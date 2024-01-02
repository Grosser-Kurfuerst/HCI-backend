package com.hci.hcibackend.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hci.hcibackend.model.entity.BmsPost;
import com.hci.hcibackend.model.entity.BmsTag;
import com.hci.hcibackend.model.entity.BmsTopicTag;

import java.util.List;
import java.util.Set;

public interface BmsTopicTagService extends IService<BmsTopicTag> {

    /**
     * 获取Topic Tag 关联记录
     *
     * @param topicId TopicId
     * @return
     */
    List<BmsTopicTag> selectByTopicId(String topicId);

    void createTopicTag(String id, List<BmsTag> tags);
    /**
     * 获取标签换脸话题ID集合
     *
     * @param id
     * @return
     */
    Set<String> selectTopicIdsByTagId(String id);
}