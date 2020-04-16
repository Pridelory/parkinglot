<div class="form-group">
    <label class="col-sm-3 control-label">上级资源：</label>
    <div class="col-sm-8">
        <input id="parentId" name="parentId" value="${(resource.parentId)!}">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">资源名称：</label>
    <div class="col-sm-8">
        <input id="name" name="name" class="form-control" type="text" value="${resource.name}" required>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">唯一标识：</label>
    <div class="col-sm-8">
        <input id="sourceKey" name="sourceKey" class="form-control" type="text" value="${resource.sourceKey}" required>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">资源类型：</label>
    <div class="col-sm-8">
        <select name="type" class="form-control" >
            <option value="1" [#if resource.type == 1]selected="selected"[/#if]>菜单</option>
            <option value="2" [#if resource.type == 2]selected="selected"[/#if]>按钮</option>
        </select>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">资源url：</label>
    <div class="col-sm-8">
        <input id="sourceUrl" name="sourceUrl" class="form-control" value="${resource.sourceUrl}">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">层级：</label>
    <div class="col-sm-8">
        <input id="level" name="level" class="form-control" value="${resource.level}" placeholder="目录：1，菜单：2，按钮：3" required>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">排序：</label>
    <div class="col-sm-8">
        <input id="sort" name="sort" class="form-control" value="${resource.sort}" required>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">图标：</label>
    <div class="col-sm-8">
        <input id="icon" name="icon" class="form-control" value="${resource.icon}">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">状态：</label>
    <div class="col-sm-8">
        <select name="isHide" class="form-control">
            <option value="0" [#if resource.locked == 0]selected="selected"[/#if]>显示</option>
            <option value="1" [#if resource.locked == 1]selected="selected"[/#if]>隐藏</option>
        </select>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">描述：</label>
    <div class="col-sm-8">
        <input id="description" name="description" class="form-control" value="${resource.description}">
    </div>
</div>
<script>
    var roleTree = eval('${(roleTree)!}');
    var json = convert(roleTree);
    console.log(json)
    $(function(){
        $('#parentId').combotree({
            width:300,
            data: json
        });
    })
</script>