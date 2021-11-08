package JewelsShop.Controller.Mail;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Controller.User.BaseController;

@Controller
public class MailerController extends BaseController {

	@Autowired
	JavaMailSender mailer;

	@RequestMapping(value = { "/quan-tri/hop-thu" })
	public ModelAndView index() {
		mvShare.setViewName("admin/mail/form");
		return mvShare;
	}

	@RequestMapping(value = { "/quan-tri/hop-thu/{email:.+}" })
	public ModelAndView getIndex(@PathVariable String email) {
		mvShare.addObject("toUser", email);
		mvShare.setViewName("admin/mail/form");
		return mvShare;
	}

	@RequestMapping("/quan-tri/send")
	public ModelAndView send(ModelMap model, @RequestParam("to") String to, @RequestParam("subject") String subject,
			@RequestParam("body") String body) {
		try {
			String from = "luongsang010@gmail.com";
			// Tao mail
			MimeMessage mail = mailer.createMimeMessage();
			// Su dung lop tro giup
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			if (to.trim().isEmpty() || subject.trim().isEmpty() || body.trim().isEmpty()) {
				mvShare.addObject("message", "Vui lòng điền đầy đủ thông tin!");
			} else {
				helper.setTo(to);
				helper.setReplyTo(from, from);
				helper.setSubject(subject);
				helper.setText(body, true);

				// Gui mail
				mailer.send(mail);
				mvShare.addObject("message", "Gửi mail thành công");
				
			}

		} catch (Exception e) {
			mvShare.addObject("message", "Gửi mail thất bại!\n" + e.toString());
		}
		mvShare.setViewName("admin/mail/form");
		return mvShare;
	}
	
	@RequestMapping("/quan-tri/hop-thu/send")
	public ModelAndView send2(ModelMap model, @RequestParam("to") String to, @RequestParam("subject") String subject,
			@RequestParam("body") String body) {
		try {
			String from = "luongsang010@gmail.com";
			// Tao mail
			MimeMessage mail = mailer.createMimeMessage();
			// Su dung lop tro giup
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			if (to.trim().isEmpty() || subject.trim().isEmpty() || body.trim().isEmpty()) {
				mvShare.addObject("message", "Vui lòng điền đầy đủ thông tin!");
			} else {
				helper.setTo(to);
				helper.setReplyTo(from, from);
				helper.setSubject(subject);
				helper.setText(body, true);

				// Gui mail
				mailer.send(mail);
				mvShare.addObject("message", "Gửi mail thành công");
				
			}

		} catch (Exception e) {
			mvShare.addObject("message", "Gửi mail thất bại!\n" + e.toString());
		}
		mvShare.setViewName("admin/mail/form");
		return mvShare;
	}
}
