package com.hci.hcibackend.controller;

import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.entity.BmsComment;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.model.dto.CommentDTO;
import com.hci.hcibackend.model.vo.CommentVO;
import com.hci.hcibackend.service.BmsCommentService;
import com.hci.hcibackend.service.UmsUserService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import static com.hci.hcibackend.utils.jwt.JwtUtil.USER_NAME;


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
    @PostMapping("/add_comment")
    public ApiResult<BmsComment> add_comment(@RequestHeader(value = USER_NAME) String userName,
                                             @RequestBody CommentDTO dto) {
        UmsUser user = umsUserService.getUserByUsername(userName);
        BmsComment comment = bmsCommentService.create(dto, user);
        return ApiResult.success(comment);
    }
}