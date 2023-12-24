package com.hci.hcibackend.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hci.hcibackend.common.ApiResult;
import com.hci.hcibackend.model.dto.CreateTopicDTO;
import com.hci.hcibackend.model.entity.BmsPost;
import com.hci.hcibackend.model.entity.UmsUser;
import com.hci.hcibackend.model.vo.PostVO;
import com.hci.hcibackend.service.BmsPostService;
import com.hci.hcibackend.service.UmsUserService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import com.vdurmont.emoji.EmojiParser;
import java.util.Date;

import java.util.Map;
import java.util.List;

import static com.hci.hcibackend.utils.jwt.JwtUtil.USER_NAME;


@RestController
@RequestMapping("/post")

public class PostController extends BaseController {
    @Resource
    private BmsPostService bmsPostService;
    @Resource
    private UmsUserService umsUserService;
    @GetMapping("/list")
    public ApiResult<Page<PostVO>> list(@RequestParam(value = "tab", defaultValue = "latest") String tab,
                                        @RequestParam(value = "pageNo", defaultValue = "1")  Integer pageNo,
                                        @RequestParam(value = "size", defaultValue = "10") Integer pageSize) {
        Page<PostVO> list = bmsPostService.getList(new Page<>(pageNo, pageSize), tab);
        return ApiResult.success(list);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ApiResult<BmsPost> create(@RequestHeader(value = USER_NAME) String userName
            , @RequestBody CreateTopicDTO dto) {
        UmsUser user = umsUserService.getUserByUsername(userName);
        BmsPost topic = bmsPostService.create(dto, user);
        return ApiResult.success(topic);
    }
    @GetMapping()
    public ApiResult<Map<String, Object>> view(@RequestParam("id") String id) {
        Map<String, Object> map = bmsPostService.viewTopic(id);
        return ApiResult.success(map);
    }


    @GetMapping("/recommend")
    public ApiResult<List<BmsPost>> getRecommend(@RequestParam("topicId") String id) {
        List<BmsPost> topics = bmsPostService.getRecommend(id);
        return ApiResult.success(topics);
    }

    @PostMapping("/update")
    public ApiResult<BmsPost> update(@RequestHeader(value = USER_NAME) String userName, @Valid @RequestBody BmsPost post) {
        UmsUser umsUser = umsUserService.getUserByUsername(userName);
        Assert.isTrue(umsUser.getId().equals(post.getUserId()), "非本人无权修改");
        post.setModifyTime(new Date());
        post.setContent(EmojiParser.parseToAliases(post.getContent()));
        bmsPostService.updateById(post);
        return ApiResult.success(post);
    }

    @DeleteMapping("/delete/{id}")
    public ApiResult<String> delete(@RequestHeader(value = USER_NAME) String userName, @PathVariable("id") String id) {
        UmsUser umsUser = umsUserService.getUserByUsername(userName);
        BmsPost byId = bmsPostService.getById(id);
        Assert.notNull(byId, "来晚一步，话题已不存在");
        Assert.isTrue(byId.getUserId().equals(umsUser.getId()), "你为什么可以删除别人的话题？？？");
        bmsPostService.removeById(id);
        return ApiResult.success(null,"删除成功");
    }

}
