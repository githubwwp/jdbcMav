Ext.onReady(function() {
	new Ext.Viewport({
		layout: 'border',
		items: [
			{ 
				title: 'panel',
				region: 'north',
				tbar: [
					{
						text: 'extTool.html',
						handler: function(){
							replaceHtml("extTool.html");
						}
					},
					{
						text: 'messageBox.html',
						handler: function(){
							replaceHtml("messageBox.html");
						}
					},
					{
						text: 'gridPanel.html',
						handler: function(){
							replaceHtml("gridPanel.html");
						}
					},
					{
						text: 'store.html',
						handler: function(){
							replaceHtml("store.html");
						}
					}
				]
			},
			{
				title: 'center',
				region: 'center',
				html: '<iframe id="centerIframe" src="extTool.html" width="100%" height="100%" border="0"></iframe>'
			}
		]
	});
});

function replaceHtml(url){
	document.getElementById('centerIframe').src = url;
}


