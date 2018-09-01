package web.controller.member;

import entity.Product;
import entity.Member;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/member/product/add")
public class ProductAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求的参数数据
        String name=request.getParameter("name");
        String cate_id=request.getParameter("type");
        String thub=request.getParameter("photo");
        String inventory=request.getParameter("inventory");
        String selling_description=request.getParameter("selling_descriptionValues");
        String detail_description=request.getParameter("detail_descriptionValues");
        String sales_volume=request.getParameter("sales_volume");
        String price=request.getParameter("price");
        String sale_price=request.getParameter("sale_price");
        String sale_time=request.getParameter("sale_time");

        //把散装数据封装成对象
        ProductService service=new ProductService();
        Product product=new Product();
        product.setCate_id(Integer.parseInt(cate_id));
        product.setName(name);
        product.setThumbnail(thub);
        product.setSelling_description(selling_description);
        product.setDetail_description(detail_description);
        product.setInventory(Integer.parseInt(inventory));
        product.setSales_volume(Integer.parseInt(sales_volume));
        BigDecimal Price=new BigDecimal(price);
        BigDecimal sale_Price=new BigDecimal(sale_price);
        product.setPrice(Price);
        product.setSale_price(sale_Price);
        DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date= null;
        Date currtime=new Date();
        String currstr=fmt.format(currtime);
        try {
            date = fmt.parse(sale_time);
            currtime=fmt.parse(currstr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        product.setCreate_time(currtime);
        product.setSale_time(date);
         service.save(product);

        //跳转(重定向)
        response.sendRedirect(request.getContextPath() + "/member/product/list");
    }
}
