package JewelsShop.Controller.File;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Controller.User.BaseController;

@Controller
public class FileController extends BaseController {

	@RequestMapping("/upload")
	// @RequestParam("file") encapsulates the file obtained by the name=file control
	// into a CommonsMultipartFile object
	// When uploading files in batches, CommonsMultipartFile can be an array
	public ModelAndView fileUpload(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request)
			throws IOException {

		// Get the file name file.getOriginalFilename()
		String uploadFileName = file.getOriginalFilename();

		// If the file name is empty, go back to the home page directly!
		if ("".equals(uploadFileName)) {
			mvShare.addObject("message", "Upload faile!");
			return mvShare;
		}
		System.out.println("Upload file name: " + uploadFileName);

		// Get the current project path and set the upload file saving path
		String path = request.getServletContext().getRealPath("/assets/user/images/product");
		System.out.println("path: " + path);
		// If the save path does not exist, create one
		File realPath = new File(path);
		if (!realPath.exists()) {
			realPath.mkdir();
		}
		System.out.println("Upload file storage address:" + realPath);

		// File input stream
		InputStream is = file.getInputStream();
		// File output stream
		OutputStream os = new FileOutputStream(new File(realPath, uploadFileName));

		// IO operation
		int len = 0;
		byte[] buffer = new byte[1024];
		while ((len = is.read(buffer)) != -1) {
			os.write(buffer, 0, len);
			os.flush();
		}
		os.close();
		is.close();
		mvShare.addObject("image", "/assets/user/images/product/" + file.getOriginalFilename());
		mvShare.setViewName("admin/upload");
		return mvShare;
	}
}
