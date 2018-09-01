<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="/kindeditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/kindeditor/ueditor.all.js"></script>
<link href="lib/uploader/zui.uploader.min.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <jsp:include page="/icd_meta.jsp" />
    <title>管理员-商品添加</title>
    <jsp:include page="/icd_link.jsp" />
</head>

<body>
<jsp:include page="/icd_top.jsp"></jsp:include>
<!-- 主内容 -->
<div class="wrapper" style="min-height: 530px">

    <div class="row" style="padding: 20px 0px;">
<form action="/member/product/add" method="get">
    <div class="form-group" style="margin-left: auto">
        <label for="name" class="required">商品名</label>
        <input type="text" class="form-control" id="name" placeholder="商品名">
    </div>

   <div class="form-group">
        <label for="selec" class="required">商品类型</label>
        <select id="selec" data-placeholder="选择一个商品类型">
            <option value="">请选择一种商品类型</option>
            <option value="1">手机</option>
            <option value="2">电脑办公</option>
            <option value="3">影音娱乐</option>
            <option value="4">小家电</option>
            <option value="5">大家电</option>
            <option value="6">摄影器材</option>
            <option value="7">酷玩潮品</option>
            <option value="8">移动手机</option>
            <option value="9">联通手机</option>
            <option value="10">电信手机</option>
            <option value="11">笔记本</option>
            <option value="12">台式机</option>
            <option value="13">数码影音</option>
            <option value="14">家庭影院</option>
            <option value="15">个护电器</option>
            <option value="16">健康电器</option>
            <option value="17">冰箱</option>
            <option value="18">空调</option>
            <option value="19">洗衣机</option>
            <option value="20">摄影摄像</option>
            <option value="21">摄影配件</option>
            <option value="22">潮品</option>
        </select>
    </div>
    <input type="file" class="form-control" id="photo" value="" placeholder="请上传主配图片，像素为240*240的jpg图片" onChange="document.getElementsByName('filePath')[0].value=this.value">
    <input type="hidden" name="filePath" />
    <div class="form-group">
        <label for="photoe">图片</label>
        <input type="text" class="form-control" id="photoe" placeholder="填写图片名字">
    </div>
    <div class="form-group">
        <label for="inventory">库存数量</label>
        <input type="text" class="form-control" id="inventory" placeholder="填写库存数量">
    </div>
    <div class="form-group">
        <label for="sales_volume">售出数量</label>
        <input type="text" class="form-control" id="sales_volume" placeholder="填写售出数量">
    </div>
    <div class="form-group">
    <label for="price">定价</label>
    <input type="text" class="form-control" id="price" placeholder="填写商品定价">
    </div>

    <div class="form-group">
        <label for="sale_price">售价</label>
        <input type="text" class="form-control" id="sale_price" placeholder="填写商品售价">
    </div>
    <div class="form-group">
        <label for="detail_description">详情描述</label>
    <!-- 加载编辑器的容器 -->
    <script id="detail_description" name="detail_description" type="text/plain">
            这里写你的详情描述富文本
        </script>
    </div>
    <div class="form-group">
        <label for="detail_descriptions">库存数量</label>
        <input type="text" class="form-control" id="detail_descriptions" placeholder="填写库存数量">
    </div>
    <div class="form-group">
        <label for="selling_description">卖点描述</label>
    <!-- 加载编辑器的容器 -->
    <script id="selling_description" name="selling_description" type="text/plain">
            这里写你的卖点富文本
        </script>
    </div>
    <div class="form-group">
        <label for="selling_descriptions">详情描述</label>
        <input type="text" class="form-control" id="detail_descriptions" placeholder="填写库存数量">
    </div>
    <div class="form-group">
        <label for="sale_time">开售时间</label>
        <div class="input-group">
            <input type="text" class="form-control" id="sale_time" placeholder="YYYY-MM-DD HH-MM-SS">
        </div>
    </div>
    <button type="submit" class="btn btn-primary" style="text-align:right">提交</button>
</form>
        <!-- 实例化编辑器 -->
        <script type="text/javascript">
            var editor = UE.getEditor('detail_description');
            var editor2=UE.getEditor('selling_description');
        </script>
    </div>

</div>
</body>
</html>
