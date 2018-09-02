Ext.onReady(function(){
 // 所有列都以百分数配置 -- 他们总和必须为1
   var panel1 = Ext.create('Ext.panel.Panel', {
        title: 'Column Layout - Percentage Only',
        width: 350,
        height: 250,
        layout:'column',
        items: [{
            title: 'Column 1',
            columnWidth: 0.25
        },{
            title: 'Column 2',
            columnWidth: 0.55
        },{
            title: 'Column 3',
            columnWidth: 0.20
        }]
    });

    // 参数 width 与 columnWidth 混用 -- 所有columnWidth值之和必须为1.
    // 第一列会占用宽度120px, 而后两列会填满容器剩下的宽度.

   var panel2 = Ext.create('Ext.Panel', {
        title: 'Column Layout - Mixed',
        width: 350,
        height: 250,
        layout:'column',
        items: [{
            title: 'Column 1',
            width: 120
        },{
            title: 'Column 2',
            columnWidth: 0.7
        },{
            title: 'Column 3',
            columnWidth: 0.3
        }]
    });
    
    Ext.create('Ext.container.Viewport', {
		layout : {
			align: 'middle',
			type : 'hbox',
			pack: 'center'
		},
		items : [panel1, panel2]
	});
});