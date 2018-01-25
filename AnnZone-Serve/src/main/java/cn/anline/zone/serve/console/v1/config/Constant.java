package cn.anline.zone.serve.console.v1.config;

/**
 * 常量配置项，也可以配置到配置文件中，或者数据库字段中去
 * 在这里配置减少服务器io压力而已
 */
public class Constant {
    /**
     * JWT 加密key字符串
     */
    public static String key = "ann888jwt999key";

    /**
     * JWT 过期时间
     * 1000毫秒 =1秒
     * 60秒 = 1分钟
     * 60分钟 =1小时
     * 24小时 = 1天
     * 7天 = 1周
     * 4周 = 1月
     * 12月 = 1年
     *
     * 1000L*60*60*8 八小时
     */
    public static long exp = 1000L*60*60*2;
}
