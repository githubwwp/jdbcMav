// 工具类 (单例，闭包)
window.MYTOOL = (function() {
	var x, y, z; // 私有变量
	return {
		setX : function(arg1) {
			x = arg1;
		},
		getX : function() {
			return x;
		},
		// 判断为空
		isEmpty : function(obj) {
			if (obj === undefined || obj === '' || obj === null || obj === []) {
				return true;
			}
			return false;
		},
		// 判断不为空
		isNotEmpty : function(obj) {
			return !this.isEmpty(obj);
		},
		ajax : function(url, params, cb) {
			Ext.Ajax.request({
				url : url,
				params : params,
				success : function(response) {
					console.log(response);
					var text = response.responseText;
					if (cb) {
						cb.apply(this, [text]);
					}
				},
				failure : function(response) {
					Ext.MessageBox.alert('失败', '请求超时或网络故障,错误编号：'
							+ response.status);
				}
			});
		}
	};
})();

window.MT = window.MYTOOL; // 简写

