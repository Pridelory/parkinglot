[#include "/commons/include.form_rec.ftl"]
<div class="container">
    <form class="form-horizontal" id="form" method="post" action="${ctx!}/admin/aboutUs/update">
        <input type="hidden" name="id" value="${aboutUs.id}">
        <div class="row">
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-2 control-label">内容：</label>
                <div class="col-sm-4">
                    <textarea id="content" name="content" class="form-control">${aboutUs.content}</textarea>
                </div>
            </div>
            <div class="row no-print footer">
                <div class="col-xs-12" style="text-align: right">
                    <button type="button" class="btn btn-primary" onclick="T.save($form)" style="margin-right: 5px;">确定</button>
                    <button type="button" class="btn btn-default" onclick="T.close()" >关闭</button>
                </div>
            </div>
        </div>
    </div>
    </form>
</div>
<script>
    var $form = $("#form");
    $(function(){
        T.valid($form);
    });
</script>



