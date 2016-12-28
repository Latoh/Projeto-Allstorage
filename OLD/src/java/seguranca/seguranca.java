package seguranca;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class seguranca {
    
    public static void autoriza(HttpServletRequest request,
            HttpServletResponse response,
            Object logado) throws ServletException, IOException{
        
        String location = "login.jsp";
        
        if(logado == null ){
        RequestDispatcher view = request.getRequestDispatcher(location);
        view.forward(request, response);
        
        }
    
    }
}
