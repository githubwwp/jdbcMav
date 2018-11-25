Ext.onReady(function() {
	
//		Ext.MessageBox.confirm('save the file', 'confirm to save the file ?', function(e){
//			if(e == 'yes'){
//				Ext.MessageBox.alert('success', 'save success');
//			} else{
//				Ext.MessageBox.alert("fail", 'save fail');
//			}
//		});
	
	Ext.MessageBox.prompt('name', 'please input your name',  function(e){
		console.log(e);
	}, null, true);
	
});