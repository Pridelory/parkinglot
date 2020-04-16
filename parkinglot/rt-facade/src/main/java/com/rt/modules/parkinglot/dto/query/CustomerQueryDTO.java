package com.rt.modules.parkinglot.dto;

import com.rt.common.utils.base.annotation.NotNull;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class CustomerQueryDTO {

    /**
     * 客户姓名
     */
    @ApiModelProperty(value = "客户姓名")
    private String name;

    /**
     * 客户用户名
     */
    @ApiModelProperty(value = "用户名")
    @NotNull
    private String userName;

    /**
     * 客户密码
     */
    @ApiModelProperty(value = "密码")
    @NotNull
    private String password;
}
