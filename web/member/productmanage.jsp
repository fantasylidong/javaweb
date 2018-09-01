<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="q" uri="http://www.itvk.cn/jsp/tags" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <jsp:include page="/icd_meta.jsp" />
    <title>管理员-管理商品</title>
    <jsp:include page="/icd_link.jsp" />
</head>
<body>
<jsp:include page="/icd_top.jsp"></jsp:include>

<!-- 主内容 -->
<div class="wrapper" style="min-height: 530px">

    <div class="row" style="padding: 20px 0px;">

        <div class="col-xs-2">

            <jsp:include page="/member/icd_menu.jsp">
                <jsp:param value="product" name="tag" />
            </jsp:include>
        </div>

        <div class="col-xs-10">
            <div class="panel">
                <div class="panel-heading">
                    <strong><i class="icon-calculator"> </i>商品管理</strong>
                    <div class="panel-actions">
                    <button class="btn btn-primary" data-toggle="modal"
                            data-target="#addproductModal">添加新产品</button>
                    </div>
                </div>
                <table class="table table-hover table-striped tablesorter">
                    <thead>
                    <tr class="text-center">
                        <td style="width: 60px">ID</td>
                        <td style="width: 150px">商品信息</td>
                        <td style="width: 80px">商品类型</td>
                        <td style="width: 80px">库存数量</td>
                        <td style="width: 80px">售出数量</td>
                        <td style="width: 60px">定价</td>
                        <td style="width: 60px">售价</td>
                        <td style="width: 90px">添加时间</td>
                        <td style="width: 90px">开售时间</td>
                        <td style="width: 40px">操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.items}" var="products">
                        <tr class="text-center">
                            <td>${products.id}</td>
                            <td><a href="${ctx}/product_detail?id=${products.id}">${products.name}</a> </td>
                            <td>${products.cate_id}</td>
                            <td>${products.inventory}</td>
                            <td>${products.sales_volume}</td>
                            <td>${products.price}</td>
                            <td>${products.sale_price}</td>
                            <td>${products.create_time}</td>
                            <td>${products.sale_time}</td>
                            <td>
                                <a href="${ctx}/member/product/update?id=${products.id}"
                                   class="editHref">编辑</a>&nbsp;&nbsp; <a
                                        href="${ctx}/member/product/del?id=${products.id}"
                                        class="deleteHref">删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="8"><q:pager
                                totalElements="${page.totalElements}" number="${page.number}" />
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <!-- /右边 -->
    </div>
</div>
<!-- /主内容 -->

<jsp:include page="/icd_bottom.jsp"></jsp:include>

<!-- 新增地址的对话框 -->
<div class="modal fade" id="addproductModal">
    <div class="modal-dialog">
        <form id="addproductForm" action="${ctx}/member/product/add" method="post"
              class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">新增商品信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-xs-2 control-label">商品名</label>
                        <div class="col-xs-4 required">
                            <input type="text" name="name" id="name"
                                   placeholder="商品名" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-2 control-label">商品类型</label>
                        <div class="col-xs-4 required">
                        <select class="form-control" name="type">
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
                    </div>
                    <div class="form-group">
                        <label class="col-xs-2 control-label">简介图片</label>
                        <div class="col-xs-9 required">
                            <input type="text" name="photo" id="photo" placeholder="简介图片名字"
                                   class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-2 control-label">库存数量</label>
                        <div class="col-xs-9 required">
                            <input type="text" name="inventory" id="inventory" placeholder="库存数量"
                                   class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-2 control-label">售出数量</label>
                        <div class="col-xs-9 required">
                            <input type="text" name="sales_volume" id="sales_volume" placeholder="售出数量"
                                   class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">定价</label>
                            <div class="col-xs-4 required">
                                <input type="text" name="price" id="price"
                                       placeholder="定价" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">售价</label>
                            <div class="col-xs-4 required">
                                <input type="text" name="sale_price" id="sale_price"
                                       placeholder="售价" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">卖点详情</label>
                            <div class="col-xs-9 required">
                                <textarea class="form-control"name="selling_description" id="selling_description" placeholder="卖点富文本"
                                ></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">卖点描述</label>
                            <div class="col-xs-9 required">
                                <textarea class="form-control" name="detail_description" id="detail_description" placeholder="卖点富文本"
                                ></textarea>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">开售时间</label>
                            <div class="col-xs-4 required">
                                <input type="text" name="sale_time" id="sale_time"
                                       placeholder="开售时间" class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="reset" id="resetBtn" class="btn btn-default">重置</button>
                        <button type="submit" id="submitBtn" class="btn btn-primary"
                                style="min-width: 80px">保存</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- /编辑地址的对话框 -->
<!-- 编辑地址的对话框 -->
<div class="modal fade" id="editproductModal">
    <div class="modal-dialog">
        <form id="editproductForm" action="${ctx}/member/product/update" method="post"
              class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">编辑商品信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-xs-2 control-label">商品名</label>
                        <div class="col-xs-4 required">
                            <input type="text" name="name" id="name"
                                   placeholder="商品名" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <select class="form-control" name="type">
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
                    <div class="form-group">
                        <label class="col-xs-2 control-label">库存数量</label>
                        <div class="col-xs-9 required">
                        <input type="text" name="inventory" id="inventory" placeholder="库存数量"
                               class="form-control" />
                    </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-2 control-label">售出数量</label>
                        <div class="col-xs-9 required">
                            <input type="text" name="sales_volume" id="sales_volume" placeholder="售出数量"
                                   class="form-control" />
                        </div>
                    <div class="form-group">
                        <label class="col-xs-2 control-label">定价</label>
                        <div class="col-xs-9 required">
                            <input type="text" name="price" id="price"
                                   placeholder="定价" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-2 control-label">售价</label>
                        <div class="col-xs-9 required">
                            <input type="text" name="sale_price" id="sale_price"
                                   placeholder="售价" class="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-2 control-label">开售时间</label>
                        <div class="col-xs-9 required">
                            <input type="text" name="sale_time" id="sale_time"
                                   placeholder="开售时间" class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="reset" id="resetBtn" class="btn btn-default">重置</button>
                    <button type="submit" id="submitBtn" class="btn btn-primary"
                            style="min-width: 80px">保存</button>
                </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- /编辑地址的对话框 -->

<!-- 删除的提示对话框 -->
<div class="modal fade" id="deleteModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">不可恢复删除，你确定吗？</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="doDelete" class="btn btn-primary"
                        style="min-width: 80px">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- /删除的提示对话框  -->


<script src="${ctx}/zui/lib/jquery/jquery.js"></script>
<script src="${ctx}/js/jquery.scrollUp.min.js"></script>
<script src="${ctx}/zui/js/zui.js"></script>
<script src="${ctx}/js/my.js"></script>
<script>
    /***********处理删除的问题*************/
    var url = null;
    $(".deleteHref").click(function(){
        //alert("(^_^)");

        //打开对话框
        $('#deleteModal').modal('show');

        //获取当前超链接的地址
        url = $(this).attr("href");

        return false;
    });

    $("#doDelete").click(function(){
        //执行操作
        if(url){
            location.assign(url);
        }
        $('#deleteModal').modal('hide');

        return false;
    });

    /************处理编辑的问题************/
    $(".editHref").click(function(){
        var url = $(this).attr("href");

        //获取当前行的数据
        var $tds = $("td", $(this).closest("tr"));
        var name = $($tds[1]).text();
        var cate_id = $('#editproductForm option:selected');
        var inventory = $($tds[3]).text();
        var sales_volume = $($tds[4]).text();
        var price = $($tds[5]).text();
        var sale_price = $($tds[6]).text();
        var sale_time = $($tds[7]).text();
        $("input[name='name']", "#editproductForm").val(name);
        $("input[name='inventory']", "#editproductForm").val(inventory);
        $("input[name='sales_volume']", "#editproductForm").val(sales_volume);
        $("input[name='price']", "#editproductForm").val(price);
        $("input[name='sale_price']", "#editproductForm").val(sale_price);
        $("input[name='sale_time']", "#editproductForm").val(sale_time);
        $('#editproductForm option:selected') .val(cate_id);//选中的值
        $("#editproductForm").attr("action", url);

        //处理“重置”操作
        $("#resetBtn", "#editproductForm").unbind().click(function(){
            $("input[name='name']", "#editproductForm").val(name);
            $("input[name='inventory']", "#editproductForm").val(inventory);
            $("input[name='sales_volume']", "#editproductForm").val(sales_volume);
            $("input[name='price']", "#editproductForm").val(price);
            $("input[name='sale_price']", "#editproductForm").val(sale_price);
            $("input[name='sale_time']", "#editproductForm").val(sale_time);
            $('#editproductForm option:selected') .val(cate_id);//选中的值

            return false;
        });

        //打开编辑的对话框
        $('#editproductModal').modal('show');

        return false;
    });
</script>
</body>
</html>