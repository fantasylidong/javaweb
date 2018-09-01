package web.controller.member;

import entity.Address;
import entity.Product;
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

@WebServlet(name = "产品更新" ,urlPatterns = "/member/product/update")

public class ProductUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String cate_id=request.getParameter("type");
        String inventory=request.getParameter("inventory");
        String sales_volume=request.getParameter("sales_volume");
        String price=request.getParameter("price");
        String sale_price=request.getParameter("sale_price");
        String sale_time=request.getParameter("sale_time");

        ProductService service=new ProductService();
        Product product=service.findOne(Integer.parseInt(id));
        product.setCate_id(Integer.parseInt(cate_id));
        product.setName(name);
        product.setInventory(Integer.parseInt(inventory));
        product.setSales_volume(Integer.parseInt(sales_volume));
        BigDecimal Price=new BigDecimal(price);
        BigDecimal sale_Price=new BigDecimal(sale_price);
        product.setPrice(Price);
        product.setSale_price(sale_Price);
        DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date= null;
        Date currentTime = new Date();
        try {
            date = fmt.parse(sale_time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        product.setSale_time(date);
        service.update(product);
        response.sendRedirect(request.getContextPath()+"/member/product/list");
    }
}
