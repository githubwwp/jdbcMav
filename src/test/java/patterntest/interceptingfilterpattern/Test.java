package patterntest.interceptingfilterpattern;

import patterntest.interceptingfilterpattern.impl.AuthenticationFilter;
import patterntest.interceptingfilterpattern.impl.DebugFilter;

public class Test {

    public static void main(String[] args) {
        FilterManager filterManager = new FilterManager(new Target());

        filterManager.setFilter(new AuthenticationFilter());
        filterManager.setFilter(new DebugFilter());

        Client client = new Client();
        client.setFilterManager(filterManager);
        client.sendRequest("HOME");
    }
}
