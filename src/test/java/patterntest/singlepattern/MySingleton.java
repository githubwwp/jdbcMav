package patterntest.singlepattern;

/**
 * 单例模式
 * 
 * @author wwp
 * @date 2018-7-9
 */
public class MySingleton {

    private static MySingleton instance = new MySingleton();
    
    // 防止实例化
    private MySingleton() {

    }

    // 获取对象
    public static MySingleton getInstance() {
        return instance;
    }
    

}
