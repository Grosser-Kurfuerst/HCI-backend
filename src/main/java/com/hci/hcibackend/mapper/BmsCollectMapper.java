package com.hci.hcibackend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hci.hcibackend.model.entity.BmsCollect;
import com.hci.hcibackend.model.entity.BmsTopicTag;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface BmsCollectMapper extends BaseMapper<BmsCollect> {

    @Select("SELECT t.topic_id from bms_collect t where t.user_id = #{id}")
    Set<String> getTopicIdsByUserId(@Param("id") String id);
}