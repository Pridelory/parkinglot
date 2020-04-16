package com.rt.modules.medical.entity.enums;

import com.baomidou.mybatisplus.core.enums.IEnum;

/**
 * @ClassName:  UserTypeEnum
 * @Description:  用户类型
 * @author:  <a href="liuyafengwy@163.com">luffy</a>
 * @date:  2019/2/27 20:34
 */
public enum UserTypeEnum implements IEnum<Integer> {
    //用户类型0:患者 1医生
    PATIENT_TYPE(0,"患者"),
    DOCTOR_TYPE(1,"医生");


    private Integer value;
    private String desc;

    UserTypeEnum(final Integer value, final String desc) {
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
