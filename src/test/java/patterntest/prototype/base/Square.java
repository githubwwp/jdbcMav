package patterntest.prototype.base;

import patterntest.prototype.Shape;

public class Square extends Shape {

    public Square() {
        type = "square";
    }

    @Override
    public void draw() {
        System.out.println("draw square");
    }

}
