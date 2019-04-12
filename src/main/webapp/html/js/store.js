Ext.onReady(function() {

    var treeData = { id: '0', text: 'ro' };

    // 添加导航
    Ext.Ajax.request({
        url: '/sysMenu/treeBaseData.do',
        method: 'post',
        success: function(rst) {
            var o = Ext.decode(rst.responseText);
            getNodeChildren(treeData, o.root);

            console.log(treeData);

            init(treeData)
        },
        failure: function(a) {
            alert(a.responseText);
        }
    });

});

function init(treeData) {
    var form = Ext.create('Ext.form.Panel', {
        xtype: 'from',
        title: 'form',
        items: [{
                xtype: 'textfield',
                fieldLabel: 'name',
                height: 120
            },
            {
                id: 'tree',
                fieldLabel: 'tree',
                xtype: 'treepicker',
                matchFieldWidth: true,
                maxPickerHeight: 200,
                width: 300,
                value: "0_2",
                autoScroll: true,
                //              xtype: 'tree',
                rootVisible: false,
                // 这里必须用 Ext.create 方法创建 treeStore
                store: Ext.create('Ext.data.TreeStore', {
                    root: treeData,
                    filter: function(item) {
                        return false;
                    }

                }),
                editable: true,
                displayField: 'text',
                enableKeyEvents: true,
                listeners: {
                    'keyup': function(me) {
                        console.log('keyup listeners')

                        me.expand();
                        var picker = me.picker;
                        var rawText = me.getRawValue(); // 文本框输入值
                        var view = picker.view; // 视图

                        // 如果输入为空, 清除过滤
                        if (!rawText) {
                            me.getStore().getRootNode().cascadeBy(function() {
                                var uiNode = view.getNodeByRecord(this);
                                if (uiNode) {
                                    uiNode.style.display = 'block';
                                }
                            });
                            return;
                        }

                        // 遍历节点
                        var displayNodeIds = []; // 需要显示节点
                        me.getStore().getRootNode().cascadeBy(function() {
                            var currNode = this;
                            var text = currNode.data.text;
                            var id = currNode.data.id;

                            if (text.toLowerCase().indexOf(rawText.toLowerCase()) >= 0) {
                                displayNodeIds.push(id);
                                // 循环添加父节点
                                while (currNode.parentNode) {
                                    //                                  currNode.expand();
                                    displayNodeIds.push(currNode.parentNode.data.id);
                                    currNode = currNode.parentNode;
                                }
                            }

                        });

                        // 去重
                        Ext.Array.unique(displayNodeIds);

                        // 显示, 隐藏
                        me.getStore().getRootNode().cascadeBy(function() {
                            var uiNode = view.getNodeByRecord(this);
                            if (uiNode) {
                                if (Ext.Array.contains(displayNodeIds, this.data.id)) {
                                    uiNode.style.display = 'block';
                                } else {
                                    uiNode.style.display = 'none';
                                }
                            }
                        });

                    }
                }
            }
        ]
    });

    new Ext.Viewport({
        layout: 'fit',
        items: [
            form
        ]
    });

}


// 取叶子节点
function getNodeChildren(pObj, flatData) {
    var i = 0,
        j = 0,
        len = flatData.length;

    // 遍历全部数据
    for (; i < len; i++) {
        var obj = flatData[i];

        if (obj.pid == pObj.id) {
            pObj.children = pObj.children || [];
            pObj.children.push(obj);

            getNodeChildren(obj, flatData);
        }
    }

    // 设置叶子节点
    if (Ext.isEmpty(pObj.children)) {
        pObj.leaf = true;
    } else {
        //      pObj.expanded = true;
    }
}