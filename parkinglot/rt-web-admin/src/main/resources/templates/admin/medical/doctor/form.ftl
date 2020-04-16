<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>医生姓名:</label>
    <div class="col-sm-8">
        <input id="name" name="name" class="form-control" type="text" value="${doctor.name!}" [#if detail?exists]disabled="disabled"[/#if] placeholder="请输入医生姓名">
    </div>
</div>
<br>
<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>手机号:</label>
    <div class="col-sm-8">
        <input id="mobile" name="mobile" class="form-control" value="${doctor.mobile}" [#if detail?exists]disabled="disabled"[/#if] placeholder="请输入手机号（用作登录用户名）">
    </div>
</div>
<br>
<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>密码：</label>
    <div class="col-sm-8">
        <input id="password" name="password" type="password" class="form-control" value="" [#if !doctor??] required[/#if] [#if detail?exists]disabled="disabled"[/#if] placeholder="请输入密码（用作登录密码）">
    </div>
</div>
<br>
<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>性别：</label>
    <div class="col-sm-8">
        <input type="radio" name="gender" value="1" name="iCheck" [#if doctor.gender == 1]checked[/#if] [#if detail?exists]disabled="disabled"[/#if]>&nbsp;男&nbsp;
        <input type="radio" name="gender" value="2" name="iCheck" [#if  doctor.gender == 2]checked[/#if] [#if detail?exists]disabled="disabled"[/#if]> &nbsp;女
    </div>
</div>
<br>
<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>生日:</label>
    <div class="col-sm-8">
        <input id="birthday" name="birthday" class="form-control timepicker" type="text" value="${doctor.birthday}" [#if detail?exists]disabled="disabled"[/#if] placeholder="请输入生日" readonly>
    </div>
</div>
<br>
<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>所属医院:</label>
    <div class="col-sm-8">
        <input id="hospital" name="hospital" class="form-control" type="text" value="北京301医院" readonly>
    </div>
</div>
[#--<div class="form-group">--]
    [#--<label class="col-sm-3 control-label"><span style="color: red">*</span>所属医院:</label>--]
    [#--<div class="col-sm-8">--]
        [#--<input id="hospital" name="hospital" class="form-control" type="text" value="${doctor.hospital}" [#if detail?exists]disabled="disabled"[/#if] required placeholder="请输入所属医院">--]
    [#--</div>--]
[#--</div>--]
<br>
<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>任职科室:</label>
    <div class="col-sm-8">
        <input id="department" name="department" class="form-control" type="text" value="骨科康复科" readonly>
    </div>
</div>
[#--<div class="form-group">--]
    [#--<label class="col-sm-3 control-label"><span style="color: red">*</span>任职科室:</label>--]
    [#--<div class="col-sm-8">--]
        [#--<input id="department" name="department" class="form-control" type="text" value="${doctor.department}" [#if detail?exists]disabled="disabled"[/#if] required placeholder="请输入所属科室">--]
    [#--</div>--]
[#--</div>--]
<br>
<div class="form-group">
    <label class="col-sm-3 control-label"><span style="color: red">*</span>职位:</label>
    <div class="col-sm-8">
        [#--<input id="position" name="position" class="form-control" type="text" value="${doctor.position}" [#if detail?exists]disabled="disabled"[/#if] required placeholder="请输入职位">--]
        <select id="position" name="position" class="form-control" [#if detail?exists]disabled="disabled"[/#if]>
            <option value="">请选择</option>
            <option value="0" [#if doctor.position == 0]selected="selected"[/#if]>主任医师</option>
            <option value="1" [#if doctor.position == 1]selected="selected"[/#if]>副主任医师</option>
            <option value="2" [#if doctor.position == 2]selected="selected"[/#if]>主治医师</option>
        </select>
    </div>
</div>
<br>