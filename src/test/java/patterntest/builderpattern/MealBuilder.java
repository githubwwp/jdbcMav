package patterntest.builderpattern;

import patterntest.builderpattern.burger.ChickenBurger;
import patterntest.builderpattern.burger.VegBurger;
import patterntest.builderpattern.drink.Coke;
import patterntest.builderpattern.drink.Pepsi;

public class MealBuilder {

    public Meal prepareVegMeal() {
        Meal meal = new Meal();
        meal.addItem(new VegBurger());
        meal.addItem(new Coke());
        return meal;
    }

    public Meal prepareNonVegMeal() {
        Meal meal = new Meal();
        meal.addItem(new ChickenBurger());
        meal.addItem(new Pepsi());

        return meal;
    }

}
