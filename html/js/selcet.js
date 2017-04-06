//radio和checkBox的初始化
function init_checkbox(checkbox_Pic)
{	
	//checkbox
	var check_span=[];
	var check_input=[];
	//var check_li = document.getElementById(checkbox_Pic).getElementsByTagName("li");
	var check_li = $("."+checkbox_Pic+" li");
	
	for (var i=0; i<check_li.length; i++)
	{
		check_span[i] = check_li[i].getElementsByTagName("span").item(0);
		check_input[i] = check_span[i].getElementsByTagName("input").item(0);
		check_span[i].index= i;
		check_input[i].index=i;
		check_span[i].onclick=check_input[i].onclick = function()
		{
			if (check_input[this.index].checked == true)
			{
				check_input[this.index].checked = false;	
				check_span[this.index].className="checkBox_hidden";
			}
			else
			{
				check_input[this.index].checked = true;
				check_span[this.index].className="checkBox_show";
			}
		};
		
	}
}

function init_radio(radio_Pic)
{	
	//radio
	var radio_span=[];
	var radio_input=[];
	//var radio_li = document.getElementById(radio_Pic).getElementsByTagName("li");
	var radio_li = $("."+radio_Pic+" li");
	for (var i=0; i<radio_li.length; i++)
	{
		radio_span[i] = radio_li[i].getElementsByTagName("span").item(0);
		radio_input[i] = radio_span[i].getElementsByTagName("input").item(0);
		radio_span[i].index= i;
		radio_input[i].index=i;
		
		radio_span[i].onclick=radio_input[i].onclick = function()
		{
			radio_empty(this);
			radio_input[this.index].checked = true;
			radio_span[this.index].className="radio_show";
		};	
	}
	
	
}
function radio_empty(_this){
	var name = $(_this).find("input").attr("name");
	$("input[name="+name+"]").parent().removeClass("radio_show").addClass("radio_hidden");
	
	
}
/*赋值给input*/
$(".radio_eo").click(function(){
	 var value = $(this).siblings("label").text();
	$(this).children("input").val(value);
	$(this).parent("li").siblings("li").children("span").children("input").val("");

});

//选择个人的情况
$(".personal, .orderCompany").click(function(){
	$(".orderPersonCom").hide();
	$(".attendPersonName").hide();
	$(".attendPersonComName").hide();
	$(".orderCompanyName").show();
	//$(".HangYe").hide();
	//$(".orderCompanyName").hide();
		
});
$(".newAdd").click(function(){
	$(".orderPersonCom").show();
	$(".attendPersonName").show();
	$(".attendPersonComName").show();
	$(".orderCompanyName").hide();
	//$(".HangYe").show();
	//$(".orderCompanyName").show();	
});

//选择手机的情况

$(".orderZJ").click(function(){
	$("#orderMobile").hide();
	$(".phone_wrap").show();
	$('.phone').addClass('phone_pc');	
})
$(".orderSJ").click(function(){
	$("#orderMobile").show();
	$(".phone_wrap").hide();
	$('.phone').removeClass('phone_pc');	
});


function init_select(select_box)
{
	//自制select
                    var taotao = [];
					for (i = 0; i < $("."+select_box).length; i++)
					{
						taotao[i] = 1;
					}
					$("."+select_box).each(function(index,el){
                    $(this).click(function (event) {
                        event.stopPropagation();
                        if (taotao[index] == 1) {
							$('.option').hide();
                            $(this).children(".option").show();
                            taotao[index] = 2;
                        }
                        else {
                            $(".option").hide();
                            taotao[index] = 1;
                        }
                        

                    });
					});
                    $(document).click(function (event) {
                        var eo = $(event.target);
                        if ($(".option").is(":visible") && eo.attr("class") != "option" && !eo.parent(".option").length) {
                            $('.option').hide();
							for (i = 0; i < $("."+select_box).length; i++)
							{
								taotao[i] = 1;
							}
                        }
                    });
                    /*赋值给文本框*/
                   // $("."+select_box+" .option a").click(function () {
                    $("."+select_box+" ").on("click",".option a", function(){


                        var value = $(this).text();
                       // if (!googleQueryModified) {
                        //    $("#input_BoxFirst").attr("value", 'Search ' + value);
                         //   $("#input_BoxFirst").css("color", "gray");
                           // alert($("#input_BoxFirst").val());
                       // }

                        $(this).parent().siblings(".select_txt").children("span").text(value);
						$(this).parent().siblings(".select_txt").children("input").val(value);
                        //$("#select_value").val(value)
                    })

}
//------------验证表单
$(function(){
	init_radio("radio_options");
	init_checkbox("checkBox_options");
	init_select("select_box");
   
   
   $(function(){
	   $("#submitOrder").click(function(){
		   if($(".order_time").val() == ""){
		   		alert('请选择参观时间！');
				$('.select_txt').focus();
				 return false;
		   }else if($("#orderAddress").val() == ""){
				  alert('请选择参观地点！');
				 return false;
			}else if($("#orderHangYe").val() == "" && $("#SuoShuHangYe").is(":visible")){
				alert('请选择所属行业！');
				return false;
			}else if($("#orderPerson").val() == ""){
				alert('请填写预约人姓名！');
				$("#orderPerson").focus();
				return false;
			}else if($("#order_phone").val() == "" && $("#order_phone").is(":visible")){
				alert('请填写座机号！');
				$("#order_phone").focus();
				return false;
			}else if(!$("#order_phone").val().match(/^([0-9]{3,4}-)?[0-9]{7,8}$/) && $("#order_phone").is(":visible")){
				alert('这不是一个正确的电话号码，请重新输入！');
				$("#order_phone").focus();
				return false;
			}else if(!$("#order_short_phone").val().match(/^(\[0-9]{1,4})$/) && $("#order_short_phone").is(":visible") && !$("#order_short_phone").val()=="" && !$("#order_short_phone").val() =="分机号"){
				alert('这不是一个正确的分机号码，请重新输入四位数分机号！');
				$("#order_short_phone").focus();
				return false;
			}else if($("#orderMobile").val() == "" && $("#orderMobile").is(":visible") ){
				alert('请填写手机号！');
				$("#orderMobile").focus();
				return false;
			}else if(!$("#orderMobile").val().match(/^(13[0-9]|14[0-9]|15[0-9]|17[0-9]|18[0-9])\d{8}$/) && $("#orderMobile").is(":visible")){
				alert('这不是一个正确的手机号，请重新输入！');
				$("#orderMobile").focus();
				return false;
			}else if($("#orderEmail").val() == ""){
				alert('请填写电子邮箱！');
				$("#orderEmail").focus();
				return false;
			}else if (!$("#orderEmail").val().match(/^[a-zA-Z0-9\._-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/)){
				alert("这不是一个正确的Email地址，请重新输入！");
				$("#orderEmail").focus();
				return false;				
			}else if($("#orderNum").val() == ""){
				alert('请填写参观人数！');
				$("#orderNum").focus();
				return false;
			}else if($("#orderNum").val() == ""){
				alert('请填写参观人数！');
				$("#orderNum").focus();
				return false;
			}else if(!$(".careProducts").children('li').children('span').hasClass("checkBox_show")){
				alert('请选择关注产品类别！');
				$("#orderNum").focus();
				return false;
			}else{
				
				$('#myForm').submit();
			}
		 });
		 
	});
 

 
});

<!--关闭页面-->
 
  $("#closeBtn").click(function(){
	var userAgent = navigator.userAgent;
	if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") !=-1) {
		
	//window.close();
	   window.location.href="/apps/solution/index.aspx";
	} else if(confirm("您确定要关闭本页吗？")) {
	   window.opener = null;
	   window.open("", "_self");
	   window.close();
	};
	});
	
	
	$(':reset').click(function(){
		
		$('.select_txt').children('span').html('请选择');	
		$('.checkBox_options').children('li').children('span').removeClass('checkBox_show');
		
		
	})
	   
