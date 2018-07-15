package patterntest.singlepattern;

public class Test {

    public static void main(String[] args) {
        MySingleton mySingleton1 = MySingleton.getInstance();
        MySingleton mySingleton2 = MySingleton.getInstance();
        
        System.out.println(mySingleton1 == mySingleton2);
    }

}
