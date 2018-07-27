package patterntest.prototype;

public class Test {

    public static void main(String[] args) {
        ShapeCache.loadShape();

        Shape cloneShape = ShapeCache.getShape("1");
        System.out.println("shape :" + cloneShape.getType());

        Shape cloneShape2 = ShapeCache.getShape("2");
        System.out.println("shape :" + cloneShape2.getType());

        Shape cloneShape3 = ShapeCache.getShape("3");
        System.out.println("shape :" + cloneShape3.getType());

    }

}
