package web.controller.member;

import service.OrdersService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "OrdersDetailsServlet",urlPatterns = "/member/orders/detail")
public class OrdersDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String status=request.getParameter("detail");
        OrdersService service=new OrdersService();

        service.updateStatus(Integer.parseInt(id),Integer.parseInt(status));
        response.sendRedirect(request.getContextPath()+"/member/orders");
    }
}
