package com.rt.common.stragety.impl;

import com.rt.common.stragety.IntegralStrategy;

/**
 * 违约-积分策略
 *
 * 扣10分
 */
public class ViolationIntegralStrategy extends IntegralStrategy {

    @Override
    public Long countIntegral() {
        return -10l;
    }
}
