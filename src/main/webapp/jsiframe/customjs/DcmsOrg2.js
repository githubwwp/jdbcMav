/**
 * 部门选择组件 
 * 2018-3-2 by wwp
 */
document.writeln("<script type='text/javascript' src='"+theContextPath+"/dwr/interface/orgDao.js'></script>");
Ext.define('Ext.ux.DcmsOrg2', {
    extend : Ext.form.ComboBox,
    alias : [ 'widget.dcmsorg2' ],
    fields: [ 'text', 'id', 'pid', 'children', 'leaf' ], // store 的fields
    displayField : 'org_name', // 显示值
    valueField: 'org_id', // 实际值
    forceSelection: true,
    
    initComponent : function() {
        this.listeners = this.listeners || {};
        
        // 添加基本数据store
        dcmsorg2_loadStore(this);
        
        // 添加展开事件
        Ext.apply(this.listeners, {
            'expand' : function(e) {
                this.collapse(); // 不展开
                dcmsorg2_showWinTree(this); // 弹框树
            }
        });
        
        Ext.apply(this.listeners, {
            'expand' : function(e) {
                this.collapse(); // 不展开
                dcmsorg2_showWinTree(this); // 弹框树
            }
        });
        
        Ext.ux.DcmsOrg2.superclass.initComponent.call(this);
    }
});

// 添加下拉框基本数据
function dcmsorg2_loadStore(obj) {
    DWREngine.setAsync(false);
    var orgList;
    orgDao.getAllOrg(function(rst) {
        obj.store = Ext.create('Ext.data.Store', {
            fields : [ obj.displayField, obj.valueField ],
            data : rst
        });
    });
    DWREngine.setAsync(true);
}


//展示部门树
function dcmsorg2_showWinTree(obj){
    // 获取org 树
    DWREngine.setAsync(false);
    var treeMap;
    orgDao.getAllTreeOrg(function(rst){
        treeMap = rst.orgTreeMap;
    });
    DWREngine.setAsync(true);
    
    // store
    var treeStore = Ext.create('Ext.data.TreeStore', {
        fields: obj.fields,
        root: treeMap
    });
    
    // treePanel
    var treePanel = Ext.create('Ext.tree.Panel', {
        rootVisible:true,
        autoScroll: true,
        useArrows: true,
        height: 400,
        bodyPadding : 5,
        store: treeStore,
        tbar: [
            {   xtype: 'button', text: '展开', iconCls: 'icon-sort-down icon-large icon-color-info',
                handler: function(){ treePanel.expandAll(); }
            },
            {   xtype: 'button', text: '收起', iconCls: ' icon-sort-up icon-large icon-color-info',
                handler: function(){ treePanel.collapseAll(); }
            }
        ],
        listeners: {
            'itemclick': function(xa, rec){
                
            }
        }
    });
    
    // 弹框
    var win = Ext.create('Ext.window.Window', {
        title : '选择组织机构', width : 550, height : 450,
        autoScroll: true, closable : true, frame : true, constrainHeader : true, modal: true,
        layout : 'fit', bodyPadding: 5,
        items : [ 
             treePanel   
        ],
        buttonAlign : 'center',
        fbar : [ 
            {   text : '确定',
                handler: function(btn){
                    var selectedItems = treePanel.getSelectionModel().getSelection();
                    if(selectedItems.length == 0){
                        Ext.Msg.alert("提示：", "请选择部门");
                    } else{
                        obj.setValue(selectedItems[0].data.id); // 赋值
                        btn.findParentByType('window').close();
                    }
                }
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
    treePanel.expandNode(treePanel.getRootNode()); // 展开根节点
    
    // 初始化选中的行
    dcmsorg2_defalutSelectedItem(obj, treePanel);
}

// 初始化选中节点
function dcmsorg2_defalutSelectedItem(obj, treePanel) {
    var val = obj.getValue();
    var store = treePanel.getStore(); // 树store
    var node = store.getNodeById(val);
    var selectionModel = treePanel.getSelectionModel();
    selectionModel.select(node); // 选中节点

    // 展开所有父节点
    while (node) {
        var parentNode = node.parentNode;
        node = parentNode;
        if (parentNode) {
            parentNode.expand();
        } else {
            break;
        }
    }
}

