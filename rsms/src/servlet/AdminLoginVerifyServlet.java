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


public class AdminLoginVerifyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String loginId = req.getParameter("loginId");
		String password = req.getParameter("password");
		String result = "ERROR";
		Map<String, String> admin = verify(loginId, password);
		if (admin != null) {
			// 登录成功
			result = "SUCCESS";
			// 放入到session中
			req.getSession().setAttribute("admin_id", admin.get("id"));
			req.getSession().setAttribute("admin_num", admin.get("login_num"));
			req.getSession().setAttribute("admin_name", admin.get("login_name"));
		} else {
			result = "用户名或密码错误";
		}
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private Map<String, String> verify(String loginId, String password) {
		// 拼sql
		StringBuilder sql = new StringBuilder();
		sql.append("select * from admin where login_num = '")
			.append(loginId).append("' and password='")
			.append(password).append("'");
		
		SqlHelper helper = new SqlHelper();
		List<Map<String, String>> list = helper.getDataBySql(sql.toString());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	
	
}
