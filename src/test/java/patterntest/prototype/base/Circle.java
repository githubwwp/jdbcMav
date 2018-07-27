package patterntest.prototype.base;

import patterntest.prototype.Shape;

public class Circle extends Shape {

    public Circle() {
        type = "circle";
    }

    @Override
    public void draw() {
        System.out.println("draw circel");
    }

}
