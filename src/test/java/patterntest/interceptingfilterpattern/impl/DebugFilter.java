package patterntest.interceptingfilterpattern.impl;

import patterntest.interceptingfilterpattern.Filter;

public class DebugFilter implements Filter {

    @Override
    public void execute(String request) {
        System.out.println("request log: " + request);
    }

}
