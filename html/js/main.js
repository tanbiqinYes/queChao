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

		termPosition();
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

 		shopName.focus();
 		termPosition();
 	});
/*
	标题定位到屏幕上方
 */
 	var termPosition = function(){
 		var shopInfo = $(".shopInfo");
 		var shopInfoH = shopInfo.height();
		var shopInfoPositionTop = shopInfo.offset().top - $(window).scrollTop();
 		var shopInfoD = shopInfoPositionTop + shopInfoH;
 		console.log("top:" + shopInfoPositionTop + ";差值：" + shopInfoD);
 		//
 		var distrPositionH = $(".distributionInfo").height();
 		var distrPositionTop = shopInfoD + 8;
 		var distrPositionD = distrPositionTop + distrPositionH;
 		//
 		var storeDecorationH = $(".storeDecoration").height();
 		var storeDecorationTop = distrPositionD + 8;
 		var storeDecorationD = storeDecorationTop + storeDecorationH;
 		//
 		var dFoodPositionH = $(".dogFoodPosition").height();
 		var dFoodPositionTop = storeDecorationD + 8;
 		var dFoodPositionD = dFoodPositionTop + dFoodPositionH;
 		//
 		var cFoodPositionH = $(".catFoodPosition").height();
 		var cFoodPositionTop = dFoodPositionD + 8;
 		var cFoodPositionD = cFoodPositionTop + cFoodPositionH;
 		//
 		var cwFoodPositionH = $(".catWetFoodPosition").height();
 		var cwFoodPositionTop = cFoodPositionD + 8;
 		var cwFoodPositionD = cwFoodPositionTop + cwFoodPositionH;
 		//
 		var storeFeedbackH = $(".storeFeedback").height();
 		var storeFeedbackTop = cwFoodPositionD + 8;
 		var storeFeedbackD = storeFeedbackTop + storeFeedbackH;

		if (shopInfoPositionTop <= 0 && shopInfoD >= 50) {
			$(".showTitle").addClass("show").children(".title").html('一、店铺基本信息');
		}else if(distrPositionTop <= 0 && distrPositionD >=50){
			$(".showTitle").addClass("show").children(".title").html('二、铺货信息');
		}else if(storeDecorationTop <= 0 && storeDecorationD >=50){
			$(".showTitle").addClass("show").children(".title").html('三、门店装饰');
		}else if(dFoodPositionTop <= 0 && dFoodPositionD >=50){
			$(".showTitle").addClass("show").children(".title").html('四、犬干粮区货架布置');
		}else if(cFoodPositionTop <= 0 && cFoodPositionD >=50){
			$(".showTitle").addClass("show").children(".title").html('五、猫干粮区货架布置');
		}else if(cwFoodPositionTop <= 0 && cwFoodPositionD >=50){
			$(".showTitle").addClass("show").children(".title").html('六、猫干粮区货架布置');
		}else if(storeFeedbackTop <= 0 && storeFeedbackD >=50){
			$(".showTitle").addClass("show").children(".title").html('七、店铺反馈');
		}else{
			$(".showTitle").removeClass("show").children(".title").html('');
		}
 	};

	$("#container .wrapper").on("touchend", function(event){
			termPosition();
	});                      
 	
});