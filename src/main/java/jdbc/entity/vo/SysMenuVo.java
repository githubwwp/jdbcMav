package jdbc.entity.vo;

import jdbc.entity.db.SysMenu;

public class SysMenuVo extends SysMenu {

    private Boolean leaf;

    private String text;

    public Boolean getLeaf() {
        return leaf;
    }

    public void setLeaf(Boolean leaf) {
        this.leaf = leaf;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

}