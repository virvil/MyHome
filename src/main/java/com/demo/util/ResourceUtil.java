package com.demo.util;

import java.util.ResourceBundle;

/**
 * @Author:Virvil
 * @Description:
 * @Datte:Created in 16:27 2018/6/6
 * Modified By:
 */
public class ResourceUtil {
    private static final ResourceBundle bundle = java.util.ResourceBundle.getBundle("sysConfig");
    /**
     * 获取随机码的长度
     *
     * @return 随机码的长度
     */
    public static String getRandCodeLength() {
        return bundle.getString("randCodeLength");
    }

    /**
     * 获取随机码的类型
     *
     * @return 随机码的类型
     */
    public static String getRandCodeType() {
        return bundle.getString("randCodeType");
    }
}
