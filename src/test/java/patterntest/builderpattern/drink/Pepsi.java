package patterntest.builderpattern.drink;

public class Pepsi extends ColdDrink {

    @Override
    public String name() {
        return "cold drink";
    }

    @Override
    public float price() {
        return 35f;
    }

}
