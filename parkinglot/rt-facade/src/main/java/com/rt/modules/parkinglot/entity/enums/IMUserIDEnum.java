package com.rt.modules.medical.entity.enums;

import com.baomidou.mybatisplus.core.enums.IEnum;

/**
 * @ClassName:  IMUserIDEnum
 * @Description:  用户注册IM时候 前缀+ID
 * @author:  <a href="liuyafengwy@163.com">luffy</a>
 * @date:  2019/2/27 20:34
 */
public enum IMUserIDEnum implements IEnum<String> {
    //用户类型0:患者 1医生
    PATIENT_IM("PATIENT_IM_","患者"),
    DOCTOR_IM("DOCTOR_IM_","医生");


    private String value;
    private String desc;

    IMUserIDEnum(final String value, final String desc) {
        this.value = value;
        this.desc = desc;
    }

    @Override
    public String getValue() {
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
