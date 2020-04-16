package com.rt.modules.medical.entity.enums;

import com.baomidou.mybatisplus.core.enums.IEnum;

/**
 * @ClassName:  DoctorAdviceStatusEnum
 * @Description:  医嘱状态
 * @author:  <a href="liuyafengwy@163.com">luffy</a>
 * @date:  2019/2/27 20:34
 */
public enum DoctorAdviceStatusEnum implements IEnum<Integer> {
    NORMAL(0,"正常"),
    STOP(1,"停止");


    private Integer value;
    private String desc;

    DoctorAdviceStatusEnum(final Integer value, final String desc) {
        this.value = value;
        this.desc = desc;
    }

    @Override
    public Integer getValue() {
        return this.value;
    }

    public String getDesc() {
        return this.desc;
    }

    @Override
    public String toString() {
        return getDesc();
    }
}
