package com.corner.action;

import java.util.Random;

public class ActionForward {

    private boolean isRedirect;
    private String path;
    private String verify;
    
    public ActionForward() {; }

    public boolean isRedirect() {
        return isRedirect;
    }

    public void setRedirect(boolean redirect) {
        isRedirect = redirect;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    
    public String getVerify() {
    	return verify;
    }
    
    public void setVerify(int dice) {
    	String num = Integer.toString(dice);
    	this.verify=num;
    }
    
}
