<!DOCTYPE html>
<html>
<head>
    <title>Parking Lot Management</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    [#include "/commons/include_style.ftl"]
<body>
<!-- Main content -->
<section class="content" >

    <div class="row">
        <div class="col-xs-12">
            <div class="box" >
                <div class="box-header with-border">
                    <form class="form-inline" id="form">
                        <label>name:</label>&nbsp;&nbsp;
                        <input style="width:180px" type="text" name="name" id="name" placeholder="parking lot name" class="input-small form-control">&nbsp;&nbsp;
                        <label>status:</label>&nbsp;&nbsp;
                        <select id="status" name="status" class="form-control">
                            <option value="">all</option>
                            <option value="1">valid</option>
                            <option value="0">invalid</option>
                        </select>
                        &nbsp;&nbsp;
                        <button type="button" onclick="refresh();" class="btn btn-primary ">search</button>
                    </form>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div id="toolbar" class="btn-group">
                    <button class="btn btn-success " type="button" onclick="add();"><i class="fa fa-plus"></i>&nbsp;add parking lot
                    </button>
                    </div>
                    <table id="table"  class="table table-bordered">
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
</section>
</body>
 [#include "/commons/include_js.ftl"]
<!-- Page-Level Scripts -->

<script>
    var $table = $('#table');
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.init();

        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.init();

    });

    var ButtonInit = function () {
        var oInit = new Object();
        var postdata = {};
        oInit.init = function () {
            //初始化页面上面的按钮事件
        };
        return oInit;
    };

    var TableInit = function () {
        var oTableInit = new Object();
        var table;
        //初始化Table
        oTableInit.init = function () {
            $table.bootstrapTable({
                url: '${ctx}/admin/parkinglot/list',         //请求后台的URL（*）
                method: 'post',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                // striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                // contentType : "application/x-www-form-urlencoded",
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                // clickToSelect: true,                //是否启用点击选中行
                // height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                // search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                // showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                // strictSearch: true,
                // cardView: false,                    //是否显示详细视图
                // detailView: false,                   //是否显示父子表
                columns: [
                    {
                        field: 'name',
                        title: 'parking lot name'
                    },
                    {
                        field: 'parkingCount',
                        title: 'parking lot count'
                    },
                    {
                        field: 'status',
                        title: 'status',
                        formatter: function (value, row, index) {

                            var valid = '<span class="badge btn-success">valid</span>';
                            var invalid = '<span class="badge btn-pinterest">invalid</span>';
                            if (value == '0') {
                                return invalid;
                            } else if (value == '1') {
                                return valid;
                            }
                        }
                    },
                    {
                        field: 'createTime',
                        title: 'create time',
                        formatter : function(value, row, index) {
                            return dateFormatWithoutHHS(value);
                        }
                    },
                    {
                        field: 'content',
                        title: 'operation',
                        formatter : function(value, row, index) {
                            var btn1 = '<a class="btn btn-primary btn-xs" href="#" mce_href="#" title="detail" onclick="detail(\'' + row.id + '\')"><i class="fa fa-pencil"></i>&nbsp;detail</a> ';
                            var btn2 = "<button onclick='enableParkingLot(\""+ row.id +"\");' class='btn  btn-xs btn-default '>&nbsp;</i>enable</button>&nbsp;&nbsp;";
                            var btn3 = "<button onclick='disableParkingLot(\""+ row.id +"\");' class='btn  btn-xs btn-default '>&nbsp;</i>disable</button>&nbsp;&nbsp;";
                            if (row.generateStatus == 0) {
                                // 车位未生成
                                return "";
                                // 以下是车位已生成的情况
                            } else if (row.generateStatus == 1 && row.status == 0) {
                                // invalid
                                return btn1 + btn2;
                            } else if (row.generateStatus == 1 && row.status == 1) {
                                // valid
                                return btn1 + btn3;
                            }
                        }
                    }]
            });
        };
        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                // limit: params.limit,   //页面大小
                // offset: params.offset,  //页码
                pageNumber : this.pageNumber,
                pageSize : this.pageSize,
                condition:{
                    name: $("#name").val(),
                    status: $("#status").val()
                }
            };
            return temp;
        };
        return oTableInit;
    };

    /**
     * 添加停车场
     */
    function add() {
        layer.open({
            type: 2,
            title: 'add parking lot',
            shadeClose: false, //点击遮罩关闭层
            area: [$(this).width() + 'px', $(this).height() + 'px'],
            content: '${ctx}/admin/parkinglot/add'
        });
    }

    /**
     * 刷新
     */
    function refresh(){
        $table.bootstrapTable('refresh');
    }

    /**
     * 意见反馈内容
     *
     * @param id
     */
    function detail(id) {
        layer.open({
            type: 2,
            title: '意见反馈内容',
            shadeClose: false, //点击遮罩关闭层
            area: [ 600 + 'px', 400 + 'px'],
            content: '${ctx}/admin/parkinglot/feedback/detail/'+id
        });
    }

    /**
     * 车场上架
     * @param id
     */
    function enableParkingLot(id) {
        $.ajax({
            type: "get",
            url: "${ctx}/admin/parkinglot/enableParkingLot/" + id,
            dataType: 'json',
            success: function (data) {
                if (data.code == 0) {
                    layer.alert("Enable Successfully");
                }
                refresh();
            }
        });
    }

    /**
     * 车场下架
     * @param id
     */
    function disableParkingLot(id) {
        $.ajax({
            type: "get",
            url: "${ctx}/admin/parkinglot/disableParkingLot/" + id,
            dataType: 'json',
            success: function (data) {
                if (data.code == 0) {
                    layer.alert("Disable Successfully");
                }
                refresh();
            }
        });
    }

</script>
</html>