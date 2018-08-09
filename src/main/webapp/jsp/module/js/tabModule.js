var count = 0;

Ext.onReady(function() {

	var panel = Ext.create('Ext.panel.Panel', {
		title : 'tab',
		tbar : [ {
			xtype : 'button',
			text : 'base tab',
			handler : showBaseTAbFn
		}, {
			xtype : 'button',
			text : 'advanced tab',
			handler : showAdvancedTabFn
		}, {
			xtype : 'button',
			text : 'overflow tab',
			handler : showOverflowTabFn
		}, {
			xtype : 'button',
			text : 'group tab',
			handler : showGroupTabFn
		} ],
		fbar : [ {
			xtype : 'button',
			text : 'fbar'
		} ],
		bbar : [ {
			xtype : 'button',
			text : 'bbar'
		} ],

		html : '<p>this is a tab text</p>'
	});

	Ext.create('Ext.container.Viewport', {
		layout : 'fit',
		items : [ panel ]
	});

});

// show base tab
function showBaseTAbFn() {
	var baseTab = Ext.create('Ext.tab.Panel', {
		items : [ {
			title : 'tab1',
			html : '<p>normal tab</p>'
		}, {
			title : 'ajax html',
			loader : {
				url : contextPath + '/',
				contentType : 'html',
				loadMask : true
			},
			listeners : {
				activate : function(tab) {
					tab.loader.load();
				}
			}
		}, {
			title : 'event tab',
			html : 'I have a event listeners attached ',
			listeners : {
				activate : function(tab) {
					Ext.Msg.alert('msg', tab.title + ' was activated ');
				}
			}
		}, {
			title : 'diasbled tab',
			disabled : true,
			html : 'can not see me because I am disabled '
		} ]

	});

	Ext.create('Ext.window.Window', {
		title : 'tab example',
		width : '400',
		height : '400',
		modal : true,
		layout : 'fit',
		items : [ baseTab ]
	}).show();

}

// show advanced tab
function showAdvancedTabFn() {
	Ext.tip.QuickTipManager.init();

	var tabs = Ext.create('Ext.tab.Panel', {
		id : 'tabs',
		items : [ {
			title : 'tab1'
		}, {
			title : 'tab2'
		} ]
	});

	Ext.create('Ext.window.Window', {
		title : 'advanced tab',
		width : '400',
		height : '400',
		modal : true,
		layout : 'fit',
		tbar : [ {
			xtype : 'button',
			text : 'add closable tab',
			handler : function() {
				addClosableTabFn(true);
			}
		}, {
			xtype : 'button',
			text : 'add unclosable tab',
			handler : function() {
				addClosableTabFn(false);
			}
		}, {
			xtype : 'button',
			text : 'scrollTo'
		} ],
		items : [ tabs ]
	}).show();
}

// show overflow tab
function showOverflowTabFn() {

}

// show group tab
function showGroupTabFn() {

}

// 新增可关闭的tab
function addClosableTabFn(closable) {
	count++;
	Ext.getCmp('tabs').add({
		closable : closable,
		html : 'this is a new tab',
		iconCls : 'tabs',
		title : 'tabs-' + count
	}).show();
}
