package com.corner.action;

public class ActionForward {

    private boolean isRedirect;
    private String path;

    public ActionForward() {
    }

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
}
