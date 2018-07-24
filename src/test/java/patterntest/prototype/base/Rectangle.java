package patterntest.prototype.base;

import patterntest.prototype.Shape;

public class Rectangle extends Shape {

    public Rectangle() {
        type = "rectangle";
    }

    @Override
    public void draw() {

        System.out.println("draw: rectangle");
    }

}
