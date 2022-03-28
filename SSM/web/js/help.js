function doPost(to, p) {  // to:提交动作（action）,p:参数
    var myForm = document.createElement("form");
    myForm.method = "post";
    myForm.action = to;
    for (var i in p) {
        var myInput = document.createElement("input");
        myInput.setAttribute("name", i);  // 为input对象设置name
        myInput.setAttribute("value", p[i]);  // 为input对象设置value
        myForm.appendChild(myInput);
    }
    document.body.appendChild(myForm);
    myForm.submit();
    document.body.removeChild(myForm);  // 提交后移除创建的form
}
function ajaxPost(names,data,url,paconpath) {
    var bt=names+"";
    var num=Math.floor(Math.random()*1000000);
    var ErrId=names+num+"Error";
    $(data).siblings().remove("span[id^="+names+"][id$='Error']");
    $(data).prev().after("<span class='form-control-static' id='"+ErrId+"'></span>")
    $.ajax(
        {
            url:paconpath+"/guan/"+url,
            type:"post",
            async:true,
            data:bt+'='+$(data).val()+'',
            success:function (data) {
                var Da=JSON.parse(data);
                if(Da.start=="200"){
                    $("#"+ErrId).css({
                        color:'green',
                    })
                }else{
                    $("#"+ErrId).css({
                        color:'red'
                    })
                }
                $("#"+ErrId).html(Da.test);
            },
            error:function (error) {
                console.log(error)
            }
        }
    )
    console.log(name,$(data).val());
}

function f() {

}