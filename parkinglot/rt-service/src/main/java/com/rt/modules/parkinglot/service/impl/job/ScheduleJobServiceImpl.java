package com.rt.modules.parkinglot.service.impl.job;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rt.common.enums.ScheduleStatus;
import com.rt.common.factory.impl.IntegralStrategyFactory;
import com.rt.common.stragety.IntegralStrategy;
import com.rt.common.stragety.context.IntegralContext;
import com.rt.common.stragety.impl.ViolationIntegralStrategy;
import com.rt.modules.parkinglot.dto.OrderDTO;
import com.rt.modules.parkinglot.entity.LotDetail;
import com.rt.modules.parkinglot.entity.Order;
import com.rt.modules.parkinglot.entity.job.ScheduleJob;
import com.rt.modules.parkinglot.mapper.LotDetailMapper;
import com.rt.modules.parkinglot.mapper.OrderMapper;
import com.rt.modules.parkinglot.mapper.job.ScheduleJobMapper;
import com.rt.modules.parkinglot.service.IScheduleJobService;
import com.rt.utils.job.ScheduleUtils;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 定时任务 服务实现类
 * </p>
 *
 * @author edeis
 * @since 2017-12-14
 */
@Service
public class ScheduleJobServiceImpl extends ServiceImpl<ScheduleJobMapper, ScheduleJob> implements IScheduleJobService {

    @Autowired
    private Scheduler scheduler;

    @Autowired
    private ScheduleJobMapper scheduleJobMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private LotDetailMapper lotDetailMapper;

    @Override
    public boolean updateById(ScheduleJob entity) {
        ScheduleUtils.updateScheduleJob(scheduler, entity);
        return super.updateById(entity);
    }

    @Override
    @Transactional
    public void run(Long[] jobIds) {
        for (Long jobId : jobIds) {
//            ScheduleUtils.run(scheduler,selectById(jobId));
        }
    }

    @Override
    @Transactional
    public void pause(Long[] jobIds) {
        for (Long jobId : jobIds) {
            ScheduleUtils.pauseJob(scheduler, jobId);
        }

        updateBatch(jobIds, ScheduleStatus.PAUSE.getValue());
    }


    private void updateBatch(Long[] jobIds, int status) {
        Map<String, Object> map = new HashMap<>();
        map.put("list", jobIds);
        map.put("status", status);
        scheduleJobMapper.updateBatch(map);
    }

    @Override
    @Transactional
    public void resume(Long[] jobIds) {
        for (Long jobId : jobIds) {
            ScheduleUtils.resumeJob(scheduler, jobId);
        }
        updateBatch(jobIds, ScheduleStatus.NORMAL.getValue());
    }

    @Override
    @Transactional
    public void checkReserveStatus(String orderJsonObject) {
        JSONObject jsonObject = JSONObject.parseObject(orderJsonObject);
        OrderDTO oldOrderDTO = JSONObject.toJavaObject(jsonObject, OrderDTO.class);
        Order newOrder = orderMapper.selectById(oldOrderDTO.getId());
        LotDetail lotDetail = lotDetailMapper.selectById(newOrder.getLotId());
        Long customerId = newOrder.getCustomerId();
        if (lotDetail.getIsReserved() == 1 && lotDetail.getIsEntered() == 0) {
            // 该车位已预定但（30分钟后）还未入场 --> 1、扣除积分 2、释放车位
            // 1、扣除积分
            // 执行"扣除积分"策略
            IntegralStrategy strategy = new IntegralStrategyFactory().createStrategy(ViolationIntegralStrategy.class);
            IntegralContext integralContext = new IntegralContext(strategy);
            integralContext.doStrategy(customerId);

            // 2、释放车位
            lotDetail.setIsReserved(0);
            lotDetailMapper.updateById(lotDetail);
        }
        // 暂停任务
        Long jobId = oldOrderDTO.getJobId();
        Long[] jobIds = new Long[1];
        jobIds[0] = jobId;
        this.pause(jobIds);
    }
}








