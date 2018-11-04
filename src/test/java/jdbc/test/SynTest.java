package jdbc.test;

class Abc{
    
    public synchronized static void mul(){
        System.out.println("mul");
    }
    
    public static void add(){
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("add");
    }
}


public class SynTest {

    public static void main(String[] args) {
        new Thread(){
            public void run(){
                Abc.mul();
            }
        }.start();
        new Thread(){
            public void run(){
                Abc.add();
            }
        }.start();
        
    }
    
}
