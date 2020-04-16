package com.rt.modules.parkinglot.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wm
 * @since 2020-04-13
 */
@TableName("tb_lot_detail")
public class LotDetail extends Model<LotDetail> {

    private static final long serialVersionUID = 1L;

    /**
     * 停车场详情主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 停车场id
     */
    private Long parkinglotId;

    /**
     * 该车位是否被预定 0否 1是
     */
    private Integer isReserved;

    /**
     * 改车位的车是否入场 0 否 1 是
     */
    private Integer is entered;

    /**
     * 该车位编号
     */
    private Long parkingCode;

    /**
     * 该车位创建时间
     */
    private LocalDateTime createTime;

    /**
     * 该车位更新时间
     */
    private LocalDateTime updateTime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getParkinglotId() {
        return parkinglotId;
    }

    public void setParkinglotId(Long parkinglotId) {
        this.parkinglotId = parkinglotId;
    }

    public Integer getIsReserved() {
        return isReserved;
    }

    public void setIsReserved(Integer isReserved) {
        this.isReserved = isReserved;
    }

    public Integer getIs entered() {
        return is entered;
    }

    public void setIs entered(Integer is entered) {
        this.is entered = is entered;
    }

    public Long getParkingCode() {
        return parkingCode;
    }

    public void setParkingCode(Long parkingCode) {
        this.parkingCode = parkingCode;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "LotDetail{" +
        "id=" + id +
        ", parkinglotId=" + parkinglotId +
        ", isReserved=" + isReserved +
        ", is entered=" + is entered +
        ", parkingCode=" + parkingCode +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
