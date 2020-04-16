<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>parking lot name:</label>
    <div class="col-sm-8">
        <input id="name" name="name" class="form-control" type="text" value="${doctor.name!}" [#if detail?exists]disabled="disabled"[/#if] placeholder="please input the name">
    </div>
</div>
<br>
<br>
<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>parking lot count:</label>
    <div class="col-sm-8">
        <input id="parkingCount" name="parkingCount" class="form-control" value="${doctor.mobile}" [#if detail?exists]disabled="disabled"[/#if] placeholder="please input the count">
    </div>
</div>
<br>
<br>