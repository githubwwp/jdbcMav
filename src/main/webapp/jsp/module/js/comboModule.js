Ext.onReady(function() {
    Ext.tip.QuickTipManager.init();

    var panel = Ext.create('Ext.panel.Panel', {
        tbar : [ {
            xtype : 'button',
            text : 'local combo',
            handler : showLocalCombo
        }, {
            xtype : 'button',
            text : 'remote combo',
            handler : showRemoteCombo
        } ],
    });

    Ext.create('Ext.container.Viewport', {
        layout : 'fit',
        items : [ panel ]
    });

    // TODO
    showRemoteCombo();
});

function showLocalCombo() {
    var form = Ext.create('Ext.form.Panel', {
        layout : 'column',
        defaults : {
            padding : 5
        },
        border : false,
        padding : 5,
        items : [ {
            columnWidth : 1,
            xtype : 'combo',
            labelWidth : 130,
            fieldLabel : 'select a single state',
            displayField : 'name',
            queryMode : 'local',
            store : {
                fields : [ 'abbr', 'name', 'slogan' ],
                data : getStates()
            },
            listeners : {
                // 实现模糊查询
                'beforequery' : function(e) {
                    var combo = e.combo;
                    if (!e.forceAll) {
                        var input = e.query;
                        var regExp = new RegExp('.*' + input + '.*');
                        combo.store.filterBy(function(record, id) {
                            var text = record.get(combo.displayField);
                            return regExp.test(text);
                        });
                    }
                    combo.expand();
                    return false;
                }
            }
        }, {
            xtype : 'combo',
            columnWidth : 1,
            labelWidth : 130,
            fieldLabel : 'custom item template',
            displayField : 'name',
            valueField : 'slogan',
            queryMode : 'local',
            store : {
                fields : [ 'abbr', 'name', 'slogan' ],
                data : getStates()
            },
            listConfig : {
                getInnerTpl : function() {
                    return '<div data-qtip="{name}. {slogan}">{name} ({abbr})</div>';
                }
            }
        }, {
            xtype : 'combo',
            columnWidth : 1,
            labelWidth : 130,
            fieldLabel : 'multiple combo',
            displayField : 'name',
            valueField : 'slogan',
            queryMode : 'local',
            store : {
                fields : [ 'abbr', 'name', 'slogan' ],
                data : getStates()
            },
            multiSelect : true
        } ]
    });

    Ext.create('Ext.window.Window', {
        autoShow : true,
        title : 'local combo form',
        width : 500,
        height : 400,
        modal : true,
        layout : 'fit',
        items : [ form ]
    });
}

function getStates() {
    var states = [ {
        "abbr" : "AL",
        "name" : "Alabama",
        "slogan" : "The Heart of Dixie"
    }, {
        "abbr" : "AK",
        "name" : "Alaska",
        "slogan" : "The Land of the Midnight Sun"
    }, {
        "abbr" : "AZ",
        "name" : "Arizona",
        "slogan" : "The Grand Canyon State"
    }, {
        "abbr" : "AR",
        "name" : "Arkansas",
        "slogan" : "The Natural State"
    }, {
        "abbr" : "CA",
        "name" : "California",
        "slogan" : "The Golden State"
    }, {
        "abbr" : "CO",
        "name" : "Colorado",
        "slogan" : "The Mountain State"
    }, {
        "abbr" : "CT",
        "name" : "Connecticut",
        "slogan" : "The Constitution State"
    }, {
        "abbr" : "DE",
        "name" : "Delaware",
        "slogan" : "The First State"
    }, {
        "abbr" : "DC",
        "name" : "District of Columbia",
        "slogan" : "The Nation's Capital"
    }, {
        "abbr" : "FL",
        "name" : "Florida",
        "slogan" : "The Sunshine State"
    }, {
        "abbr" : "GA",
        "name" : "Georgia",
        "slogan" : "The Peach State"
    }, {
        "abbr" : "HI",
        "name" : "Hawaii",
        "slogan" : "The Aloha State"
    }, {
        "abbr" : "ID",
        "name" : "Idaho",
        "slogan" : "Famous Potatoes"
    }, {
        "abbr" : "IL",
        "name" : "Illinois",
        "slogan" : "The Prairie State"
    }, {
        "abbr" : "IN",
        "name" : "Indiana",
        "slogan" : "The Hospitality State"
    }, {
        "abbr" : "IA",
        "name" : "Iowa",
        "slogan" : "The Corn State"
    }, {
        "abbr" : "KS",
        "name" : "Kansas",
        "slogan" : "The Sunflower State"
    }, {
        "abbr" : "KY",
        "name" : "Kentucky",
        "slogan" : "The Bluegrass State"
    }, {
        "abbr" : "LA",
        "name" : "Louisiana",
        "slogan" : "The Bayou State"
    }, {
        "abbr" : "ME",
        "name" : "Maine",
        "slogan" : "The Pine Tree State"
    }, {
        "abbr" : "MD",
        "name" : "Maryland",
        "slogan" : "Chesapeake State"
    }, {
        "abbr" : "MA",
        "name" : "Massachusetts",
        "slogan" : "The Spirit of America"
    }, {
        "abbr" : "MI",
        "name" : "Michigan",
        "slogan" : "Great Lakes State"
    }, {
        "abbr" : "MN",
        "name" : "Minnesota",
        "slogan" : "North Star State"
    }, {
        "abbr" : "MS",
        "name" : "Mississippi",
        "slogan" : "Magnolia State"
    }, {
        "abbr" : "MO",
        "name" : "Missouri",
        "slogan" : "Show Me State"
    }, {
        "abbr" : "MT",
        "name" : "Montana",
        "slogan" : "Big Sky Country"
    }, {
        "abbr" : "NE",
        "name" : "Nebraska",
        "slogan" : "Beef State"
    }, {
        "abbr" : "NV",
        "name" : "Nevada",
        "slogan" : "Silver State"
    }, {
        "abbr" : "NH",
        "name" : "New Hampshire",
        "slogan" : "Granite State"
    }, {
        "abbr" : "NJ",
        "name" : "New Jersey",
        "slogan" : "Garden State"
    }, {
        "abbr" : "NM",
        "name" : "New Mexico",
        "slogan" : "Land of Enchantment"
    }, {
        "abbr" : "NY",
        "name" : "New York",
        "slogan" : "Empire State"
    }, {
        "abbr" : "NC",
        "name" : "North Carolina",
        "slogan" : "First in Freedom"
    }, {
        "abbr" : "ND",
        "name" : "North Dakota",
        "slogan" : "Peace Garden State"
    }, {
        "abbr" : "OH",
        "name" : "Ohio",
        "slogan" : "The Heart of it All"
    }, {
        "abbr" : "OK",
        "name" : "Oklahoma",
        "slogan" : "Oklahoma is OK"
    }, {
        "abbr" : "OR",
        "name" : "Oregon",
        "slogan" : "Pacific Wonderland"
    }, {
        "abbr" : "PA",
        "name" : "Pennsylvania",
        "slogan" : "Keystone State"
    }, {
        "abbr" : "RI",
        "name" : "Rhode Island",
        "slogan" : "Ocean State"
    }, {
        "abbr" : "SC",
        "name" : "South Carolina",
        "slogan" : "Nothing Could be Finer"
    }, {
        "abbr" : "SD",
        "name" : "South Dakota",
        "slogan" : "Great Faces, Great Places"
    }, {
        "abbr" : "TN",
        "name" : "Tennessee",
        "slogan" : "Volunteer State"
    }, {
        "abbr" : "TX",
        "name" : "Texas",
        "slogan" : "Lone Star State"
    }, {
        "abbr" : "UT",
        "name" : "Utah",
        "slogan" : "Salt Lake State"
    }, {
        "abbr" : "VT",
        "name" : "Vermont",
        "slogan" : "Green Mountain State"
    }, {
        "abbr" : "VA",
        "name" : "Virginia",
        "slogan" : "Mother of States"
    }, {
        "abbr" : "WA",
        "name" : "Washington",
        "slogan" : "Green Tree State"
    }, {
        "abbr" : "WV",
        "name" : "West Virginia",
        "slogan" : "Mountain State"
    }, {
        "abbr" : "WI",
        "name" : "Wisconsin",
        "slogan" : "America's Dairyland"
    }, {
        "abbr" : "WY",
        "name" : "Wyoming",
        "slogan" : "Like No Place on Earth"
    } ];
    return states;
}

function showRemoteCombo() {

    var form = Ext.create('Ext.form.Panel', {
        layout : 'column',
        defaults : {
            columnWidth : 1,
            padding : 5,
            labelWidth : 200,
            xtype : 'combo'
        },
        items : [ {
            fieldLabel : 'remoteLoad_localQuery combo',
            displayField : 'menuName',
            valueField : 'menuId',
            queryMode : 'local',
            store : {
                autoLoad : true,
                fields : [ 'menuId', 'menuName', 'menuPid', 'menuUrl' ],
                proxy : {
                    type : 'ajax',
                    url : contextPath + '/sysMenu/queryAll.do',
                    reader : {
                        type : 'json',
                        root : 'sysMenus'
                    }
                }
            },
            listeners : {
                // 实现模糊查询
                'beforequery' : fuzzyQuery,
                'select' : function(e) {
                    console.log(e);
                }
            }
        }, {
            xtype : 'combo',
            fieldLabel : 'remoteLoad_remoteQuery combo',
            displayField : 'menuName',
            valueField : 'menuId',
            queryMode : 'remote',
            triggerAction : 'all',
            pageSize : 1,
            minChars : 1, // 最小触发字符个数
            store : {
                fields : [ 'menuId', 'menuName', 'menuPid', 'menuUrl' ],
                pageSize : 15,
                proxy : {
                    type : 'ajax',
                    url : contextPath + '/sysMenu/queryRemoteMenus.do',
                    reader : {
                        type : 'json',
                        root : 'sysMenus',
                        totalProperty : 'count'
                    }
                }
            }

        } ]

    });

    Ext.create('Ext.window.Window', {
        autoShow : true,
        title : 'local combo form',
        width : 500,
        height : 400,
        modal : true,
        layout : 'fit',
        items : [ form ]
    });
}

function fuzzyQuery(e) {
    console.log(e.combo.lastQuery);
    
//    var combo = e.combo;
//    if (!e.forceAll) {
//        var input = e.query;
//        var regExp = new RegExp('.*' + input + '.*');
//        combo.store.filterBy(function(record, id) {
//            var text = record.get(combo.displayField);
//            return regExp.test(text);
//        });
//    }
//    combo.expand();
//    return false;
}
