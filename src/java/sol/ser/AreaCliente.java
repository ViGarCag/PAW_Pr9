package sol.ser;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import paw.model.Cliente;

public class AreaCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession(true);
        Cliente cliente = (Cliente) sesion.getAttribute("cliente");
        request.setAttribute("usr", cliente.getNombre());
        request.getRequestDispatcher(("index.jsp")).forward(request,response);
        
    }


}
