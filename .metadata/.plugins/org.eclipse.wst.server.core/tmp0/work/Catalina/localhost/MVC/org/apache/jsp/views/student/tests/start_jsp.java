/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.19
 * Generated at: 2024-04-11 09:07:40 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.student.tests;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import com.pbl3.model.QuestionModel;
import java.util.LinkedList;
import com.pbl3.model.TestsModel;

public final class start_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = new java.util.LinkedHashSet<>(3);
    _jspx_imports_classes.add("com.pbl3.model.TestsModel");
    _jspx_imports_classes.add("com.pbl3.model.QuestionModel");
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
      out.write("h1 {\r\n");
      out.write("	text-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".box {\r\n");
      out.write("	width: 250px;\r\n");
      out.write("	height: 300px;\r\n");
      out.write("	color: red;\r\n");
      out.write("	border: 1px solid red;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".col-12{\r\n");
      out.write("	padding: 10px;\r\n");
      out.write("	margin-bottom: 15px;\r\n");
      out.write("	border: 1px solid #EAF0E4; \r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<h1>DAY LA TRANG START</h1>\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<form method=\"post\">\r\n");
      out.write("			");
for( QuestionModel q : (LinkedList<QuestionModel>)request.getAttribute("questionModels")){ 
      out.write("\r\n");
      out.write("			<div class=\"col-12\">\r\n");
      out.write("				<h3>Câu ");
      out.print( q.getOrderNumber());
      out.write('.');
      out.write(' ');
      out.print(q.getQuestionContent());
      out.write(" </h3>\r\n");
      out.write("					    <input type=\"radio\" id=\"contentAnswerA");
      out.print(q.getQuestionID());
      out.write("\" name=\"answer");
      out.print(q.getQuestionID());
      out.write("\" value=\"A\">\r\n");
      out.write("	      				<label for=\"contentAnswerA");
      out.print(q.getQuestionID());
      out.write('"');
      out.write('>');
      out.print(q.getContentAnswerA());
      out.write("</label><br>\r\n");
      out.write("	        			<input type=\"radio\" id=\"contentAnswerB");
      out.print(q.getQuestionID());
      out.write("\" name=\"answer");
      out.print(q.getQuestionID());
      out.write("\" value=\"B\">\r\n");
      out.write("	        			<label for=\"contentAnswerB");
      out.print(q.getQuestionID());
      out.write('"');
      out.write('>');
      out.print(q.getContentAnswerB());
      out.write("</label><br>\r\n");
      out.write("	        			<input type=\"radio\" id=\"contentAnswerC");
      out.print(q.getQuestionID());
      out.write("\" name=\"answer");
      out.print(q.getQuestionID());
      out.write("\" value=\"C\">\r\n");
      out.write("	        			<label for=\"contentAnswerC");
      out.print(q.getQuestionID());
      out.write('"');
      out.write('>');
      out.print(q.getContentAnswerC());
      out.write("</label><br>\r\n");
      out.write("						<input type=\"radio\" id=\"contentAnswerD");
      out.print(q.getQuestionID());
      out.write("\" name=\"answer");
      out.print(q.getQuestionID());
      out.write("\" value=\"D\">\r\n");
      out.write("	        			<label for=\"contentAnswerD");
      out.print(q.getQuestionID());
      out.write('"');
      out.write('>');
      out.print(q.getContentAnswerD() );
      out.write("</label><br>\r\n");
      out.write("			</div>\r\n");
      out.write("			");
} 
      out.write("\r\n");
      out.write("			<input type=\"submit\" value=\"nop bai\">\r\n");
      out.write("			</form>	\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("	<script\r\n");
      out.write("		src=\"https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js\"\r\n");
      out.write("		integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\"\r\n");
      out.write("		crossorigin=\"anonymous\"></script>\r\n");
      out.write("	<script\r\n");
      out.write("		src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("		integrity=\"sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct\"\r\n");
      out.write("		crossorigin=\"anonymous\"></script>\r\n");
      out.write("</body>\r\n");
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
