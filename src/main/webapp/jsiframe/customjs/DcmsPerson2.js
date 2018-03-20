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
    
    // 可选人员grid
    var dcmsperson2_empListGrid = Ext.create('Ext.grid.Panel', {
        id: "dcmsperson2_empListGrid", columnWidth: 0.4,
        forceFit:true, columnLines:true,
        store: Ext.create('Ext.data.Store', {
            fields: ['emp_name', 'emp_id', 'cost_subsidy'] 
        }),
        columns: [ 
            {   header: '姓名', dataIndex: 'emp_name', sortable: false, hideable: false, flex: 1 }
        ]
    });
    
    // 已选人员grid
    var dcmsperson2_selectedGrid = Ext.create('Ext.grid.Panel', {
        id: "dcmsperson2_selectedGrid", columnWidth: 0.4,
        forceFit:true, columnLines:true,
        store: Ext.create('Ext.data.Store', {
            fields: ['emp_name', 'emp_id', 'cost_subsidy'] 
        }),
        columns: [ 
            {   header: '姓名', dataIndex: 'emp_name', sortable: false, hideable: false, flex: 1 }
        ]
    });
    
    
    // 弹框
    var win = Ext.create('Ext.window.Window', {
        title : '人员选择', width : 450, height : 450,
        autoScroll: true, closable : true, frame : true, constrainHeader : true, modal: true,
        layout : 'column',
        items : [ 
            dcmsperson2_empListGrid,
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

