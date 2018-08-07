package patterntest.interceptingfilterpattern.impl;

import patterntest.interceptingfilterpattern.Filter;

public class AuthenticationFilter implements Filter {

    @Override
    public void execute(String request) {
        System.out.println("authenticating request: " + request);
    }

}
