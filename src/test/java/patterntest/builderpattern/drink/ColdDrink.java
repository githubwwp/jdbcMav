package patterntest.builderpattern.drink;

import patterntest.builderpattern.Item;
import patterntest.builderpattern.pack.Bottle;
import patterntest.builderpattern.pack.Packing;

public abstract class ColdDrink implements Item {

    @Override
    public Packing packing() {
        return new Bottle();
    }

    @Override
    public abstract float price();

}
