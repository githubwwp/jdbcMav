package patterntest.builderpattern;

public class Test {

    public static void main(String[] args) {
        MealBuilder mealBuilder = new MealBuilder();
        Meal vegMeal = mealBuilder.prepareVegMeal();
        System.out.println("veg meal :");
        vegMeal.showItems();
        System.out.println("total cost: ");
        System.out.println(vegMeal.getCost());
    }

}
