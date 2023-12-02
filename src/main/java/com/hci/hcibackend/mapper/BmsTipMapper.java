package com.hci.hcibackend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hci.hcibackend.model.entity.BmsTip;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface BmsTipMapper extends BaseMapper<BmsTip> {
    @Select("select * from bms_tip order by rand() limit 1")
    BmsTip getRandomTip();
}
