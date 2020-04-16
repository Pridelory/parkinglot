package com.rt.api.common.controller;

import com.rt.common.controller.BaseApiController;
import com.rt.common.page.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;


@Api(value = "公共api", tags = {"公共接口"})
@RestController
@RequestMapping("/api/common")
public class CommonController extends BaseApiController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CommonController.class);

    /**
     * 头像上传接口
     *
     * @param uid
     * @param type
     * @param avatar
     * @return
     */
    @ApiOperation(value = "客户头像上传", notes = "客户头像上传")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "uid", value = "用户ID", required = true, paramType = "query"),
            @ApiImplicitParam(name = "avatar", value = "头像url", required = true, paramType = "query")
    })
    @RequestMapping(value = {"/avatarUpload"}, method = RequestMethod.POST)
    public R avatarUpload(@RequestParam(value = "uid", required = true) Long uid,
                          @RequestParam(value = "type", required = true) Integer type,
                          @RequestParam(value = "avatar", required = true) String avatar) {

        return R.ok();
    }

}
