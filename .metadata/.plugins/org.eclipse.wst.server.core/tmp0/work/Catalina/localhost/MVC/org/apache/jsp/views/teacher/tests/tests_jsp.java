/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.19
 * Generated at: 2024-04-19 03:17:19 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.teacher.tests;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.util.LinkedList;
import com.pbl3.model.TestsModel;

public final class tests_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("com.pbl3.model.TestsModel");
    _jspx_imports_classes.add("java.util.LinkedList");
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
      out.write("<head>\r\n");
      out.write("<!-- Required meta tags -->\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\"\r\n");
      out.write("	content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("\r\n");
      out.write("<!-- Bootstrap CSS -->\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css\"\r\n");
      out.write("	integrity=\"sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N\"\r\n");
      out.write("	crossorigin=\"anonymous\">\r\n");
      out.write("\r\n");
      out.write("<title>Hello, world!</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<style>\r\n");
      out.write(".container {\r\n");
      out.write("	\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".inner-content {\r\n");
      out.write("	padding: 20px;\r\n");
      out.write("	border: 1px solid red;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<h1>DAY LA TRANG SHOW DE THI TEACHER</h1>\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("			<!-- Button trigger modal -->\r\n");
      out.write("			<button type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\"\r\n");
      out.write("				data-target=\"#exampleModal\">Them de thi</button>\r\n");
      out.write("\r\n");
      out.write("			<!-- Modal -->\r\n");
      out.write("			<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\"\r\n");
      out.write("				aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("				<div class=\"modal-dialog\">\r\n");
      out.write("					<div class=\"modal-content\">\r\n");
      out.write("						<div class=\"modal-header\">\r\n");
      out.write("							<h5 class=\"modal-title\" id=\"exampleModalLabel\">Them</h5>\r\n");
      out.write("							<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\r\n");
      out.write("								aria-label=\"Close\">\r\n");
      out.write("								<span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("							</button>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"modal-body\">\r\n");
      out.write("\r\n");
      out.write("							<form method=\"post\" action=\"/MVC/teacher/tests/create\"> \r\n");
      out.write("								<div class=\"form-group\">\r\n");
      out.write("									<label for=\"1\">Ten de thi</label> <input\r\n");
      out.write("										type=\"text\" class=\"form-control\" id=\"1\"\r\n");
      out.write("										aria-describedby=\"emailHelp\" name=\"testsName\"> \r\n");
      out.write("								</div>\r\n");
      out.write("								<div class=\"form-group\">\r\n");
      out.write("									<label for=\"2\">Nam</label> <input\r\n");
      out.write("										type=\"number\" class=\"form-control\"\r\n");
      out.write("										id=\"2\" min=\"2020\" max=\"2024\">\r\n");
      out.write("								</div> \r\n");
      out.write("								<button type=\"submit\" class=\"btn btn-primary\">Submit</button>\r\n");
      out.write("							</form>\r\n");
      out.write("\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			");

			LinkedList<TestsModel> testsModels = (LinkedList<TestsModel>) request.getAttribute("testsModels");
			if (testsModels != null) {
				for (TestsModel t : testsModels) {
			
      out.write("\r\n");
      out.write("			<div class=\"col-xl-3\">\r\n");
      out.write("				<div class=\"inner-wrap\">\r\n");
      out.write("					<div class=\"inner-content\">\r\n");
      out.write("						<a style=\"display: block;\"\r\n");
      out.write("							href=\"/MVC/teacher/question?testsID=");
      out.print(t.getTestID());
      out.write("\">\r\n");
      out.write("							<h3 class=\"inner-listname\">\r\n");
      out.write("								");
      out.print(t.getTestName());
      out.write("\r\n");
      out.write("							</h3>\r\n");
      out.write("							<p class=\"inner-desc\">\r\n");
      out.write("								Năm:\r\n");
      out.write("								");
      out.print(t.getYear());
      out.write("</p>\r\n");
      out.write("						</a>\r\n");
      out.write("						<!-- <p class=\"inner-number\">số lượng</p> -->\r\n");
      out.write("						<form action=\"\" method=\"post\">\r\n");
      out.write("							");

							if (t.getStatus()) {
							
      out.write("\r\n");
      out.write("							<button type=\"submit\" class=\"button-detail\">ẨN ĐỀ THI</button>\r\n");
      out.write("							");

							} else {
							
      out.write("\r\n");
      out.write("							<button type=\"submit\" class=\"button-detail\">XUẤT BẢN</button>\r\n");
      out.write("							");

							}
							
      out.write("\r\n");
      out.write("\r\n");
      out.write("						</form>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			");

			}
			}
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<script\r\n");
      out.write("		src=\"https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js\"\r\n");
      out.write("		integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\"\r\n");
      out.write("		crossorigin=\"anonymous\"></script>\r\n");
      out.write("	<script\r\n");
      out.write("		src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("		integrity=\"sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct\"\r\n");
      out.write("		crossorigin=\"anonymous\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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