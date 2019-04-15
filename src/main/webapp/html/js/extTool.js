Ext.onReady(function() {

    // 定义类
    Ext.define('Person', {
        name: undefined,
        age: -1,

        constructor: function(name, age) {
            this.name = name;
            this.age = age;
        },

        eat: function() {
            return 'eat';
        }

    });


    //	new Ext.Viewport({
    //		layout: 'fit',
    //		items: [
    //			
    //		]
    //	});


});