package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class reserve_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"Dashboard\">\n");
      out.write("        <meta name=\"keyword\" content=\"Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina\">\n");
      out.write("\n");
      out.write("        <title>Sign Up</title>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core CSS -->\n");
      out.write("        <link href=\"assets/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("        <!--external css-->\n");
      out.write("        <link href=\"assets/font-awesome/css/font-awesome.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("        <!-- Custom styles for this template -->\n");
      out.write("        <link href=\"assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"assets/css/style-responsive.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("          <script src=\"https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js\"></script>\n");
      out.write("          <script src=\"https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js\"></script>\n");
      out.write("        <![endif]-->\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!-- **********************************************************************************************************************************************************\n");
      out.write("        MAIN CONTENT\n");
      out.write("        *********************************************************************************************************************************************************** -->\n");
      out.write("\n");
      out.write("        <div class=\"alert alert-success\" role=\"alert\">\n");
      out.write("            <strong>Register Successful!!</strong> Please Login...\n");
      out.write("        </div> \n");
      out.write("\n");
      out.write("        <div id=\"login-page\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("\n");
      out.write("                <form class=\"form-login\" action=\"FirstServlet\">\n");
      out.write("                    <h2 class=\"form-login-heading\">SIGN UP NOW</h2>\n");
      out.write("                    <div class=\"login-wrap\">\n");
      out.write("                        <input name=\"firstName\" type=\"text\" class=\"form-control\" placeholder=\"First Name\" autofocus>\n");
      out.write("                        <br>\n");
      out.write("                        <input name=\"lastName\"type=\"text\" class=\"form-control\" placeholder=\"Last Name\" autofocus>\n");
      out.write("                        <br>\n");
      out.write("                        <input name=\"dept\"type=\"text\" class=\"form-control\" placeholder=\"Department\" autofocus>\n");
      out.write("                        <br>\n");
      out.write("                        <input name=\"mail\" type=\"email\" class=\"form-control\" placeholder=\"Gmail\" autofocus>\n");
      out.write("                        <br>\n");
      out.write("                        <input name=\"userName\" type=\"text\" class=\"form-control\" placeholder=\"User Name\" autofocus>\n");
      out.write("                        <br>\n");
      out.write("                        <input name=\"password\" type=\"password\" class=\"form-control\" placeholder=\"Password\">\n");
      out.write("                        <br>\n");
      out.write("                        <button class=\"btn btn-theme btn-block\"  type=\"submit\"><i class=\"fa fa-lock\"></i> SIGN UP</button>\n");
      out.write("                        <hr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"registration\">\n");
      out.write("                            Already have an account?<br/>\n");
      out.write("                            <a class=\"\" href=\"login.jsp\">\n");
      out.write("                                Login Page\n");
      out.write("                            </a>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                </form>\t  \t\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- js placed at the end of the document so the pages load faster -->\n");
      out.write("        <script src=\"assets/js/jquery.js\"></script>\n");
      out.write("        <script src=\"assets/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("        <!--BACKSTRETCH-->\n");
      out.write("        <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->\n");
      out.write("        <script type=\"text/javascript\" src=\"assets/js/jquery.backstretch.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $.backstretch(\"assets/img/login-bg.jpg\", {speed: 500});\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
