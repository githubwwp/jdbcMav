for ( var i = 0; i < len; i++) {
    var rec = saleTaskStore.getAt(i);
    for ( var j = 0; j < arrs.length; j++) {
        if (Ext.isEmpty(arrs[0])) {
            return "第" + (i + 1) + "行请输入" + arrs[1] + "！";
        }
    }
}