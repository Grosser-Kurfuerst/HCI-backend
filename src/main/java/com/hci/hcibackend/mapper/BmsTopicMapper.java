package com.hci.hcibackend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hci.hcibackend.model.entity.BmsPost;
import com.hci.hcibackend.model.vo.PostVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BmsTopicMapper extends BaseMapper<BmsPost> {
    /**
     * 分页查询首页话题列表
     * <p>
     *
     * @param page
     * @param tab
     * @return
     */
    @Select("SELECT t.id, t.title, t.user_id, t.comments, t.view, t.collects, t.top, t.essence, t.create_time, t.modify_time, u.username, u.alias, u.avatar " +
            "FROM bms_post t " +
            "LEFT JOIN ums_user u ON t.user_id = u.id " +
            "WHERE " +
            "   (#{tab} = 'hot' AND date(t.create_time) <= date_add(curdate(), interval 1 day) AND date(t.create_time) >= date_sub(curdate(), interval 7 day)) " +
            "   OR " +
            "   (#{tab} != 'hot') " +
            "ORDER BY " +
            "   CASE WHEN #{tab} != 'hot' THEN t.create_time WHEN #{tab} = 'hot' THEN t.view END DESC, t.create_time DESC")
    Page<PostVO> selectListAndPage(@Param("page") Page<PostVO> page, @Param("tab") String tab);

    @Select("select * from bms_post t where t.id != #{id} order by rand(), t.view limit 10")
    List<BmsPost> selectRecommend(@Param("id") String id);
}
