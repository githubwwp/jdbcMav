/*
 * 自定义表格 by wwp 2018-08-22
 * 
 * 主键设置
 * isTip: boolean 是否需要添加鼠标提示
 * columns: number, 总列数
 * cellWidth: number, 单个单元格宽度
 * cellHeight: number, 单个单元格高度
 * setTableValues(object): function, 赋值方法
 * 
 * 单元格设置
 * renderer(val, cellObject, componentObject): function, 渲染函数
 * 
 */
Ext.define('Ext.wwp.CustomTable', {
	extend : 'Ext.panel.Panel',
	alias : [ 'widget.customtable' ],
	collapsible : true,
	columns : 6,
	cellWidth : 200,
	cellHeight : 25,
	// 初始化调用
	initComponent : function() {
		var me = this; // 重新赋值，使子函数也能使用组件对象
		var listeners = me.listeners || {};

		Ext.tip.QuickTipManager.init();

		me.on('afterrender', me.afterRenderFn);

		Ext.apply(me, {
			defaults : {
				bodyStyle : {
					padding : '4 8 4 8',
					"white-space" : "nowrap",
					"text-overflow" : "ellipsis"
				}
			},
			layout : {
				type : 'table',
				columns : me.columns
			}
		});

		me.callParent(arguments); // 调用父类函数
	},
	// 样式设置
	afterRenderFn : function() {
		var me = this;

		var items = me.items.items;
		Ext.each(items, function(c, i) {
			c.width = me.cellWidth * (c.colspan || 1);
			c.height = me.cellHeight * (c.rowspan || 1);
			c.el.applyStyles({
				'text-align' : c.align || 'left'
			});
		});
	},
	// 赋值函数
	setTableValues : function(obj) { 
		var me = this;
		var comps = me.query('component[name]'); // 获取当前组件下的有name属性(非空)的组件
		if (comps && obj) {
			Ext.each(comps, function(c, i) {
				var name = c.name;
				var renderer = c.renderer;
				var val = obj[name];

				if (obj.hasOwnProperty(name)) {
					if (renderer) {
						val = renderer.apply(this, [ val, c, me ]);
					}

					var htmlVal = Ext.String.htmlEncode(val); // html格式化

					// 添加鼠标悬停提示(当isTip值为true时显示)
					if (c.isTip) {
						Ext.tip.QuickTipManager.register({
							target : c.el.id,
							text : htmlVal
						});
					}
					c.update(htmlVal);
				}
			});
		}
	},
});