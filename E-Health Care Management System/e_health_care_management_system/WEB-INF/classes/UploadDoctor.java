import java.io.File;
import java.io.IOException;
import Model.*;
import java.util.*;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/UploadDoctor")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UploadDoctor extends HttpServlet {
    private static final String SAVE_DIR = "doctorImages";
     
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//// Logic for Upload the File ////
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
		long unixTime = System.currentTimeMillis() / 1000L;
	
		Part part;
        part = request.getPart("doctor_image");
        String fileName = extractFileName(part);
        if(!fileName.equals("")) {
			fileName = unixTime+"_"+extractFileName(part);
			part.write(savePath + File.separator + fileName);
		} else {
			fileName = request.getParameter("image_name");
		}
		//// Upload File Complete///
		
		/////Save the Doctor Details /////
		Doctor doctorObj = new Doctor();
		String emp_id = "0";
		if((request.getParameter("act")).equals("Save"))
		{
			HashMap results = new HashMap();

			results.put("doctor_name",request.getParameter("doctor_name"));
			results.put("doctor_fees",request.getParameter("doctor_fees"));
			results.put("doctor_qualification",request.getParameter("doctor_qualification"));
			results.put("doctor_address",request.getParameter("doctor_address"));
			results.put("doctor_contact",request.getParameter("doctor_contact"));
			results.put("doctor_id",request.getParameter("doctor_id"));
			results.put("doctor_specialization",request.getParameter("doctor_specialization"));
			results.put("doctor_email",request.getParameter("doctor_email"));
			results.put("doctor_image",fileName);
					
			if((request.getParameter("doctor_id")).equals(""))
			{
				doctorObj.saveDoctor(results);
				request.setAttribute("message", "Doctor Saved Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-doctor.jsp").forward(request, response);
			}
			else
			{
				results.put("doctor_id",request.getParameter("doctor_id"));
				doctorObj.updateDoctor(results);
				request.setAttribute("message", "Doctor Updated Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-doctor.jsp").forward(request, response);
			}
		}
    }
    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
