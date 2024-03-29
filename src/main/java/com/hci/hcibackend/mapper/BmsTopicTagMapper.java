package com.hci.hcibackend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hci.hcibackend.model.entity.BmsTopicTag;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface BmsTopicTagMapper extends BaseMapper<BmsTopicTag> {
    /**
     * 根据标签获取话题ID集合
     *
     * @param id
     * @return
     */
    @Select("SELECT t.topic_id from bms_post_tag t where t.tag_id = #{id}")
    Set<String> getTopicIdsByTagId(@Param("id") String id);
}