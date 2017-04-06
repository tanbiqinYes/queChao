$(function(){
/*
验证表单
 */
 	var shopName =$('input[name="shopName"]');
 	var eDMSCode =$('input[name="eDMSCode"]');
 	var visitDate =$('input[name="visitDate"]');
 	var city =$('input[name="city"]');
 	var respondentsName =$('input[name="respondentsName"]');
 	var position =$('input[name="position"]');
 	var visitorName =$('input[name="visitorName"]');
 	$(".submit").on("click", function(){
		if($.trim(shopName.val()) === ''){
			alert("店铺名称不能为空");
			shopName.focus();
		}else if ($.trim(eDMSCode.val()) === '') {
			alert("eDMS 编码不能为空");
			eDMSCode.focus();
		}else if ($.trim(visitDate.val()) === '') {
			alert("拜访日期不能为空");
			visitDate.focus();
		}else if ($.trim(city.val()) === '') {
			alert("所属大区/城市不能为空");
			city.focus();
		}else if ($.trim(respondentsName.val()) === '') {
			alert("店铺受访人姓名不能为空");
			respondentsName.focus();
		}else if ($.trim(position.val()) === '') {
			alert("职务为空");
			position.focus();
		}else if ($.trim(visitorName.val()) === '') {
			alert("拜访人姓名不能为空");
			visitorName.focus();
		}else{
			window.location.href = './QRCode.html';
		}
 	});
 /*
 折叠事件
  */
	$(".primaryInfo .title").on("click", function(){
		$(this).toggleClass("active");
		$(this).next(".shopInfoCont").toggleClass("show");
	});
/*
重置事件
 */
 	var requiredFields = $(".mainInfo input");
 	var checkBox = $(".checkBox_options span");
 	var radio_options = $(".radio_options span");
 	var textareas = $(".primaryInfo textarea");
 	var inputs = $(".primaryInfo input");
 	$(".reset").on("click", function(){
 		requiredFields.val('');
 		textareas.val('');
 		inputs.val('');
 		checkBox.removeClass("checkBox_show");
 		radio_options.removeClass("radio_show").addClass("radio_hidden");
 	});
/*
	标题定位到屏幕上方
 */
 	var termPosition = function(){
 		var shopInfo = $(".shopInfo");
 		var shopInfoHeight = shopInfo.height();
		var myPosition = shopInfo.offset();
		var myPositionTop = myPosition.top;
 		var D_value = myPositionTop + shopInfoHeight;
		console.log("差值: " + D_value + ", top: " + myPosition.top); 
		if (myPositionTop <= 0 && D_value >= 0) {
			$(".showTitle").addClass("show");
			console.log("Yes");
		}else{
			$(".showTitle").removeClass("show");
		}
 	};


		
	$("#container").on("touchmove", function(){
			termPosition();
	});                      
 	
});