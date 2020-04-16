<!DOCTYPE html>
<html>
<head>
    <title>版本管理</title>
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
                    </form>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="table" class="table table-bordered">
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

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.init = function () {
            $table.bootstrapTable({
                url: '${ctx}/admin/parkinglot/aboutUs/list',         //请求后台的URL（*）
                method: 'post',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                // striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
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
                columns: [
                    {
                        field: 'content',
                        title: '内容'
                    },
                    {
                        field: 'createTime',
                        title: '创建时间',
                        formatter : function(value, row, index) {
                            return dateFormatWithoutHHS(value);
                        }
                    },
                    {
                        field: 'operation',
                        title: '操作',
                        width: 200,
                        align: "center",
                        formatter: function (value, row, index) {
                            var e = '[@shiro.hasPermission name="system:aboutUs:update"]' + '<a class="btn btn-primary btn-xs" href="#" title="修改" onclick="edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>修改</a> ' + '[/@shiro.hasPermission]';
                            return e;
                        }
                    }
                ]
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
                }
            };
            return temp;
        };
        return oTableInit;
    };

    var ButtonInit = function () {
        var oInit = new Object();
        oInit.init = function () {
            //初始化页面上面的按钮事件
        };
        return oInit;
    };

    function refresh(){
        $table.bootstrapTable('refresh');
    }

    function edit(id) {
        layer.open({
            type: 2,
            title: '修改内容',
            shadeClose: false, //点击遮罩关闭层
            area: ['500px', '300px'],
            content: '${ctx}/admin/parkinglot/aboutUs/update/'+id
        });
    }
</script>
</html>