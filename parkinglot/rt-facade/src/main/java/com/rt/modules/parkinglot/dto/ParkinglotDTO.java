package com.rt.modules.parkinglot.dto;

import lombok.Data;

@Data
public class ParkinglotDTO {

    /**
     * 停车场名称
     */
    private String name;

    /**
     * 该停车场车位数量
     */
    private Integer parkingCount;

    /**
     * 车场状态 0未启用 1启用
     */
    private Integer status;
}
