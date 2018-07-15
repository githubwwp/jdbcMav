package common.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbc.entity.excel.ColType;

import org.apache.commons.codec.Decoder;

public class Test2 {
    private static void testBoolean() {
        Boolean b = true;
        boolean b2 = b.booleanValue();
        System.out.println(b2);
        System.out.println(b.hashCode());
        System.out.println(Boolean.parseBoolean(null));
        System.out.println(Double.parseDouble(null));
    }

    private static void testByte() {
        System.out.println("Byte_max_value: " + Byte.MAX_VALUE);
        System.out.println("Byte_min_value: " + Byte.MIN_VALUE);
        System.out.println("Byte_size: " + Byte.SIZE);
        System.out.println("Byte_type: " + Byte.TYPE);
    }

    private static void testClass() throws ClassNotFoundException {
        System.out.println(Boolean.TYPE);
        System.out.println(Boolean.class);
        System.out.println(new Integer(2).getClass().getName());
        Class thread = Class.forName("java.lang.Thread");
        System.out.println(thread.getSimpleName());
    }

    public static void main(String[] args) throws ClassNotFoundException, UnsupportedEncodingException {
        List<Integer> colTypeList = new ArrayList<Integer>() {
            {
                add(ColType.STRING);
                add(ColType.DATE);
                add(ColType.DOUBLE);
            }
        };
        colTypeList.add(3);
        
    }

}
