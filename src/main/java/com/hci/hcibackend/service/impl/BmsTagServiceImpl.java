package com.hci.hcibackend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hci.hcibackend.mapper.BmsTagMapper;
import com.hci.hcibackend.model.entity.BmsTag;
import com.hci.hcibackend.service.BmsPostService;
import com.hci.hcibackend.service.BmsTagService;
import com.hci.hcibackend.service.BmsTopicTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class BmsTagServiceImpl extends ServiceImpl<BmsTagMapper, BmsTag> implements BmsTagService {

    @Autowired
    private com.hci.hcibackend.service.BmsTopicTagService bmsTopicTagService;

    @Autowired
    private com.hci.hcibackend.service.BmsPostService bmsPostService;

    @Override
    public List<BmsTag> insertTags(List<String> tagNames) {
        List<BmsTag> tagList = new ArrayList<>();
        for (String tagName : tagNames) {
            BmsTag tag = this.baseMapper.selectOne(new LambdaQueryWrapper<BmsTag>().eq(BmsTag::getName, tagName));
            if (tag == null) {
                tag = BmsTag.builder().name(tagName).build();
                this.baseMapper.insert(tag);
            } else {
                tag.setTopicCount(tag.getTopicCount() + 1);
                this.baseMapper.updateById(tag);
            }
            tagList.add(tag);
        }
        return tagList;
    }
}