package jdbc.entity.page;

public class PageParam {

    /**
     * 参数名
     */
    private String name;
    /**
     * 参数值
     */
    private String val;
    /**
     * 参数类型
     */
    private ParamTypeEnum type;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVal() {
        return val;
    }

    public void setVal(String val) {
        this.val = val;
    }

    public ParamTypeEnum getType() {
        return type;
    }

    public void setType(ParamTypeEnum type) {
        this.type = type;
    }

}
