package com.rt.modules.medical.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rt.modules.medical.mapper.OrderMapper;
import com.rt.modules.parkinglot.entity.CustomerToLot;
import com.rt.modules.parkinglot.entity.Order;
import com.rt.modules.parkinglot.service.IOrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wm
 * @since 2020-04-13
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {

    private

    @Override
    @Transactional
    public Boolean reserve(String customerId, String lotDetailId) {
        Order order = new Order();
        order.setCustomerId(Long.parseLong(customerId));
        order.setLotId(Long.parseLong(lotDetailId));
        order.setCreateTime(LocalDateTime.now());
        order.setUpdateTime(LocalDateTime.now());
        // 插入预定订单表
        this.baseMapper.insert(order);


        return null;
    }
}
