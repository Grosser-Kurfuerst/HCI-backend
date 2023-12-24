package com.hci.hcibackend.controller;

import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.entity.BmsComment;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.model.vo.CommentVO;
import com.hci.hcibackend.service.BmsCommentService;
import com.hci.hcibackend.service.UmsUserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;



@RestController
@RequestMapping("/comment")
public class BmsCommentController extends BaseController {

    @Resource
    private BmsCommentService bmsCommentService;
    @Resource
    private UmsUserService umsUserService;

    @GetMapping("/get_comments")
    public ApiResult<List<CommentVO>> getCommentsByTopicID(@RequestParam(value = "topicid", defaultValue = "1") String topicid) {
        List<CommentVO> lstBmsComment = bmsCommentService.getCommentsByTopicID(topicid);
        return ApiResult.success(lstBmsComment);
    }
}