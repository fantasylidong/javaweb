package web.controller.member;

import entity.Address;
import entity.Member;
import entity.Orders;
import entity.Product;
import entity.common.Page;
import service.AddressService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/member/product/list")
public class ProductList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //
        /*int number = 1;
        int size = 10;
        String n = request.getParameter("number");
        if(n != null && !"".equals(n)){
            number = Integer.parseInt(n);
        }
        if(number < 1){
            number = 1;
        }
        String s = request.getParameter("size");
        if(s != null && !"".equals(s)){
            size = Integer.parseInt(s);
        }
        if(size <= 0){
            size = 10;
        }
*/
        //
        ProductService service = new ProductService();
        Page<Product> page = service.findAll(1, 100);
        //
        request.setAttribute("page", page);
        request.getRequestDispatcher("/member/productmanage.jsp").forward(request, response);
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
