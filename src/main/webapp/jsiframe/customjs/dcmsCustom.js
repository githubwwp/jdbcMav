/**
 * 易汇自定义下拉选择及模糊查找功能
 * dwrMethod:调用后台获取数据
 * extField:现实的扩展字段
 * allowExtShow:是否允许扩展字段显示
 * fixedData:固定数据，例如：请选择
 * selected:选择后触发事件，接收2个参数，第一个参数控件本身，第二个当前选择的值
 * dataProterty:获取数据属性，如果不设置则表示dwrMethod返回的对象就是数据，设置后通过返回对象的属性获取
 * param:查询参数
 * useage:
 * {xtype:'dcmscustom',fieldLabel:'机构',name:'org',id:'org',allowParent:true,multiple:true}
 */
Ext.define('Ext.ux.DcmsCustom', {
    extend:Ext.form.ComboBox,
    alias: ['widget.dcmscustom'],
    extField:[],//下拉显示人员时显示格式
    extFieldSort:'desc',//拓展项组合排序方式
    fixedData:[],
    dwrMethod:null,
    allowExtShow:false,
    delimiter:'-',//拓展项分隔符
    param:null,
    selected:null,//选择后触发事件
    dataProterty:null,//设置调用dwr后返回数据获取
    storeId:null,
    initComponent : function() {
        this.queryMode='local';//查询模式本地
        if(!this.dwrMethod){
            Ext.Msg.alert("错误提示：","未指定dwrMethod属性配置");
            return;
        }
        var data=[];
        var datap=this.dataProterty;
        var p=[];
        if(this.param){
            if(this.param instanceof Array){
                p=p.concat(this.param);
            }else{
                p.push(this.param);
            }
            
        }
        p.push(function(rst){
                    if (rst) {
                        if(datap){data=rst[datap]}else{data=rst}
                    }});
        DWREngine.setAsync(false);
        this.dwrMethod.apply(this,p);
        DWREngine.setAsync(true);
        var text="{"+this.displayField+"}";
        if(this.allowExtShow){
            for(j=0;j<this.extField.length;j++){
                if('desc'==this.extFieldSort){
                    text="{"+this.extField[j]+"}"+this.delimiter+text
                }else{
                    text=text+this.delimiter+"{"+this.extField[j]+"}"
                }
            }
        }
        this.tpl=Ext.create('Ext.XTemplate',
                '<tpl for=".">',
                    '<div class="x-boundlist-item">'+text+'</div>',
                '</tpl>'
           );
        this.displayTpl=Ext.create('Ext.XTemplate',
                '<tpl for=".">',
                text,
                '</tpl>'
            );
        this.listeners=this.listeners||{};
        Ext.applyIf(this.listeners,{'blur':function(comb){
            if(!comb.value){
                comb.setValue([]);
            }
        }});
        if(this.fixedData.length>0){
            data.reverse();//数据倒置
            data=data.concat(this.fixedData);//增加固定数据
            data.reverse();//数据顺序还原
        }
        var fields=this.extField;
        fields.push(this.valueField);
        fields.push(this.displayField);
        if(this.storeId){
            this.store=Ext.create('Ext.data.Store', {
                id : this.storeId,
                fields: fields,
                data : data
            });   
        }else{
           this.store=Ext.create('Ext.data.Store', {
                fields: fields,
                data : data
            });   
        }
        this.listeners=this.listeners||{};
        if(this.selected){
            Ext.apply(this.listeners,{'select':this.selected});
        }
        Ext.apply(this.listeners,{'beforequery':function(e){//模糊匹配查询,替代原只匹配开头 
            var combo = e.combo;    
            if(!e.forceAll){    
                var input = e.query;    
                // 检索的正则  
                var regExp = new RegExp(".*" + input.replace(/[^\w\u4e00-\u9fa5]\-/g,'') + ".*");  
                // 执行检索  
                combo.store.filterBy(function(record,id){
                    var retBoo = false;
                    // 得到每个record的项目名称值  
                    var text = record.get(combo.displayField);
                    retBoo = regExp.test(text);    
                    if(combo.allowExtShow){//如果启用拓展字段
                        for(j=0;j<combo.extField.length;j++){
                            var texttemp = record.get(combo.extField[j]);
                            if(regExp.test(texttemp)){//拓展字段也同时匹配
                                retBoo = true;
                            } 
                        }
                    }
                    return retBoo;   
                });
                combo.expand();    
                return false;  
            }
            if(!combo.getValue()){
                combo.store.clearFilter();
            }
        }});
        Ext.ux.DcmsCustom.superclass.initComponent.call(this);
    }
  });