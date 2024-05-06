package com.pbl3.filter;

import java.io.IOException;

import com.pbl3.model.UserModel;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/*"})
public class AuthorizationFilter implements Filter {
    private ServletContext servletContext;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    	System.out.println("goi init fiter");
        this.servletContext = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
    	System.out.println("goi doFilter");
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
        String urlString = httpServletRequest.getRequestURI();
        System.out.println("urlString la: " +urlString);
        if (urlString.startsWith("/MVC/admin")) {
        	System.out.println("la addd"); 
            HttpSession session = httpServletRequest.getSession();
            UserModel userModel = (UserModel) (session != null ? session.getAttribute("user") : null);
            // Đã đăng nhập
            if (userModel != null) {
            	System.out.println("ID userModel : " +userModel.getUserID());
                // Kiểm tra quyền truy cập
                if ((userModel.getRoleModel().getRoleName()).equals("Học Viên")) 
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/");
                else if ((userModel.getRoleModel().getRoleName()).equals("Giáo Viên")) {
                	httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/teacher");
                }
                else if ((userModel.getRoleModel().getRoleName()).equals("Quản Trị Viên")) {
                	System.out.println("vao thoai mai");
                    // Nếu URL bắt đầu với "/admin", nhung ban la admin => cho phép truy cập tiếp theo
                    filterChain.doFilter(servletRequest, servletResponse);
                }
                System.out.println(userModel.getRoleModel().getRoleName() + "aaaaaaaaaaaaaaaa");
            }  
            else { 
            	System.out.println("chua dang nhap cu oi");
                // Chưa đăng nhập, chuyển hướng đến trang đăng nhập
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login");
            }
        } 
        
        else if (urlString.startsWith("/MVC/teacher")) {
            HttpSession session = httpServletRequest.getSession();
            UserModel userModel = (UserModel) (session != null ? session.getAttribute("user") : null);
            // Đã đăng nhập
            if (userModel != null) {
            	System.out.println("ID userModel : " +userModel.getUserID());
                // Kiểm tra quyền truy cập
                if ((userModel.getRoleModel().getRoleName()).equals("Học Viên")) 
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/");
                else if ((userModel.getRoleModel().getRoleName()).equals("Giáo Viên")) {
                	filterChain.doFilter(servletRequest, servletResponse); 
                }
                else if ((userModel.getRoleModel().getRoleName()).equals("Quản Trị Viên")) {
                	System.out.println("vao thoai mai");
                    // Nếu URL bắt đầu với "/admin", nhung ban la admin => cho phép truy cập tiếp theo
                    filterChain.doFilter(servletRequest, servletResponse);
                } 
            }
            else {
            	System.out.println("chua dang nhap cu oi");
                // Chưa đăng nhập, chuyển hướng đến trang đăng nhập
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login");
            }
        }
        
        else {
        	System.out.println("vao thoai mai");
            // Nếu URL không bắt đầu với "/admin", cho phép truy cập tiếp theo
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        // Công việc clean-up
    }
}
