/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.19
 * Generated at: 2024-04-10 09:31:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.student;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import com.pbl3.model.UserModel;
import com.pbl3.model.AccountModel;

public final class homepage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(2);
    _jspx_imports_classes.add("com.pbl3.model.AccountModel");
    _jspx_imports_classes.add("com.pbl3.model.UserModel");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("  <head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css\" integrity=\"sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N\" crossorigin=\"anonymous\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css\"\r\n");
      out.write("    integrity=\"sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==\"\r\n");
      out.write("    crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/base.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\r\n");
      out.write("    <title>Study TOIEC</title>\r\n");
      out.write("  </head>\r\n");
      out.write("  <body>\r\n");
      out.write("  \r\n");
      out.write("  	<style>\r\n");
      out.write("  	\r\n");
      out.write("  	@import url('https://fonts.googleapis.com/css2?family=Inria+Serif:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap');\r\n");
      out.write(":root\r\n");
      out.write("{\r\n");
      out.write("    --color-one:  #0EDC8D;\r\n");
      out.write("    --color-two: #04182B;\r\n");
      out.write("    --color-text: #888886;\r\n");
      out.write("    --font: 'Inria Serif', serif; \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a{\r\n");
      out.write("    text-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a:hover {\r\n");
      out.write("    text-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("body{\r\n");
      out.write("    font-family: var(--font);\r\n");
      out.write("    color: var(--color-text);\r\n");
      out.write("}   \r\n");
      out.write("\r\n");
      out.write("*{\r\n");
      out.write("    font-family: \"Poppins\", sans-serif;\r\n");
      out.write("}\n");
      out.write("		/* header */\r\n");
      out.write("\r\n");
      out.write(".container {\r\n");
      out.write("    max-width: 1296px;\r\n");
      out.write("}\r\n");
      out.write(".header{\r\n");
      out.write("    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);\r\n");
      out.write("}\r\n");
      out.write(".header-top{\r\n");
      out.write("    background-color: var(--color-one);\r\n");
      out.write("    color: var(--color-two);\r\n");
      out.write("    font-size: 18px;\r\n");
      out.write("    padding: 8px;\r\n");
      out.write("    text-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-wrap{\r\n");
      out.write("    display: flex;\r\n");
      out.write("    justify-content: space-between;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("    padding: 24px 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-logo img{\r\n");
      out.write("    height: 48px;\r\n");
      out.write("    width: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-logo a{\r\n");
      out.write("    color: var(--color-one);\r\n");
      out.write("    display: flex;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-logo span{\r\n");
      out.write("    font-size: 22px;\r\n");
      out.write("    font-weight: 600;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-box {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-box .button {\r\n");
      out.write("    margin-left: 30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-menu ul{\r\n");
      out.write("    list-style-type: none;\r\n");
      out.write("    padding: 0;\r\n");
      out.write("    margin: 0;\r\n");
      out.write("    display: flex;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-menu ul li{\r\n");
      out.write("    margin-left: 17px;\r\n");
      out.write("    margin-right: 17px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-menu ul li a{\r\n");
      out.write("    color: var(--color-two);\r\n");
      out.write("    font-size: 17px;\r\n");
      out.write("    font-weight: 600;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-menu ul li a:hover {\r\n");
      out.write("    color: var(--color-one);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-contact{\r\n");
      out.write("    font-size: 18px;\r\n");
      out.write("    color: var(--color-one);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-social ul{\r\n");
      out.write("    list-style-type: none;\r\n");
      out.write("    padding: 0;\r\n");
      out.write("    margin: 0;\r\n");
      out.write("    display: flex;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-social ul li{\r\n");
      out.write("    margin-left: 10px;\r\n");
      out.write("    margin-right: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-main .inner-social li a {\r\n");
      out.write("    color: var(--color-one);\r\n");
      out.write("    font-size: 22px;\r\n");
      out.write("}\r\n");
      out.write("/*end header */\r\n");
      out.write("\r\n");
      out.write("/* button */\r\n");
      out.write(".button{\r\n");
      out.write("    background-color: var(--color-text);\r\n");
      out.write("    color: #fff;\r\n");
      out.write("    padding: 10px 10px;\r\n");
      out.write("    font-size: 17px;\r\n");
      out.write("    font-weight: 600;\r\n");
      out.write("    border-radius: 10px;\r\n");
      out.write("    border: solid 2px var(--color-text);\r\n");
      out.write("    display: inline-block;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".button:hover{\r\n");
      out.write("    color: var(--color-text);\r\n");
      out.write("    background-color: #fff;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".button-one{\r\n");
      out.write("    background-color: var(--color-one);\r\n");
      out.write("    border-color: var(--color-one);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".button-one:hover{\r\n");
      out.write("    color: var(--color-one);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".button-two{\r\n");
      out.write("    background-color: var(--color-two);\r\n");
      out.write("    border-color: var(--color-two);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".button-two:hover{\r\n");
      out.write("    color: var(--color-two);\r\n");
      out.write("}\r\n");
      out.write("/*end button */\r\n");
      out.write("\r\n");
      out.write("\n");
      out.write("	</style>\r\n");
      out.write("    \r\n");
      out.write("    <!-- Header -->\r\n");
      out.write("   <!-- header -->\r\n");
      out.write("   <header class=\"header\">\r\n");
      out.write("    <div class=\"header-main\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"inner-wrap\">\r\n");
      out.write("                <div class=\"inner-logo\">\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <img src=\"https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F\" alt=\"LOGO\">\r\n");
      out.write("                    </a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"inner-box\">\r\n");
      out.write("                  <div class=\"inner-menu\">\r\n");
      out.write("                    <ul>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"\">\r\n");
      out.write("                                Trang Chủ\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"#\">\r\n");
      out.write("                                Khóa Học\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"/MVC/tests\">\r\n");
      out.write("                                Đề Thi\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"/MVC/vocab-lists\">\r\n");
      out.write("                                Từ Vựng\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"inner-button\">\r\n");
      out.write("                   \r\n");
      out.write("                  ");
 //lấy session
                  UserModel userModel = (UserModel) session.getAttribute("user");
                  // nếu session = null thì chưa đăng nhập nên dùng button đăng nhập
                  if (userModel == null) {
      out.write("	\r\n");
      out.write("                  	<a href=\"login\">\r\n");
      out.write("                  		<button class=\"button button-one\">Đăng Nhập</button>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  ");
}
                  
               	  // ngược lại là khác sesstion khác null : đã đăng nhập nên dùng button trang cá nhân 		
                  else {
      out.write("\r\n");
      out.write("                  	<a href=\"my-account\">\r\n");
      out.write("                  		<button class=\"button button-one\">Trang Cá Nhân</button>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  ");
} 
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</header>\r\n");
      out.write("<!-- end header -->\r\n");
      out.write("    <!--End header -->\r\n");
      out.write("\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
