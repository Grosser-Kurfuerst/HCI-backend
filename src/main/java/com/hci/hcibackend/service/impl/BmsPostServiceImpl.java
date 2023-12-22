package com.hci.hcibackend.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hci.hcibackend.mapper.BmsTagMapper;
import com.hci.hcibackend.mapper.BmsTopicMapper;
import com.hci.hcibackend.model.entity.BmsPost;
import com.hci.hcibackend.model.entity.BmsTag;
import com.hci.hcibackend.model.entity.BmsTopicTag;
import com.hci.hcibackend.model.vo.PostVO;
import com.hci.hcibackend.service.BmsPostService;
import com.hci.hcibackend.service.BmsTopicTagService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class BmsPostServiceImpl extends ServiceImpl<BmsTopicMapper, BmsPost>
        implements BmsPostService {
    @Resource
    private BmsTagMapper bmsTagMapper;

    @Autowired
    private BmsTopicTagService bmsTopicTagService;

    @Override
    public Page<PostVO> getList(Page<PostVO> page, String tab) {
        // 查询话题
        Page<PostVO> iPage = this.baseMapper.selectListAndPage(page, tab);
        // 查询话题的标签
        iPage.getRecords().forEach(topic -> {
            List<BmsTopicTag> topicTags = bmsTopicTagService.selectByTopicId(topic.getId());
            if (!topicTags.isEmpty()) {
                List<String> tagIds = topicTags.stream().map(BmsTopicTag::getTagId).collect(Collectors.toList());
                List<BmsTag> tags = bmsTagMapper.selectBatchIds(tagIds);
                topic.setTags(tags);
            }
        });
        return iPage;
    }
}
