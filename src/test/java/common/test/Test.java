package common.test;

public class Test {

    public static void main(String[] args) {
        new Thread(){
            @Override
            public void run() {
                System.out.println("3");
            }
        }.start();
    }
}
