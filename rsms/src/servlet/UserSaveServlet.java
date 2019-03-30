package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SqlHelper;
import common.UuidUtil;


public class UserSaveServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String loginNum = req.getParameter("loginNum");
		String loginName = req.getParameter("loginName");
		String password = req.getParameter("password");
		String sex = req.getParameter("sex");
		String nation = req.getParameter("nation");
		String nativePlace = req.getParameter("nativePlace");
		String marialStatus = req.getParameter("marialStatus");
		String birthday = req.getParameter("birthday");
		String education = req.getParameter("education");
		String university = req.getParameter("university");
		String major = req.getParameter("major");
		String address = req.getParameter("address");
		String contackNum = req.getParameter("contackNum");
		String email = req.getParameter("email");
		String schoolExperience = req.getParameter("schoolExperience");
		String workExperience = req.getParameter("workExperience");
		String selfEvaluation = req.getParameter("selfEvaluation");
		String image = req.getParameter("image");
		
		
		String result = "ERROR";
		
		if (saveUser(loginNum, loginName, password, sex,
				nation, nativePlace, marialStatus,
				birthday, education, university,
				major, address, contackNum,
				email, schoolExperience, workExperience,
				selfEvaluation, image)) {
			// 登录成功
			result = "SUC";
		}
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private boolean saveUser(String loginNum, String loginName, String password, String sex,
							String nation, String nativePlace, String marialStatus,
							String birthday, String education, String university,
							String major, String address, String contackNum,
							String email, String schoolExperience, String workExperience,
							String selfEvaluation, String image) {
		
		String uuid = UuidUtil.getUUID();
		StringBuilder sql = new StringBuilder();
		sql.append("insert into user values('").append(uuid).append("','")
			.append(loginNum).append("','").append(loginName).append("','")
			.append(password).append("','").append(sex).append("','")
			.append(nation).append("','").append(nativePlace).append("','")
			.append(birthday).append("','").append(marialStatus).append("','")
			.append(education).append("','").append(university).append("','")
			.append(major).append("','").append(address).append("','")
			.append(contackNum).append("','").append(email).append("','")
			.append(schoolExperience).append("','").append(workExperience).append("','")
			.append(selfEvaluation).append("','").append(image).append("', 0)");
		
		SqlHelper helper = new SqlHelper();
		return helper.executeBySql(sql.toString());
	}

	
	
}
