package sol.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.GestorBD;
import paw.bd.GestorBDPedidos;
import paw.model.ExcepcionDeAplicacion;
import paw.util.UtilesString;



@WebServlet(name = "CP_Provincia", urlPatterns = {"/GetProvinciaDeCp"})
public class CP_Provincia extends HttpServlet {

    private static GestorBD gd = new GestorBD();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        try {
            String codPost=request.getParameter("cp");                  
            String Prov=gd.getProvinciaDeCp(codPost);
            if(!UtilesString.isVacia(codPost)){
                response.getWriter().print(Prov);
            }else{
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "NO Provincia");
            }
            
        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(GetStockArticulo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   

}
