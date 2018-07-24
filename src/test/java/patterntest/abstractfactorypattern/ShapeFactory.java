package patterntest.abstractfactorypattern;

import patterntest.abstractfactorypattern.color.Color;
import patterntest.abstractfactorypattern.shape.Circle;
import patterntest.abstractfactorypattern.shape.Rectangle;
import patterntest.abstractfactorypattern.shape.Shape;
import patterntest.abstractfactorypattern.shape.Square;

public class ShapeFactory extends AbstractFactory {

    @Override
    public Color getColor(String colorType) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Shape getShape(String shapeType) {

        if ("circle".equalsIgnoreCase(shapeType)) {
            return new Circle();
        } else if ("square".equalsIgnoreCase(shapeType)) {
            return new Square();
        } else if ("rectangle".equalsIgnoreCase(shapeType)) {
            return new Rectangle();
        }

        return null;
    }

}
