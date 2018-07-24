package patterntest.builderpattern;

import patterntest.builderpattern.pack.Packing;

public interface Item {

    String name();
    
    Packing packing();
    
    float price();
    
}
