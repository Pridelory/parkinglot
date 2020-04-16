package com.rt.common.stragety.impl;

import com.rt.common.stragety.IntegralStrategy;

/**
 * 合格行为-积分策略
 *
 * 加五分
 */
public class QualifiedIntegralStrategy extends IntegralStrategy {

    @Override
    public Long countIntegral() {
        return 5l;
    }
}
