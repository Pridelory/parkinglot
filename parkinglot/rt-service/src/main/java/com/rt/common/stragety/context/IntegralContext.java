package com.rt.common.stragety.context;

import com.rt.common.stragety.IntegralStrategy;

/**
 * 积分上下文
 */
public class IntegralContext {

    private IntegralStrategy integralStrategy;

    public IntegralContext(IntegralStrategy integralStrategy) {
        this.integralStrategy = integralStrategy;
    }

    public void doStrategy(long userId) {
        Long dynamicIntegral = integralStrategy.countIntegral();
        integralStrategy.settlementAndInsertInfo(userId, dynamicIntegral);
    }
}
