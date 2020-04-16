package com.rt.modules.medical.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rt.modules.medical.mapper.CustomerToLotMapper;
import com.rt.modules.parkinglot.entity.CustomerToLot;
import com.rt.modules.parkinglot.service.ICustomerToLotService;
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
public class CustomerToLotServiceImpl extends ServiceImpl<CustomerToLotMapper, CustomerToLot> implements ICustomerToLotService {
}
