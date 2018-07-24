package patterntest.builderpattern.burger;

import patterntest.builderpattern.Item;
import patterntest.builderpattern.pack.Packing;
import patterntest.builderpattern.pack.Wrapper;

public abstract class Burger implements Item {

    @Override
    public Packing packing() {
        return new Wrapper();
    }

    @Override
    public abstract float price();

}
