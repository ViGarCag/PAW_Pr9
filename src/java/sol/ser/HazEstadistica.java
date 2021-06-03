package sol.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.GestorBDPedidos;
import paw.model.ExcepcionDeAplicacion;


@WebServlet(name = "HazEstadistica", urlPatterns = {"/admin/HazEstadistica"})
public class HazEstadistica extends HttpServlet {
    static GestorBDPedidos gb=new GestorBDPedidos();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int anio=2021;
        int num=3;
        if(request.getParameter("tipo") != null && request.getParameter("tipo").trim().length() != 0
            || request.getParameter("anio") != null && request.getParameter("anio").trim().length() != 0
            || request.getParameter("num") != null && request.getParameter("num").trim().length() != 0){
            try{
                anio=Integer.parseInt(request.getParameter("anio"));
                num=Integer.parseInt(request.getParameter("num"));
                String tipo=request.getParameter("tipo");
                String json=gb.getEstadisticaVentasJSON(anio,tipo, num);                
                request.setAttribute("tipo",tipo);
                request.setAttribute("anio",anio);
                request.setAttribute("json",json);
                //System.out.println(json);
                RequestDispatcher r = request.getRequestDispatcher("/admin/estadistica.jsp");
                r.forward(request, response);
            } catch (ExcepcionDeAplicacion ex) {
                Logger.getLogger(HazEstadistica.class.getName()).log(Level.SEVERE, null, ex);
                throw new ServletException(ex);
            }
        }else{
            request.setAttribute("anio",anio);
            request.setAttribute("num",num);
            RequestDispatcher r = request.getRequestDispatcher("/admin/estadistica.jsp");
            r.forward(request, response);
        }
    }
}
