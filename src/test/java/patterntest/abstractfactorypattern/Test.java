package patterntest.abstractfactorypattern;

import patterntest.abstractfactorypattern.color.Color;
import patterntest.abstractfactorypattern.shape.Shape;

public class Test {

    public static void main(String[] args) {
        AbstractFactory shapeFactory = FactoryProducer.getFactory("shape");
        Shape shape1 = shapeFactory.getShape("square");
        shape1.draw();
        Shape shape2 = shapeFactory.getShape("circle");
        shape2.draw();

        AbstractFactory colorFactory = FactoryProducer.getFactory("color");
        Color color1 = colorFactory.getColor("red");
        color1.fill();
        Color color2 = colorFactory.getColor("blue");
        color2.fill();
    }

}
