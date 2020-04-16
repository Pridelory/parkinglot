package com.rt.modules.parkinglot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.rt.modules.abm.entity.job.ScheduleJob;

import java.util.Map;

/**
 * <p>
 * 定时任务 Mapper 接口
 * </p>
 *
 * @author edeis
 * @since 2017-12-14
 */
public interface ScheduleJobMapper extends BaseMapper<ScheduleJob> {
    /**
     * 批量更新状态
     */
    int updateBatch(Map<String, Object> map);
}
