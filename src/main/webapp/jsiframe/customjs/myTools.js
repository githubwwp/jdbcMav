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
        }
    };
})();

window.MT = window.MYTOOL; // 简写

