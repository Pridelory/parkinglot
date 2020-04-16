package com.rt.modules.parkinglot.service.impl.job;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rt.modules.parkinglot.entity.job.ScheduleJobLog;
import com.rt.modules.parkinglot.mapper.job.ScheduleJobLogMapper;
import com.rt.modules.parkinglot.service.IScheduleJobLogService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 定时任务日志 服务实现类
 * </p>
 *
 * @author edeis
 * @since 2017-12-14
 */
@Service("scheduleJobLogService")
public class ScheduleJobLogServiceImpl extends ServiceImpl<ScheduleJobLogMapper, ScheduleJobLog> implements IScheduleJobLogService {

}
