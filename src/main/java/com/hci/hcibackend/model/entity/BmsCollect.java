package com.hci.hcibackend.model.entity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
@Data
@TableName("bms_collect")
@Accessors(chain = true)
public class BmsCollect implements Serializable {
    private static final long serialVersionUID = -5028599844989220715L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    @TableField("user_id")
    private String userId;

    @TableField("topic_id")
    private String topicId;
}