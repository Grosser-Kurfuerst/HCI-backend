package com.hci.hcibackend.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hci.hcibackend.model.entity.BmsPost;
import com.hci.hcibackend.model.entity.BmsTag;

import java.util.List;


public interface BmsTagService extends IService<BmsTag> {
    /**
     * 插入标签
     *
     * @param tags
     * @return
     */
    List<BmsTag> insertTags(List<String> tags);
    /**
     * 获取标签关联话题
     *
     * @param topicPage
     * @param id
     * @return
     */
    Page<BmsPost> selectTopicsByTagId(Page<BmsPost> topicPage, String id);
}