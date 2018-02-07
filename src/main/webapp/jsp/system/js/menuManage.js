// 全局变量
var IS_ADD;
var IS_EDIT;

Ext.onReady(function(){
    
    Ext.create('Ext.container.Viewport', {
        id: 'viewPort',
        layout: 'fit', 
        items: [
        ]
    });
    addBaseTree();
});

// 基本树
function addBaseTree(){
    var treeStore = Ext.create('Ext.data.TreeStore', {
        fields: [ 
            'text', 'menuId', 'menuPid', 'menuName', 'menuUrl', 'menuRemark', 'menuOrder', 
        ],
        proxy: {
            type: 'ajax',
            url: contextPath + '/sysMenu/getChildrenByPid.do',
            reader: {
                type: 'json',
                root: 'children'
            },
            extraParams: {
                pid: '0'
            }
        },
        root: {  
            text: '根节点',  
            id: '0',  
            expanded: true  
        },  
        autoLoad: true
    });
    
    var form = Ext.create('Ext.form.Panel', {
       title: '<center>菜单详细信息</center>',
       id: 'editMenuForm',
       columnWidth: 0.58,
       autoScroll: true,
       height: 400,
       bodyPadding : 5,
       defaults : { margin : '3' },
       layout: 'column',
       items: [
           {    xtype: 'textfield', name: 'menuId', fieldLabel: '菜单id', labelWidth: 100, labelAlign: 'right', columnWidth: 1, readOnly: true },
           {    xtype: 'textfield', name: 'text', fieldLabel: '名称', labelWidth: 100, labelAlign: 'right', columnWidth: 1, readOnly: true },
           {    xtype: 'textfield', name: 'menuUrl', fieldLabel: '菜单地址', labelWidth: 100, labelAlign: 'right', columnWidth: 1, readOnly: true },
           {    xtype: 'textarea', name: 'menuRemark', fieldLabel: '备注', labelWidth: 100, labelAlign: 'right', columnWidth: 1, readOnly: true },
           {    xtype: 'textfield', name: 'menuOrder', fieldLabel: '排序', labelWidth: 100, labelAlign: 'right', columnWidth: 1, readOnly: true },
       ]
    });
    
    var tree = Ext.create('Ext.tree.Panel', {
       id: 'menuTreePanel',
       title: 'menu tree',
       height: 400,
       rootVisible:false,
       autoScroll: true,
       columnWidth: 0.4,
       store: treeStore,
       bodyPadding : 5,
       tbar: [
           {   xtype: 'button', text: '新增', iconCls: 'icon-plus icon-large',
               handler: function(){ showAddOrEditMenu('add'); } 
           },
           {   xtype: 'button', text: '编辑', iconCls: 'icon-edit icon-large',
               handler: function(){ showAddOrEditMenu('edit'); }
           },
           {   xtype: 'button', text: '删除', iconCls: 'icon-remove icon-large',
               handler: delEditMenu 
           }
       ],
       listeners: {
           'beforeitemexpand': function(node, optd){ // extjs 会自动处理其它 数据
               var tt=node.data.menuId;  // 不能使用id ，会和extjs 冲突
               treeStore.proxy.extraParams.pid = tt;
           },
           'itemclick': function(obj, record){ // 点击触发事件
               Ext.getCmp("editMenuForm").getForm().setValues(record.data);
           }
       }
    });
    
    var panel = Ext.create('Ext.panel.Panel', {
        layout: 'column',
        autoScroll: true,
        items: [
            tree,
            {columnWidth: 0.02, },
            form
         ]
    });
    
    Ext.getCmp("viewPort").add(panel);
}


// 编辑菜单
function showAddOrEditMenu(flag){
    // 初始化参数
    var title;
    IS_ADD = false;
    IS_EDIT = false;
    if('add' == flag){
        IS_ADD = true;
        title = "新增";
    } else if('edit' == flag){
        IS_EDIT = true;
        title = "编辑";
    } else{
        Ext.Msg.alert("提示：", "标识错误，flag：" + flag);
        return;
    }
    
    // 判断是否选中item
    var selections = Ext.getCmp("menuTreePanel").getSelectionModel().getSelection();
    if(selections.length == 0){
        Ext.Msg.alert("提示：", "请选择菜单");
        return;
    }
    
    var addOrEditMenuForm = Ext.create('Ext.form.Panel', {
        id: 'addOrEditMenuForm', autoScroll: true,
        bodyPadding : 5,
        defaults : { margin : '3' },
        layout: 'column',
        items: [
            {   xtype: 'textfield', name: 'menuId', fieldLabel: '菜单id', labelWidth: 100, labelAlign: 'right', columnWidth: 1,
                readOnly: true
            },
            {   xtype: 'textfield', name: 'menuPid', fieldLabel: '菜单pid', labelWidth: 100, labelAlign: 'right', columnWidth: 1,
                allowBlank: false, readOnly: true
            },
            {   xtype: 'textfield', name: 'menuName', fieldLabel: '名称', labelWidth: 100, labelAlign: 'right', columnWidth: 1,
                allowBlank: false, maxLength: 100
            },
            {   xtype: 'textfield', name: 'menuUrl', fieldLabel: '菜单地址', labelWidth: 100, labelAlign: 'right', columnWidth: 1,
                maxLength: 100
            },
            {   xtype: 'textarea', name: 'menuRemark', fieldLabel: '备注', labelWidth: 100, labelAlign: 'right', columnWidth: 1,
                maxLength: 100
            },
            {   xtype: 'textfield', name: 'menuOrder', fieldLabel: '排序', labelWidth: 100, labelAlign: 'right', columnWidth: 1,
                maxLength: 20
            },
        ]
    });
    

    // 弹框
    var win = Ext.create('Ext.window.Window', {
        id: 'addOrEditMenuWin', title : title + "菜单", width : document.body.clientWidth*0.5, height : document.body.clientHeight*0.7,
        closable : true, frame : true, constrainHeader : true, modal: true,
        layout : 'fit', defaults: { anchor: "100%" },
        items : [ 
             addOrEditMenuForm
        ],
        buttonAlign : 'center',
        fbar : [ 
            {   text : '保存',
                disabled : true,
                id: 'saveAddOrEditMenuBtn',
                handler : addOrEditMenu
            },
            {   text : '取消',
                handler : function(btn, e) {
                    btn.findParentByType('window').close();
                }
            }
        ],
        listeners : {}
    });
    win.show();
    
    // 初始化数据
    var addOrEditMenuForm = Ext.getCmp("addOrEditMenuForm").getForm(); 
    var selectedItem = selections[0];
    var menuId = selectedItem.data.menuId;
    if(IS_EDIT){
        Ext.Ajax.request( {
            url : contextPath + '/sysMenu/querySysMenuById.do',
            method : 'post',
            params : {
                menuId: menuId
            },
            success : function(rst) {
                var o = Ext.decode(rst.responseText);
                addOrEditMenuForm.setValues(o.sysMenu);
                Ext.getCmp("saveAddOrEditMenuBtn").setDisabled(false); // 按钮可用
            },
            failure : function(a) {
                alert(a.responseText);
            }
        });
    } else{
        addOrEditMenuForm.findField('menuPid').setValue(menuId);
        Ext.getCmp("saveAddOrEditMenuBtn").setDisabled(false); // 按钮可用
    }
}

// 新增或编辑菜单
function addOrEditMenu(){
    var addOrEditMenuForm = Ext.getCmp("addOrEditMenuForm").getForm(); 
    if(!addOrEditMenuForm.isValid()){
        Ext.Msg.alert("提示：", "请完善表单信息！");
        return;
    }
    
    var addOrEdit;
    if(IS_ADD){
        addOrEdit = "add";
        var params = addOrEditMenuForm.getValues();
        Ext.Ajax.request( {
            url : contextPath + '/sysMenu/addSysMenu.do',
            method : 'post',
            params : params,
            success : function(rst) {
                Ext.Msg.alert("提示：", "保存成功", function(){
                    location.reload();// 刷新页面
                });
            },
            failure : function(a) {
                alert(a.responseText);
            }
        });
        
    } else if(IS_EDIT){
        addOrEdit = "edit";
        var params = addOrEditMenuForm.getValues();
        Ext.Ajax.request( {
            url : contextPath + '/sysMenu/editSysMenu.do',
            method : 'post',
            params : params,
            success : function(rst) {
                Ext.Msg.alert("提示：", "保存成功", function(){
                    location.reload();// 刷新页面
                });
            },
            failure : function(a) {
                alert(a.responseText);
            }
        });
        
    } else{
        Ext.Msg.alert("提示：", "添加或编辑状态异常!");
        return;
    }
    
}

// 删除菜单
function delEditMenu(){
    var selections = Ext.getCmp("menuTreePanel").getSelectionModel().getSelection();
    if(selections.length == 0){
        Ext.Msg.alert("提示：", "请选择菜单");
        return;
    } else{
        var data = selections[0].data;
        if(data.leaf){ // 只能删除子叶
            Ext.Msg.confirm('删除确认','是否删除该菜单?',function(opt){
                if(opt=='yes'){
                    Ext.Ajax.request( {
                        url : contextPath + '/sysMenu/deleteSysMenu.do',
                        method : 'post',
                        params : data,
                        success : function(rst) {
                            var o = Ext.decode(rst.responseText);
                            if(o.rstMsg == '0000'){
                                Ext.Msg.alert("提示：", "保存成功", function(){
                                    location.reload();// 刷新页面
                                });
                            } else{
                                Ext.Msg.alert("提示：", o.rstMsg);
                            }
                        },
                        failure : function(a) {
                            alert(a.responseText);
                        }
                    });
                } 
            });
        } else{
            Ext.Msg.alert("提示：", "只能删除末级菜单");
        }
    }
}


