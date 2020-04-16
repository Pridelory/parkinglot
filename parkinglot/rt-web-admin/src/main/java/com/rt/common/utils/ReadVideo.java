package com.rt.common.utils;

import it.sauronsoftware.jave.MultimediaInfo;
import it.sauronsoftware.jave.Encoder;

import java.io.File;
import java.math.BigDecimal;


/**
 * @author monkey_lwy@163.com
 * @date 2019-02-26 17:23
 * @desc
 */
public class ReadVideo {
    /**
     * 读取视频时长
     * @param videoPath 视频路径
     * @return
     */
    public static String readVideo(String videoPath) {
        String durationStr = "";
        File file = new File(videoPath); //videoPath传入值（"D:\\666.mp4"）
        Encoder encoder = new Encoder();
        long sum = 0;
        try {
            MultimediaInfo m = encoder.getInfo(file);
            sum = m.getDuration()/1000; //时长sum单位：秒

        } catch (Exception e) {
            e.printStackTrace();
        }
        double sum1 = (double) sum;
        System.out.println("视频时长总秒数："+sum1);

        BigDecimal duration =BigDecimal.valueOf(sum);
        durationStr = durationFormatToString(duration);
        System.out.println("视频时长:"+durationStr);

        return durationStr;
    }

    /**
     * 将视频时长转换成"00:00:00"的字符串格式
     * @param duration 视频时长（单位：秒）
     * @return
     */
    public static String durationFormatToString(BigDecimal duration)
    {
        BigDecimal nine = BigDecimal.valueOf(9);
        BigDecimal sixty = BigDecimal.valueOf(60);

        BigDecimal second = duration.divideAndRemainder(sixty)[1];
        BigDecimal minute = duration.subtract(second).divide(sixty).divideAndRemainder(sixty)[1];
        BigDecimal hour = duration.subtract(second).divideToIntegralValue(BigDecimal.valueOf(3600));

        String str = "";
        if (hour.compareTo(nine)>0)
        {
            str += hour.intValue() + ":";
        }
        else
        {
            str += "0" + hour.intValue() + ":";
        }
        if (minute.compareTo(nine)>0)
        {
            str += minute.intValue() + ":";
        }
        else
        {
            str += "0" + minute.intValue() + ":";
        }
        if (second.compareTo(nine)>0)
        {
            str += second.intValue();
        }
        else
        {
            str +="0"+ second.intValue();
        }
        return str;
    }


    public static String readVideoFile(File file) {
        String durationStr = "";
        Encoder encoder = new Encoder();
        long sum = 0;
        try {
            MultimediaInfo m = encoder.getInfo(file);
            sum = m.getDuration()/1000; //时长sum单位：秒

        } catch (Exception e) {
            e.printStackTrace();
        }
        double sum1 = (double) sum;
        System.out.println("视频时长总秒数："+sum1);

        BigDecimal duration =BigDecimal.valueOf(sum);
        durationStr = durationFormatToString(duration);
        System.out.println("视频时长:"+durationStr);

        return durationStr;
    }
}
