package patterntest.builderpattern.drink;

public class Coke extends ColdDrink {

    @Override
    public String name() {
        return "cold drink";
    }

    @Override
    public float price() {
        return 30.0f;
    }

}
