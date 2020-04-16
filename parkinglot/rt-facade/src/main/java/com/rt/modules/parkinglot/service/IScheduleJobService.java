package com.rt.modules.parkinglot.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.rt.modules.parkinglot.entity.job.ScheduleJob;

/**
 * <p>
 * 定时任务 服务类
 * </p>
 *
 * @author edeis
 * @since 2017-12-14
 */
public interface IScheduleJobService extends IService<ScheduleJob> {

    /**
     * 立即执行
     */
    void run(Long[] jobIds);

    /**
     * 暂停运行
     */
    void pause(Long[] jobIds);

    /**
     * 恢复运行
     */
    void resume(Long[] jobIds);

    /**
     * checkReserveStatus
     *
     * @param checkStatusDTO
     */
    void checkReserveStatus(String checkStatusDTO);
}
