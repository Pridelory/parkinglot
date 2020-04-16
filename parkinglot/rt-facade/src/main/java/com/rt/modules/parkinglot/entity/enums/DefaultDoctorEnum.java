package com.rt.modules.medical.entity.enums;

import com.baomidou.mybatisplus.core.enums.IEnum;

/**
 * @ClassName:  DefaultDoctorEnum
 * @Description:
 * @author:  <a href="liuyafengwy@163.com">luffy</a>
 * @date:  2019/2/27 20:34
 */
public enum DefaultDoctorEnum implements IEnum<Long> {

    SCHOOL_ADMIN(-1L,"默认医生ID");


    private Long value;
    private String desc;

    DefaultDoctorEnum(final Long value, final String desc) {
        this.value = value;
        this.desc = desc;
    }

    @Override
    public Long getValue() {
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
