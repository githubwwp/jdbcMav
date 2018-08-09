
Ext.define('Ext.ux.WinTreeSelect', {
    extend : Ext.form.ComboBox,
    alias : [ 'widget.winTreeSelect' ],
    initComponent : function() {
        this.listeners = this.listeners || {};
        
        // 添加基本数据store
        
        // 添加展开事件
        Ext.apply(this.listeners, {
            'expand' : function(e) {
                this.collapse(); // 不展开
                // 弹框树
                winTreeSelect_window(this);
                // 
            }
        });
        
        

        Ext.ux.WinTreeSelect.superclass.initComponent.call(this);
    }
});

function winTreeSelect_window(obj){
    Ext.Ajax.request( {
        url : contextPath + '/sysMenu/queryMenuVos.do',
        method : 'post',
        success : function(rst) {
            var o = Ext.decode(rst.responseText);
            ddd(obj, o);
        },
        failure : function(a) {
            alert(a.responseText);
        }
    });
}

//添加导航
function ddd(obj, o){
    var treeStore = Ext.create('Ext.data.TreeStore', {
        fields: [ 
            'text', 'menuId', 'menuPid', 'menuName', 'menuUrl', 'menuRemark', 'menuOrder', 'children'
        ],
        root: o.sysMenuChildVo
    });
    
    var treePanel = Ext.create('Ext.tree.Panel', {
        rootVisible:false,
        autoScroll: true,
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
                obj.setValue("女");
            }
        }
    });
    
    var win = Ext.create('Ext.window.Window', {
        title : '二次入职临时登记', width : 550, height : 450,
        autoScroll: true, closable : true, frame : true, constrainHeader : true, modal: true,
        layout : 'fit', bodyPadding: 5,
        items : [ 
             treePanel   
        ],
        buttonAlign : 'center',
        fbar : [ 
            {   text : '保存'
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
    
}