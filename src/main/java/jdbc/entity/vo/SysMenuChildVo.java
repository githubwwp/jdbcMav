package jdbc.entity.vo;

import java.util.List;

import jdbc.entity.db.SysMenu;

public class SysMenuChildVo extends SysMenu {
    private Boolean leaf;

    private String text;

    private List<SysMenuChildVo> children;

    public List<SysMenuChildVo> getChildren() {
        return children;
    }

    public void setChildren(List<SysMenuChildVo> children) {
        this.children = children;
    }

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
