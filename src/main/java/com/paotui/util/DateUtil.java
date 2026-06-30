package com.paotui.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static final String FORMAT_DEFAULT = "yyyy-MM-dd HH:mm:ss";
    public static final String FORMAT_DATE = "yyyy-MM-dd";

    public static String format(Date date) {
        if (date == null) {
            return "";
        }
        return new SimpleDateFormat(FORMAT_DEFAULT).format(date);
    }

    public static String format(Date date, String pattern) {
        if (date == null) {
            return "";
        }
        return new SimpleDateFormat(pattern).format(date);
    }
}
