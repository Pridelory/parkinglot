<!DOCTYPE html>
<html>
<head>
    <title>意见反馈管理</title>
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
                        <label>用户姓名:</label>&nbsp;&nbsp;
                        <input style="width:180px" type="text" name="name" id="name" placeholder="用户姓名" class="input-small form-control">&nbsp;&nbsp;
                        <label>用户类型:</label>&nbsp;&nbsp;
                        <select id="uType" name="uType" class="form-control">
                            <option value="">全部</option>
                            <option value="0">患者</option>
                            <option value="1">医生</option>
                        </select>
                        &nbsp;&nbsp;
                        <button type="button" onclick="refresh();" class="btn btn-primary ">搜索</button>
                    </form>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div id="toolbar" class="btn-group">
                          [#--[@shiro.hasPermission name="system:user:add"]--]
                              [#--<button class="btn btn-success " type="button" onclick="add();"><i class="fa fa-plus"></i>&nbsp;添加--]
                              [#--</button>--]
                          [#--[/@shiro.hasPermission]--]
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
                url: '${ctx}/admin/parkinglot/feedback/list',         //请求后台的URL（*）
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
                        title: '用户姓名'
                    },
                    {
                        field: 'uType',
                        title: '用户类型',
                        formatter : function(value, row, index) {
                            if (row.uType == 0) {
                                return "患者";
                            } else if (row.uType == 1) {
                                return "医生";
                            }
                        }
                    },
                    {
                        field: 'content',
                        title: '反馈内容'
                    },
                    {
                        field: 'createTime',
                        title: '创建时间',
                        formatter : function(value, row, index) {
                            return dateFormatWithoutHHS(value);
                        }
                    },
                    {
                        field: 'content',
                        title: '操作',
                        formatter : function(value, row, index) {
                            var detail = '<a class="btn btn-primary btn-xs" href="#" mce_href="#" title="详情" onclick="detail(\'' + row.id + '\')"><i class="fa fa-pencil"></i>&nbsp;详情</a> ';
                            return detail;
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
                    uType: $("#uType").val()
                }
            };
            return temp;
        };
        return oTableInit;
    };

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
    
</script>
</html>