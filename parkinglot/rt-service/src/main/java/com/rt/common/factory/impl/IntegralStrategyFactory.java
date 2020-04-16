package com.rt.common.factory.impl;

import com.rt.common.factory.StrategyFactory;
import com.rt.common.stragety.IntegralStrategy;


/**
 * 积分策略具体工厂
 */
public class IntegralStrategyFactory extends StrategyFactory {

    @Override
    public IntegralStrategy createStrategy(Class c) {
        IntegralStrategy integralStrategyProduct = null;
        try {
            integralStrategyProduct = (IntegralStrategy) Class.forName(c.getName()).newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return integralStrategyProduct;
    }
}
