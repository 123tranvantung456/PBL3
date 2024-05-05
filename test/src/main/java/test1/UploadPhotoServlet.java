package test1;
import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID; // Import thư viện UUID

@MultipartConfig
@WebServlet("/UploadPhotoServlet")
public class UploadPhotoServlet extends HttpServlet {
    
    public UploadPhotoServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the upload.jsp page for displaying the upload form
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/upload.jsp");
        requestDispatcher.forward(request, response);
    }
    // part : lay tu form
    // realPart: đường dẫn trong máy chủ đến thư mục để lưu
    // originalFileName: đường dẫn tệp gửi lên
    // fileName: tên đường dẫn trong máy chủ 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy giá trị của tham số 'id' từ yêu cầu POST
            String id = request.getParameter("id");
            
            // Lấy phần dữ liệu được gửi lên với tên 'photo' từ yêu cầu POST
            Part part = request.getPart("photo");
            System.out.println("part: "+part.toString());
            // Lấy đường dẫn thực sự của thư mục lưu trữ hình ảnh trong ứng dụng web
            System.out.println("xxxx"+  request.getServletContext());
            String realPart = request.getServletContext().getRealPath("/images"); 
            System.out.println("realpart: "+realPart);
            // Lấy tên tệp từ phần dữ liệu được gửi lên
            String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            System.out.println("originalFileName "+originalFileName);
            // Thay đổi tên tệp nếu trùng tên
            String fileName = getUniqueFileName(realPart, originalFileName);
            System.out.println("fileName " +fileName);
            // Tạo thư mục lưu trữ hình ảnh nếu nó không tồn tại
            if (!Files.exists(Paths.get(realPart))) {
                Files.createDirectories(Paths.get(realPart));
            }
             
            // Ghi hình ảnh vào thư mục đã chỉ định
            part.write(Paths.get(realPart, fileName).toString()); 
            String strx = "images/" + fileName; 
            // Chuyển hướng người dùng sau khi tải lên thành công (có thể bạn muốn chuyển hướng đến trang khác)
            try (PrintWriter printWriter = response.getWriter(); ){
                printWriter.write("<!DOCTYPE html>\r\n"
        				+ "<html lang=\"en\">\r\n"
        				+ "<head>\r\n"
        				+ "    <meta charset=\"UTF-8\">\r\n"
        				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
        				+ "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">\r\n"
        				+ "    \r\n"
        				+ "    <title>Document</title>\r\n"
        				+ "</head>\r\n"
        				+ "<body>\r\n"
        			
        				+ "<video>"
        				+ "<source src =" + strx + " type=video/mp4>"
        				+ "</video>"
        				+ "<img src =" + strx + ">"
        				+ "</body>\r\n"
        				+ "</html>");
            
			} catch (Exception e) {
				// TODO: handle exception
			}
        } catch (Exception e) {
            // Xử lý ngoại lệ nếu có bất kỳ lỗi nào xảy ra
            e.printStackTrace(); // In ra thông tin lỗi vào console hoặc log
            
            // Phản hồi với lỗi nếu có ngoại lệ
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request: " + e.getMessage());
        }
    }
    
    // Phương thức để tạo tên tệp duy nhất nếu trùng tên
    private String getUniqueFileName(String directory, String fileName) {
    	System.out.println(111111111); 
        Path path = Paths.get(directory, fileName);
        if (Files.exists(path)) {
            String baseName = fileName.substring(0, fileName.lastIndexOf('.'));
            String extension = fileName.substring(fileName.lastIndexOf('.'));
            String uniqueName = baseName + "_" + UUID.randomUUID().toString() + extension;
            return getUniqueFileName(directory, uniqueName);
        }
        return fileName;
    }

}
