package patterntest.builderpattern.burger;

public class ChickenBurger extends Burger {

    @Override
    public String name() {
        return "chicken burger";
    }

    @Override
    public float price() {
        return 50.5f;
    }

}
