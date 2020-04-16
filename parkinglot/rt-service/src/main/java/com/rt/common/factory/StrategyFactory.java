package com.rt.common.factory;

import com.rt.common.stragety.IntegralStrategy;
import org.apache.poi.ss.formula.functions.T;

/**
 * 策略工厂
 */
public abstract class StrategyFactory {

    public abstract IntegralStrategy createStrategy(Class<T> c);
}
