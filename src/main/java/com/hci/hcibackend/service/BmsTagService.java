package com.hci.hcibackend.service;

import com.baomidou.mybatisplus.extension.service.IService;
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

}