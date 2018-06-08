package common.test;

import java.util.UUID;

import jdbc.util.ObjectUtil;

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

    public static void main(String[] args) throws ClassNotFoundException {
        for (int i = 0; i < 5; i++) {
            String str = "ID".concat(UUID.randomUUID().toString().replace("-", "_"));
            System.out.println(str);
        }
    }

}
