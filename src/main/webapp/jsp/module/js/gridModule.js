var num = 6;

Ext.onReady(function() {

	Ext.QuickTips.init();

	Ext.define('Ext.ux.CustomTable', {
		extend : 'Ext.panel.Panel',
		alias : [ 'widget.customtable' ],
		columns : 2,
		defaults : {
			bodyStyle : 'padding:2px',
			width : 200,
			height : 25,
			style: {
			    "white-space": "nowrap",
			    "text-overflow": "ellipsis",
			}
		},
		setTableValue : function(obj) { // 赋值函数
			var me = this;
			var comps = me.query('component[name]'); // 获取当前组件下的有name属性(非空)的组件
			if (comps && obj) {
				// 遍历每个组件，如果有name属性，赋值
				Ext.each(comps, function(c, i) {
					var name = c.name; // 组件name属性
					var renderer = c.renderer; // 组件渲染函数
					var val = obj[name];

					// 当obj中有name属性时才赋值，否则忽略
					if (obj.hasOwnProperty(name)) {// 渲染
						if (renderer) {
							val = renderer.apply(this, [ val, c, me ]);
						}

						// html格式化
						val = Ext.String.htmlEncode(val);
						c.update(val); // 赋值
					}

					// 添加鼠标悬停提示(当isTip值为true时显示)
					if (c.isTip) {
						Ext.tip.QuickTipManager.register({
							target : c.el.id,
							text : val
						});
					}
				});
			}
		},
		initComponent : function() { // 初始化调用
			var me = this; // 重新赋值，使子函数也能使用组件对象

			// 如果不存在对应的属性则添加
			Ext.applyIf(me, {
				layout : {
					type : 'table',
					columns : me.columns
				}
			});

			me.callParent(arguments); // 调用父类函数
		}
	});
	
	tab = Ext.create('Ext.ux.CustomTable', {
		items : [ {
			name : 'a',
			isTip : true,
			html : ' A content',
		}, {
			name : 'b',
			html : 'Cell A content Cell A content Cel sdfwe w l A content Cell A content Cell A content Cel sdfwe w l A content Cell A content Cell A content Cel sdfwe w l A content'
		}, {
			name : '',
			html : 'Cell B content'
		}, {
			html : 'Cell C content',
			cellCls : 'highlight'
		}, {
			html : 'Cell D content',
			id : 'clearButton'
		} ],
		renderTo : Ext.getBody()
	});
});
