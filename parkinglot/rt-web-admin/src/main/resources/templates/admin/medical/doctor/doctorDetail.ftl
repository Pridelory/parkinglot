[#include "/commons/include.form_rec.ftl"]
<div class="container">
    <form class="form-horizontal" id="form" method="post"  enctype="multipart/form-data" action="">
        <div class="row">
            <div class="box-body">
                [#include "/admin/doctor/form.ftl"/]
                <div class="row no-print footer">
                    <div class="col-xs-12" style="text-align: center">
                        [#--<button type="button" class="btn btn-primary" onclick="T.save($form)" style="margin-right: 5px;">确定</button>--]
                        [#--<button type="button" class="btn btn-default" onclick="T.close()" >取消</button>--]
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${ctx}/assets/plugins/My97DatePicker/WdatePicker.js" ></script>
<script>
    var $form = $("#form");
    $(function(){
        T.valid($form);
    })

    //时间插件
    $('.timepicker').datetimepicker({
        language: 'zh',
        format: 'yyyy-mm-dd',//显示格式
        todayHighlight: 1,//今天高亮
        minView: "month",//设置只显示到月份
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        autoclose: 1//选择后自动关闭
    });

    //日期回显
    $("#entStartDate").datetimepicker('update','${activity.entStartDate!}');
    $("#entEndDate").datetimepicker('update','${activity.entEndDate!}');
    $("#startDate").datetimepicker('update','${activity.startDate!}');
    $("#endDate").datetimepicker('update','${activity.endDate!}');


</script>
