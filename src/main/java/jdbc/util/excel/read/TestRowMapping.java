package jdbc.util.excel.read;

import java.util.List;

public class TestRowMapping extends RowMapping {

    @Override
    public void defaultColMappings() {
        List<CellMapping> cmList = super.getCellList();
        cmList.add(new CellMapping(String.class, null));

    }

}
