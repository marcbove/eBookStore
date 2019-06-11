package sob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class LogOutCommand implements Command

{
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
   HttpSession sesion = request.getSession(false);
   sesion.removeAttribute("name");
   request.getRequestDispatcher("/criterion.do").forward(request, response);
  }
}
