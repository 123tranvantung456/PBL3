package Fiter;

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
        this.servletContext = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
        String urlString = httpServletRequest.getRequestURI();
        if (urlString.startsWith("/admin")) {
            HttpSession session = httpServletRequest.getSession(false);
            UserModel userModel = (UserModel) (session != null ? session.getAttribute("user") : null);
            // Đã đăng nhập
            if (userModel != null) {
                // Kiểm tra quyền truy cập
                if (userModel.getUserID() == 1)
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/");
                else if (userModel.getUserID() == 13)
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/admin/users");
            } else {
                // Chưa đăng nhập, chuyển hướng đến trang đăng nhập
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login");
            }
        } else {
            // Nếu URL không bắt đầu với "/admin", cho phép truy cập tiếp theo
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        // Công việc clean-up
    }
}
