package com.rt.common.stragety;

import com.rt.modules.parkinglot.entity.Integral;
import com.rt.modules.parkinglot.service.IIntegralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 积分策略
 */
@Component
public abstract class IntegralStrategy {

    @Autowired
    private IIntegralService integralService;

    /**
     * 计算积分策略抽象方法
     */
    public abstract Long countIntegral();

    /**
     * 更新用户积分信息等
     *
     * 逻辑固定不变
     * @param userId
     * @param integral
     */
    public void settlementAndInsertInfo(Long userId, Long integral) {
        // 给某个用户结算积分
        Integral currentIntegralObject = integralService.getById(userId);
        Long currentIntegral = currentIntegralObject.getIntegral();
        Long newIntegral = currentIntegral + integral;
        currentIntegralObject.setIntegral(newIntegral);
        integralService.updateById(currentIntegralObject);
    }
}
