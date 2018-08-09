Ext.onReady(function() {

    Ext.define('User', {
        extend : 'Ext.data.Model',
        fields : [ 'name', 'age', 'phone', 'alive' ],
        hasMany : 'Post'
    });

    Ext.define('Post', {
        extend : 'Ext.data.Model',
        fields : [ 'id', 'user_id' ]   
    });

    store = Ext.create('Ext.data.Store', {
        model : 'User',
        proxy : {
            type : 'ajax',
            url : contextPath + '/jsData/modelData.do',
            reader : {
                type : 'json',
                root : 'users'
            }
        },
        autoLoad : true
    });

});
