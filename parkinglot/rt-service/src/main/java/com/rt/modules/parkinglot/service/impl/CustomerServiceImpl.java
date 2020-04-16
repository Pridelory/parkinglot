package com.rt.modules.medical.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rt.common.vo.HashPassword;
import com.rt.modules.medical.mapper.CustomerMapper;
import com.rt.modules.parkinglot.entity.Customer;
import com.rt.modules.parkinglot.service.ICustomerService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wm
 * @since 2020-04-13
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements ICustomerService {

    @Override
    @Transactional
    public Boolean saveCustomer(Customer customer) {
        if (StringUtils.isNotBlank(customer.getPassword())) {
            HashPassword hashPassword = HashPassword.encrypt(customer.getPassword());
            customer.setSalt(hashPassword.salt);
            customer.setPassword(hashPassword.password);
        }
        customer.setCreateTime(LocalDateTime.now());
        return this.save(customer);
    }

    @Override
    public Customer getCustomerByUsername(String username) {
        QueryWrapper<Customer> customerQueryWrapper = new QueryWrapper<>();
        customerQueryWrapper.eq("user_name", username);
        return this.getOne(customerQueryWrapper);
    }
}












