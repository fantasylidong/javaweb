<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <jsp:include page="/icd_meta.jsp"/>
    <title>东东商城-公告详情</title>
    <jsp:include page="/icd_link.jsp"/>
  </head>
  <body>
    <jsp:include page="/icd_top.jsp"></jsp:include>
    
    <!-- 公告详情 -->
    <div class="wrapper" style="min-height: 500px">
       <div class="panel" id="news_detail">
		  <div class="panel-heading">
		  <h1>关于我们</h1>
		   <p>本购物网站是由Servlet+JSP构成的网站，其中使用了zui、jQuery前端框架和富文本编辑器kindeditor框架，数据库采用了Mysql,数据库的操作使用了Apache的dbutils库</p>
              <p>本网站只收录了一小部分商品，希望你能挑选到你喜欢的商品~</p>
              <p>花开不落，我们不散</p>
		  </div>
		  <div class="panel-body">
		    ${news.content}
		  </div>
		</div>
    </div>    
    <!-- /公告详情 -->
    
    <jsp:include page="/icd_bottom.jsp"></jsp:include>

    <script src="${ctx}/zui/lib/jquery/jquery.js"></script>
    <script src="${ctx}/js/jquery.scrollUp.min.js"></script>
    <script src="${ctx}/zui/js/zui.js"></script>
    <script src="${ctx}/js/my.js"></script>
  </body>
</html>