package patterntest.prototype;

import java.util.HashMap;
import java.util.Map;

import patterntest.prototype.base.Circle;
import patterntest.prototype.base.Rectangle;
import patterntest.prototype.base.Square;

public class ShapeCache {

    private static Map<String, Shape> shapeMap = new HashMap<String, Shape>();

    public static Shape getShape(String shapeId) {
        Shape cachedShape = shapeMap.get(shapeId);
        return (Shape) cachedShape.clone();
    }

    public static void loadShape() {
        Circle circle = new Circle();
        circle.setId("1");
        shapeMap.put(circle.getId(), circle);

        Square square = new Square();
        square.setId("2");
        shapeMap.put(square.getId(), square);

        Rectangle rectangle = new Rectangle();
        rectangle.setId("3");
        shapeMap.put(rectangle.getId(), rectangle);
    }

}
