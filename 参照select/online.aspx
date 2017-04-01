<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" Codebehind="online.aspx.cs"
    Inherits="CCWOnline.Management.Web.Apps.solution.online" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>在线预约申请-爱普生(中国)有限公司</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
    <!-- css -->
    <link href="/common/Style/css/core.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="/common/Style/css/core_applyForm.css">
    <link href="/common/Style/css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="/common/Style/css/swiper.css">

    <script src="/common/Style/js/jquery-1.8.2.min.js"></script>

    <script type="text/javascript">
        $(function(){

            //var $check = $(".select_box[name='applyDate']").find(".option a");
            $(".select_box[name='applyDate']").on("click", ".option a", function(){
                $(".select_box[name='applyTime']").find(".select_txt span").html("请选择");
                //console.log($(this).html());
                var myApplyTime = $(".select_box[name='applyTime']").find(".option");
                var myApplyTimeJson;
                $.ajax({
                    url: '/apps/solution/Handler.ashx',
                    type: "POST",
                    data: { value: $("#date").val() },
                    success: function (data) {
                        //console.log(data);
                        myApplyTimeJson = data;
                        //console.log(myApplyTimeJson);
                        myApplyTime.html(myApplyTimeJson);
                    }
                })
            })

        });
    </script>

    <script>
        $(function(){
            $(".careProducts").find("span").on("click", function(){
                $(this).siblings("input").removeAttr("disabled");
                //console.log($(this));
                if($(this).hasClass("checkBox_show")){
                    $(this).siblings("input").attr("disabled", "disabled")
                }
                else{
                    $(this).siblings("input").removeAttr("disabled");
                }
            });
        })
    </script>

    <!--#include virtual="/Apps/includes/Grid.inc" -->
</head>
<body>
    <div class="container">
        <div class="wrapper">
            <!--header start-->
            <!--#include virtual="../includes/newheader.inc" -->
            <!--header end-->
            <!--banner end-->
            <!--middleNav start-->
            <div class="middleNavWrapper">
                <ul class="middleNav">
                    <li><a href="/" class="middleNav">爱普生中国</a></li>
                    <li class="middleNav">&nbsp; &gt; &nbsp;</li>
                    <li><a href="/Apps/buy/index.aspx" class="middleNav">购买指南</a></li>
                    <li class="middleNav">&nbsp; &gt; &nbsp;</li>
                    <li><a href="javascript:void(0);" class="middleNav middleNav_active">爱普生行业方案体验中心</a></li>
                </ul>
            </div>
            <!--middleNav end-->
            <!--applyForm start-->
            <div class="applyForm_wrapper">
                <h2>
                    在线预约申请</h2>
                <form id="myForm" name="myForm" runat="server">
                    <div class="mainApplyInfo">
                        <ul class="clear">
                            <li class="choiceDate">
                                <div class="applyTitle ">
                                    <span>*</span>参观时间：
                                </div>
                                <div class="applyInfos ">
                                    <div class="select_box" name="applyDate" type="selectbox">
                                        <div class="select_txt">
                                            <span>请选择</span>
                                            <input runat="server" class="order_time" id="date" name="date" value="" type="hidden" />
                                        </div>
                                        <div class="option" style="display: none;">
                                            <% =dateHTML %>
                                        </div>
                                    </div>
                                    <%--<div class="date_wrap">
                                        <asp:DropDownList ID="ddldate" runat="server" CssClass="date_com">
                                        </asp:DropDownList>
                                        <input id="date" name="date" runat="server" class="date_com" type="text" value="" />
                                    </div>--%>
                                    <div class="select_box" name="applyTime" type="selectbox">
                                        <div class="select_txt">
                                            <span>请选择</span>
                                            <input runat="server" class="order_time" id="order_time" name="order_time" value=""
                                                type="hidden" />
                                        </div>
                                        <div class="option" style="display: none;" id="divHour">
                                        </div>
                                    </div>
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li>
                                <div class="applyTitle ">
                                    <span>*</span>地点：
                                </div>
                                <div class="applyInfos ">
                                    <div class="select_box select_address">
                                        <div class="select_txt">
                                            <span>请选择</span>
                                            <input runat="server" id="orderAddress" class="order_city" name="orderAddress" value=""
                                                type="hidden" />
                                        </div>
                                        <div class="option" style="display: none;">
                                            <a>北京方案体验中心</a> <a>上海方案体验中心</a> <a>广州方案体验中心</a> <a>杭州方案体验中心</a> <a>沈阳方案体验中心</a>
                                            <a>成都方案体验中心</a> <a>西安方案体验中心</a> <a>武汉方案体验中心</a> <a>济南方案体验中心</a><a>重庆方案体验中心</a><a>南京方案体验中心</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li class="shuXing">
                                <div class="applyTitle ">
                                    <span>*</span>预约个人属性：
                                </div>
                                <div class="applyInfos ">
                                    <ul class="radio_options">
                                        <li><span class="radio_eo personal radio_show">
                                            <input runat="server" type="radio" id="hobby_1" name="hobby_1" value="个人用户" />
                                        </span>
                                            <label for="hobby_11">
                                                个人用户</label>
                                        </li>
                                        <li><span class="radio_eo orderCompany ">
                                            <input runat="server" type="radio" id="hobby_2" name="hobby_1" value="公司用户" />
                                        </span>
                                            <label>
                                                公司用户</label>
                                        </li>
                                        <li class="jxs"><span class="radio_eo newAdd ">
                                            <input runat="server" type="radio" id="hobby_03" name="hobby_1" value="经销商" />
                                        </span>
                                            <label>
                                                经销商</label>
                                        </li>
                                        <li class="epson"><span class="radio_eo newAdd ">
                                            <input runat="server" type="radio" id="hobby_04" name="hobby_1" value="爱普生员工" />
                                        </span>
                                            <label>
                                                爱普生员工</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li>
                                <div class="applyTitle ">
                                    <span>*</span>预约人：
                                </div>
                                <div class="applyInfos ">
                                    <input runat="server" id="orderPerson" name="orderPerson" value="" />
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li class="orderPersonCom" style="display: none;">
                                <div class="applyTitle ">
                                    <span>*</span>预约人公司/部门名称：
                                </div>
                                <div class="applyInfos ">
                                    <input runat="server" id="orderPersonCom" name="orderPersonCom" value="" />
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li class="attendPersonName" style="display: none;">
                                <div class="applyTitle ">
                                    <span>*</span>参观人员：
                                </div>
                                <div class="applyInfos ">
                                    <input runat="server" id="attendPersonName" name="attendPersonName" value="" />
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li class="attendPersonComName" style="display: none;">
                                <div class="applyTitle ">
                                    <span>*</span>参观人员公司名称：
                                </div>
                                <div class="applyInfos ">
                                    <input runat="server" id="attendPersonComName" name="attendPersonComName" value="" />
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li class="orderCompanyName">
                                <div class="applyTitle ">
                                    公司名称：
                                </div>
                                <div class="applyInfos ">
                                    <input id="orderCompanyName" name="orderCompanyName" runat="server" />
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li class="HangYe" id="SuoShuHangYe" style="display: block;">
                                <div class="applyTitle ">
                                    <span>*</span>所属行业：
                                </div>
                                <div class="applyInfos ">
                                    <div class="select_box select_address">
                                        <div class="select_txt">
                                            <span>请选择</span>
                                            <input runat="server" id="orderHangYe" class="order_city" name="orderHangYe" value=""
                                                type="hidden" />
                                        </div>
                                        <div class="option" style="display: none;">
                                            <a>企业</a> <a>金融</a> <a>医疗</a> <a>政府</a> <a>教育</a> <a>影像</a> <a>印刷</a> <a>生产物流</a>
                                            <a>餐饮零售</a> <a>制造</a> <a>家用</a> <a>其他</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li>
                                <div class="applyTitle ">
                                    <span>*</span>参观人数：
                                </div>
                                <div class="applyInfos ">
                                    <input runat="server" id="orderNum" name="orderNum" value="" />
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li class="phone">
                                <div class="applyTitle ">
                                    <span>*</span>联系电话：
                                </div>
                                <div class="applyInfos ">
                                    <ul class="radio_options">
                                        <li><span class="radio_eo orderSJ radio_show">
                                            <input runat="server" type="radio" id="hobby_mobile" name="hobby_2" value="手机" />
                                        </span>
                                            <label for="hobby_11">
                                                手机</label>
                                        </li>
                                        <li><span class="radio_eo orderZJ ">
                                            <input runat="server" type="radio" id="hobby_zj" name="hobby_2" value="座机" />
                                        </span>
                                            <label>
                                                座机</label>
                                        </li>
                                    </ul>
                                    <div class="phone_wrap" id="ZuoJi">
                                        <input runat="server" id="order_phone" name="order_phone" value="" class="zj" />
                                        <input runat="server" id="order_short_phone" name="order_short_phone" value="分机号"
                                            placeholder="分机号" class="zj" />
                                    </div>
                                    <input runat="server" id="orderMobile" name="orderMobile" value="" class="sj" />
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li>
                                <div class="applyTitle ">
                                    <span>*</span>电子邮箱：
                                </div>
                                <div class="applyInfos ">
                                    <input runat="server" id="orderEmail" name="orderEmail" value="" />
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li class="products">
                                <div class="applyTitle ">
                                    <span>*</span>关注产品类别：
                                </div>
                                <div class="applyInfos ">
                                    <ul class="careProducts checkBox_options">
                                        <li><span>
                                            <input value="喷墨打印机/一体机" type="checkbox" name="hobby"></span>
                                            <label>
                                                喷墨打印机/一体机</label>
                                            <input class="productType" name="hobbyp0" id="hobbyp0" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                        <li><span>
                                            <input value="墨仓式<sup>&reg;</sup>打印机/一体机" type="checkbox" name="hobby"></span>
                                            <label>
                                                墨仓式<sup>&reg;</sup>打印机/一体机</label>
                                            <input class="productType" name="hobbyp1" id="hobbyp1" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                        <li><span>
                                            <input value="工业标签打印机" type="checkbox" name="hobby"></span>
                                            <label>
                                                工业标签打印机</label>
                                            <input class="productType" name="hobbyp2" id="hobbyp2" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                        <li><span>
                                            <input value="大幅面打印机" type="checkbox" name="hobby"></span>
                                            <label>
                                                大幅面打印机</label>
                                            <input class="productType" name="hobbyp3" id="hobbyp3" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                        <li><span>
                                            <input value="针式打印机" type="checkbox" name="hobby"></span>
                                            <label>
                                                针式打印机</label>
                                            <input class="productType" name="hobbyp4" id="hobbyp4" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                        <li><span>
                                            <input value="微型打印机" type="checkbox" name="hobby"></span>
                                            <label>
                                                微型打印机</label>
                                            <input class="productType" name="hobbyp5" id="hobbyp5" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                        <li><span>
                                            <input value="标签打印机" type="checkbox" name="hobby"></span>
                                            <label>
                                                标签打印机</label>
                                            <input class="productType" name="hobbyp6" id="hobbyp6" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                        <li><span>
                                            <input value="扫描仪" type="checkbox" name="hobby"></span>
                                            <label>
                                                扫描仪</label>
                                            <input class="productType" name="hobbyp7" id="hobbyp7" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                        <li><span>
                                            <input value="投影仪" type="checkbox" name="hobby"></span>
                                            <label>
                                                投影仪</label>
                                            <input class="productType" name="hobbyp8" id="hobbyp8" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                        <li><span>
                                            <input value="机器人" type="checkbox" name="hobby"></span>
                                            <label>
                                                机器人</label>
                                            <input class="productType" name="hobbyp9" id="hobbyp9" type="text" placeholder="请输入产品型号"
                                                disabled="disabled" />
                                        </li>
                                    </ul>
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                            <li class="extraNeeds">
                                <div class="applyTitle ">
                                    参观目的及需求：
                                </div>
                                <div class="applyInfos">
                                    <textarea runat="server" id="applyTitle" name="applyTitle"></textarea>
                                </div>
                                <div class="clearFix">
                                </div>
                            </li>
                        </ul>
                        <div class="btn">
                            <%--<asp:Button id="submitOrder" Text="提交" runat="server" OnClick="submitOrder_Click"/>--%>
                            <%--<asp:LinkButton ID="submitOrder" runat="server" OnClick="submitOrder_Click" >提交</asp:LinkButton>--%>
                            <%--<button type="button" >
                                提交</button>--%>
                            <input type="submit" id="submitOrder" runat="server" value="提交" />
                            <button type="reset">
                                重置</button>
                        </div>
                    </div>
                </form>
            </div>
            <!--applyForm end-->
            <!--~!~-->
            <!--footer start-->
            <!--#include virtual="../includes/newfooter.inc" -->
            <!--footer end-->
            <div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
            </div>
        </div>
    </div>
    <!-- javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <script src="/common/Style/js/jQuery.resizeEnd.min.js"></script>

    <script src="/common/Style/js/imagesloaded.pkgd.min.js"></script>

    <script src="/common/Style/js/iscroll.js"></script>

    <script src="/common/Style/js/idangerous.swiper.min.js"></script>

    <script src="/common/Style/js/main.js"></script>

    <script src="/common/Style/js/jquery-ui.js"></script>

    <script src="/common/Style/js/ui-Date.js"></script>

    <script type="text/javascript" src="/common/Style/js/selcet.js"></script>

</body>
</html>
