<!DOCTYPE html>
<html>
<head>
    <title>医生管理</title>
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
                        <label>医生姓名:</label>&nbsp;&nbsp;
                        <input style="width:180px" type="text" name="name" id="name" placeholder="医生姓名" class="input-small form-control">&nbsp;&nbsp;
                        [#--<label>所属医院:</label>&nbsp;&nbsp;--]
                        [#--<input style="width:180px" type="text" name="hospital" id="hospital" placeholder="所属医院" class="input-small form-control">&nbsp;&nbsp;--]
                        [#--<label>所属科室:</label>&nbsp;&nbsp;--]
                        [#--<input style="width:180px" type="text" name="department" id="department" placeholder="所属科室" class="input-small form-control">&nbsp;&nbsp;--]
                        <label>职位:</label>&nbsp;&nbsp;
                        <select id="position" name="position" class="form-control">
                            <option value="">全部</option>
                            <option value="0">主任医师</option>
                            <option value="1">副主任医师</option>
                            <option value="2">主治医师</option>
                        </select>
                        [#--<input style="width:180px" type="text" name="position" id="position" placeholder="职位" class="input-small form-control">&nbsp;&nbsp;--]
                        &nbsp;&nbsp;
                        <button type="button" onclick="refresh();" class="btn btn-primary ">搜索</button>
                    </form>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div id="toolbar" class="btn-group">
                          [@shiro.hasPermission name="system:doctor:add"]
                              <button class="btn btn-success " type="button" onclick="add();"><i class="fa fa-plus"></i>&nbsp;添加
                              </button>
                          [/@shiro.hasPermission]
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
                url: '${ctx}/admin/parkinglot/doctor/list',         //请求后台的URL（*）
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
                        title: '医生姓名'
                    },
                    {
                        field: 'birthday',
                        title: '生日',
                        formatter : function(value, row, index) {
                            return dateFormatWithoutHHS(value);
                        }
                    },
                    {
                        field: 'hospital',
                        title: '医院'
                    },
                    {
                        field: 'department',
                        title: '任职科室'
                    },
                    {
                        field: 'position',
                        title: '职位',
                        formatter: function (value, row, index) {
                            if (value == '0') {
                                return "主任医师"
                            } else if (value == '1') {
                                return "副主任医师"
                            } else if (value == '2') {
                                return "主治医师"
                            }
                        }
                    },
                    {
                        field: 'mobile',
                        title: '联系方式'
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
                        // width: 150,
                        align: "center",
                        formatter: function (value, row, index) {
                            var join = "";
                            var edit = '[@shiro.hasPermission name="system:doctor:update"]'+'<a class="btn btn-primary btn-xs" href="#" mce_href="#" title="编辑" onclick="update(\'' + row.id + '\')"><i class="fa fa-pencil"></i>&nbsp;编辑</a> ' + '[/@shiro.hasPermission]';
                            var detail = '<a class="btn btn-primary btn-xs" href="#" mce_href="#" title="详情" onclick="detail(\'' + row.id + '\')"><i class="fa fa-pencil"></i>&nbsp;详情</a> ';
                            join = detail + edit;
                            return join;
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
                    hospital: $("#hospital").val(),
                    department: $("#department").val(),
                    position: $("#position").val()
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
     * 添加
     */
    function add() {
        layer.open({
            type: 2,
            title: '添加医生信息',
            shadeClose: false, //点击遮罩关闭层
            area: [$(this).width() + 'px', $(this).height() + 'px'],
            content: '${ctx}/admin/parkinglot/doctor/add'
        });
    }

    /**
     * 医生详情信息
     *
     * @param id
     */
    function detail(id) {
        layer.open({
            type: 2,
            title: '医生详情信息',
            shadeClose: false, //点击遮罩关闭层
            area: [$(this).width() + 'px', $(this).height() + 'px'],
            content: '${ctx}/admin/parkinglot/doctor/detail/'+id
        });
    }

    /**
     * 医生更新页面
     *
     *  @param id
     */
    function update(id) {
        layer.open({
            type: 2,
            title: '医生详情信息',
            shadeClose: false, //点击遮罩关闭层
            area: [$(this).width() + 'px', $(this).height() + 'px'],
            content: '${ctx}/admin/parkinglot/doctor/update/'+id
        });
    }

    [#--/**--]
     [#--* 对应活动的报名人员信息查看--]
     [#--* @param id--]
     [#--*/--]
    [#--function enrolledMember(id) {--]
        [#--layer.open({--]
            [#--type: 2,--]
            [#--title: '活动报名人员信息',--]
            [#--shadeClose: false, //点击遮罩关闭层--]
            [#--area: [$(this).width() + 'px', $(this).height() + 'px'],--]
            [#--content: '${ctx}/admin/course/activityEnroll/index/'+id--]
        [#--});--]
    [#--}--]
</script>
</html>