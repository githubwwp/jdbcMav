package patterntest.abstractfactorypattern;

import patterntest.abstractfactorypattern.color.Blue;
import patterntest.abstractfactorypattern.color.Color;
import patterntest.abstractfactorypattern.color.Green;
import patterntest.abstractfactorypattern.color.Red;
import patterntest.abstractfactorypattern.shape.Shape;

public class ColorFactory extends AbstractFactory {

    @Override
    public Color getColor(String colorType) {
        if ("red".equalsIgnoreCase(colorType)) {
            return new Red();
        } else if ("blue".equalsIgnoreCase(colorType)) {
            return new Blue();
        } else if ("green".equalsIgnoreCase(colorType)) {
            return new Green();
        }
        return null;
    }

    @Override
    public Shape getShape(String shapeType) {
        // TODO Auto-generated method stub
        return null;
    }

}
