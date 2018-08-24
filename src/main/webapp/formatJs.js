// 合同年结
function carryoverCont(){
    var r = confirm("确认进行合同结转?");
    if(r == true){
        SalesContractRegisterDao.carryover(function(map){
            alert(map.msg);
        });
    } else{
        return;
    }
}
