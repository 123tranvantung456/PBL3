/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.19
 * Generated at: 2024-04-11 08:58:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.student.tests;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import com.pbl3.model.HistoryOfTestModel;
import java.util.LinkedList;
import com.pbl3.model.TestsModel;

public final class guide_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("com.pbl3.model.HistoryOfTestModel");
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
      out.write(".modal-form .modal-header {\r\n");
      out.write("	flex-direction: column;\r\n");
      out.write("	/* justify-content: center; */\r\n");
      out.write("	align-items: center;\r\n");
      out.write("	position: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".modal-form .modal-header .close {\r\n");
      out.write("	position: absolute;\r\n");
      out.write("	top: -2px;\r\n");
      out.write("	right: -2px;\r\n");
      out.write("	opacity: .5;\r\n");
      out.write("	background-color: black;\r\n");
      out.write("	color: aliceblue;\r\n");
      out.write("	border-radius: 50%;\r\n");
      out.write("	/* padding: 10px; */\r\n");
      out.write("	width: 32px;\r\n");
      out.write("	height: 32px;\r\n");
      out.write("	display: flex;\r\n");
      out.write("	align-items: center;\r\n");
      out.write("	justify-content: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".modal-form .modal-header .inner-image {\r\n");
      out.write("	height: 40px;\r\n");
      out.write("	width: auto;\r\n");
      out.write("	margin-bottom: 6px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".button {\r\n");
      out.write("	background: -webkit-linear-gradient(-30deg, #f57f20, #d62b08 100%);\r\n");
      out.write("	color: #fff;\r\n");
      out.write("	border-radius: 10px;\r\n");
      out.write("	border: 1px solid;\r\n");
      out.write("	padding: 10px 30px;\r\n");
      out.write("	width: 100%;\r\n");
      out.write("	font-weight: 600;\r\n");
      out.write("}\r\n");
      out.write("/*bo gốc cho form*/\r\n");
      out.write(".modal-form .modal-content {\r\n");
      out.write("	border-radius: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
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
      out.write(".inner-wrap {\r\n");
      out.write("	padding: 30px;\r\n");
      out.write("	border: 1px solid blue;\r\n");
      out.write("	width: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".row {\r\n");
      out.write("	margin-bottom: 30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a{\r\n");
      out.write("	font-size: 50px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".modal-form .modal-body {\r\n");
      out.write("	display: flex;\r\n");
      out.write("	justify-content: center;\r\n");
      out.write("	align-items: center;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("	\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<h1>DAY LA TRANG Guide</h1>\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<div class=\"col-12\">\r\n");
      out.write("				<div class=\"inner-wrap\">\r\n");
      out.write("					<h2>\r\n");
      out.write("						Hướng dẫn chung: <br> Bài kiểm tra được chia ra làm hai phần:\r\n");
      out.write("						Phần Nghe và phần Đọc.\r\n");
      out.write("					</h2>\r\n");
      out.write("					<h4>Section I: Listening ( Phần I : Nghe)</h4>\r\n");
      out.write("					<p>Thời gian làm phần kiểm tra Nghe là 45 phút. Bao gồm 4 phần\r\n");
      out.write("						từ Part 1 – Part 4. Bạn sẽ lần lượt lắng nghe và chọn câu trả lời\r\n");
      out.write("						đúng nhất tương ứng với câu hỏi được đặt ra bằng cách chọn đáp án\r\n");
      out.write("						đúng trên hệ thống</p>\r\n");
      out.write("					<h4>Section II: Reading (Đọc – hiểu)</h4>\r\n");
      out.write("					<p>Chuyên mục Đọc- Hiểu. Thời gian cho phần này kéo dài 75\r\n");
      out.write("						phút. Mục này gồm có 3 phần, từ Part 5 – Part 7. Bạn được khuyến\r\n");
      out.write("						khích trả lời nhiều câu hỏi càng tốt trong thời gian cho phép. Bạn\r\n");
      out.write("						phải đánh dấu câu trả lời của bạn vào phiếu trả lời. Đừng viết câu\r\n");
      out.write("						trả lời của bạn trong đề thi.</p>\r\n");
      out.write("				</div>\r\n");
      out.write("				");

				int number = ((LinkedList<HistoryOfTestModel>) request.getAttribute("historyOfTestModels")).size();
				
      out.write("\r\n");
      out.write("				");

				if (number != 0) {
				
      out.write("\r\n");
      out.write("				<div>\r\n");
      out.write("					<h2>Lịch sử làm bài của bạn</h2>\r\n");
      out.write("					");

					for (HistoryOfTestModel h : (LinkedList<HistoryOfTestModel>) request.getAttribute("historyOfTestModels")) {
					
      out.write("\r\n");
      out.write("					<div>\r\n");
      out.write("						<p>\r\n");
      out.write("							Ngày thực hiện:\r\n");
      out.write("							");
      out.print(h.showDate());
      out.write(", Diem:\r\n");
      out.write("							");
      out.print(h.getScore());
      out.write("\r\n");
      out.write("						</p>\r\n");
      out.write("						<!-- Button trigger modal -->\r\n");
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("					");

					}
					
      out.write("\r\n");
      out.write("					<button type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\"\r\n");
      out.write("						data-target=\"#exampleModal\">LÀM LẠI ĐỀ THI</button>\r\n");
      out.write("\r\n");
      out.write("					<!-- Modal -->\r\n");
      out.write("					<div class=\"modal fade modal-form\" id=\"exampleModal\" tabindex=\"-1\"\r\n");
      out.write("						aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("						<div class=\"modal-dialog modal-dialog-centered\">\r\n");
      out.write("							<div class=\"modal-content\">\r\n");
      out.write("								<div class=\"modal-header\">\r\n");
      out.write("									<img class=\"inner-image\"\r\n");
      out.write("										src=\"https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F\"\r\n");
      out.write("										alt=\"\">\r\n");
      out.write("									<h5 class=\"inner-title\" id=\"exampleModalLabel\">Bắt Đầu Làm\r\n");
      out.write("										Bài</h5>\r\n");
      out.write("									<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\r\n");
      out.write("										aria-label=\"Close\">\r\n");
      out.write("										<span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("									</button>\r\n");
      out.write("								</div>\r\n");
      out.write("								\r\n");
      out.write("								<div class=\"modal-body\">\r\n");
      out.write("								\r\n");
      out.write("												");
// the aaaa 
      out.write("\r\n");
      out.write("								<a href=\"/MVC/tests/start?testsID=");
      out.print(request.getParameter("testsID"));
      out.write("\">\r\n");
      out.write("								DONG Y\r\n");
      out.write("								</a>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				");

				} else {
				
      out.write("\r\n");
      out.write("				<button type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\"\r\n");
      out.write("					data-target=\"#exampleModal\">LÀM ĐỀ THI</button>\r\n");
      out.write("\r\n");
      out.write("				<!-- Modal -->\r\n");
      out.write("				<div class=\"modal fade modal-form\" id=\"exampleModal\" tabindex=\"-1\"\r\n");
      out.write("					aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("					<div class=\"modal-dialog modal-dialog-centered\">\r\n");
      out.write("						<div class=\"modal-content\">\r\n");
      out.write("							<div class=\"modal-header\">\r\n");
      out.write("								<img class=\"inner-image\"\r\n");
      out.write("									src=\"https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F\"\r\n");
      out.write("									alt=\"\">\r\n");
      out.write("								<h5 class=\"inner-title\" id=\"exampleModalLabel\">Bắt Đầu Làm\r\n");
      out.write("									Bài</h5>\r\n");
      out.write("								<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\r\n");
      out.write("									aria-label=\"Close\">\r\n");
      out.write("									<span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("								</button>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"modal-body\">\r\n");
      out.write("								<!-- <form method action=\"/MVC/tests/start?testsID=");
      out.print(request.getParameter("testsID"));
      out.write("\">\r\n");
      out.write("								the a\r\n");
      out.write("								</a>\r\n");
      out.write("									<div class=\"row\">\r\n");
      out.write("										<div class=\"col-12\">\r\n");
      out.write("\r\n");
      out.write("											<button class=\"button\">Đồng ý</button>\r\n");
      out.write("										</div>\r\n");
      out.write("									</div>\r\n");
      out.write("								</form>\r\n");
      out.write("								-->\r\n");
      out.write("								<a href=\"/MVC/tests/start?testsID=");
      out.print(request.getParameter("testsID"));
      out.write("\"> DONG Y </a>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				");

				}
				
      out.write("\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
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
