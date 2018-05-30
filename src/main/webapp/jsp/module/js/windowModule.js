Ext.onReady(function() {

    // 自定义类
    Ext.define('Ext.wwp.Panel', {
        extend : Ext.panel.Panel,
        alias : [ 'widget.wwppanel' ],
        initComponent : function() {

            Ext.apply(this, {
                title : 'his is my custom component',
                tbar : [ {
                    xtype : 'button',
                    text : 'layout window',
                    handler : layout_window
                }, {
                    xtype : 'button',
                    text : 'message box dialog',
                    menu : [ {
                        text : 'confirm',
                        handler : showConfirm
                    }, {
                        text : 'prompt',
                        handler : showPrompt
                    }, {
                        text : 'multi-line prompt',
                        handler : showMultiLinePrompt
                    }, {
                        text : 'yes/no/cancel',
                        handler : showYesNocancel
                    }, {
                        text : 'progress dialog',
                        handler : showProgressDialog
                    }, {
                        text : 'wait dialog',
                        handler : showWaitDialog
                    }, {
                        text : 'alert',
                        handler : showAlert
                    }, {
                        text : 'icons window',
                        handler : showIconsWindow
                    }, {
                        text : 'custom button text',
                        handler : showCustomButtonText
                    } ]
                } ]
            });

            this.callParent();
        }
    });

    // viewport
    Ext.create('Ext.container.Viewport', {
        id : 'viewPort',
        layout : 'fit',
        items : [ {
            xtype : 'wwppanel'
        } ]
    });

});

// 布局window
function layout_window() {

    Ext.create('Ext.window.Window', {
        title : 'layout window',
        closable : true,
        width : 800,
        height : 400,
        modal : true,
        layout : 'border',
        items : [ {
            region : 'west',
            title : 'navigation',
            width : 200
        }, {
            region : 'center',
            xtype : 'tabpanel',
            items : [ {
                title : 'first tab',
                html : '<p>first tab</p>'
            }, {
                title : 'second tab',
                html : '<p>second tab</p>'
            }, {
                title : 'third tab',
                html : '<p>third tab</p>'
            } ]
        } ]

    }).show();
}

function showConfirm() {
    Ext.MessageBox.confirm('confirm', 'Are you sure you want to do that?', function(result) {
        console.log(result);
    });
}

function showPrompt() {
    Ext.MessageBox.prompt('name', 'please enter your name', function(result, text) {
        console.log("result: " + result + ", text: " + text);
    });
}

function showMultiLinePrompt() {
    Ext.MessageBox.show({
        title : 'address',
        msg : 'please enter you address',
        width : 300,
        buttons : Ext.MessageBox.OKCANCEL,
        multiline : true,
        fn : function(result, text) {
            console.log("result: " + result + ", text: " + text);
        }
    });
}

function showYesNocancel() {
    Ext.MessageBox.show({
        title : 'save change?',
        msg : 'would you like to save your change?',
        buttons : Ext.MessageBox.YESNOCANCEL,
        icon : Ext.MessageBox.QUESTION,
        fn : function(result) {
            console.log(result);
        }
    });
}

function showProgressDialog() {
    Ext.MessageBox.show({
        title : 'please wait',
        msg : 'loading items...',
        progressText : 'initializing',
        width : 300,
        progress : true,
        closable : true
    });
}

function showWaitDialog() {
    Ext.MessageBox.show({
        title : 'saving',
        msg : 'saving the data, please wait ...',
        progressText : 'saving ...',
        width : 300,
        closable : true,
        wait : true,
        waitConfig : {
            interval : 200
        }
    });
}

function showAlert() {
    Ext.MessageBox.alert('status', 'changes saved successfully', function(result) {
        console.log(result);
    });
}

function showIconsWindow() {
    Ext.MessageBox.show({
        title : 'Icons Supports',
        msg : 'here is message with an icon',
        buttons : Ext.MessageBox.OK,
        icon : 'Warning',
        fn : function(result) {
            console.log(result);
        }
    });
}

function showCustomButtonText() {
    Ext.MessageBox.show({
        title : 'what, really?',
        msg : 'Are you sure',
        buttons : Ext.MessageBox.YESNO,
        buttonText : {
            yes : 'definitely',
            no : 'no chance'
        },
        fn : function(result) {
            console.log(result);
        }
    });
}
