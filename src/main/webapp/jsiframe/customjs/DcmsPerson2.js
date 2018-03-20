/**
 * 部门选择组件 
 * 2018-3-2 by wwp
 */
Ext.define('Ext.ux.DcmsPerson2', {
    extend : Ext.form.ComboBox,
    alias : [ 'widget.dcmsperson2' ],
    fields: [], // store 的fields
    displayField : 'org_name', // 显示值
    valueField: 'org_id', // 实际值
    forceSelection: true,
    editable: false, // 不让聚焦
    
    initComponent : function() {
        this.listeners = this.listeners || {};
        
        // 添加基本数据store
//        dcmsorg2_loadStore(this);
        
        // 添加展开事件
        Ext.apply(this.listeners, {
            'expand' : function(e) {
                dcmsperson2_showWin();
            }
        });
        
        Ext.ux.DcmsPerson2.superclass.initComponent.call(this);
    }
});

// 显示弹框
function dcmsperson2_showWin(){
	
	var baseStore =  Ext.create('Ext.data.Store', {
		fields: ['id', 'name', 'dep'],
		data: [
		   { id: '1', name: 'uop', dep: 'A' },  
		   { id: '2', name: '王者荣耀', dep: 'B' }, 
		   { id: '3', name: '英雄联盟', dep: 'C' }, 
		   { id: '4', name: 'QQ地主', dep: 'D' }, 
		   { id: '5', name: '流星蝴蝶剑', dep: 'E' }, 
		   { id: '6', name: '实况足球', dep: 'F' },
        ]
	});
	
    // 可选人员grid
    var dcmsperson2_empListGrid = Ext.create('Ext.grid.Panel', {
        id: "dcmsperson2_empListGrid", columnWidth: 0.45,
        forceFit:true, columnLines:true,
        store: baseStore,
        columns: [ 
            {   header: 'id', dataIndex: 'id', sortable: false, hideable: false, flex: 1 },
            {   header: '姓名', dataIndex: 'name', sortable: false, hideable: false, flex: 1,
            	items    : {
                    xtype: 'textfield',
                    flex : 1,
                    margin: 2,
                    enableKeyEvents: true,
                    listeners: {
                        keyup: function() {
                            var store = this.up('tablepanel').store;
                            store.clearFilter();
                            if (this.value) {
                                store.filter({
                                    property     : 'name',
                                    value         : this.value,
                                    anyMatch      : true,
                                    caseSensitive : false
                                });
                            }
                        },
                        buffer: 500
                    }
                }
            },
            {   header: '部门', dataIndex: 'dep', sortable: false, hideable: false, flex: 1 },
            {   header: '操作', flex: 1, align:'center', xtype: 'actioncolumn',
                items: [
                    {   icon: 'icon-remove-sign icon-large icon-color-danger', tooltip : '选择',
                        handler : function(grid, rowIdx){
                        	var rec = grid.getStore().getAt(rowIdx);
                        	// TODO	判断是否存在人员就工号
                            Ext.getCmp("dcmsperson2_selectedGrid").getStore().add(rec);
                        }
                    }
                ]
            }
        ]
    });
    
    // 已选人员grid
    var dcmsperson2_selectedGrid = Ext.create('Ext.grid.Panel', {
        id: "dcmsperson2_selectedGrid", columnWidth: 0.45,
        forceFit:true, columnLines:true,
        store: Ext.create('Ext.data.Store', {
        	fields: ['id', 'name', 'dep'],
        }),
        columns: [ 
            {   header: 'id', dataIndex: 'id', sortable: false, hideable: false, flex: 1 },
            {   header: '姓名', dataIndex: 'name', sortable: false, hideable: false, flex: 1 },
            {   header: '部门', dataIndex: 'dep', sortable: false, hideable: false, flex: 1 },
            {   header: '操作', flex: 1, align:'center', xtype: 'actioncolumn',
                items: [
                    {   icon: 'icon-remove-sign icon-large icon-color-danger', tooltip : '取消',
                        handler : function(grid, rowIdx){
                        	grid.getStore().removeAt(rowIdx);
                        	this.up('gridpanel').getView().refresh();
                        }
                    }
                ]
            }
        ]
    });
    
    
    // 弹框
    var win = Ext.create('Ext.window.Window', {
        title : '人员选择', width : 750, height : 350,
        autoScroll: true, closable : true, frame : true, constrainHeader : true, modal: true,
        layout : 'column',
        items : [ 
            dcmsperson2_empListGrid,
            { columnWidth: 0.1 },
            dcmsperson2_selectedGrid
        ],
        buttonAlign : 'center',
        fbar : [ 
            {   text : '确定',
                handler: function(btn){
                    
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
}

function dcmsperson2_filteritems(gridId, property) {
	return {
		xtype : 'textfield',
		flex : 1,
		margin : 2,
		enableKeyEvents : true,
		listeners : {
//			change : function() {
//				var store = Ext.getCmp(gridId).store;
//				store.clearFilter();
//				if (this.value) {
//					store.filter({
//						property : property,
//						value : this.value,
//						anyMatch : true,
//						caseSensitive : false
//					});
//				}
//			},
			buffer : 500
		}
	};
};


