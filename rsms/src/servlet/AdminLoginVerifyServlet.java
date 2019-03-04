package servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
		if (verify(loginId, password)) {
			// 登录成功
			result = "SUCCESS";
			// 放入到session中
			req.getSession().setAttribute("admin_id", loginId);
		} else {
			result = "用户名或密码错误";
		}
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private boolean verify(String loginId, String password) {
		// 拼sql
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from admin where login_num = '")
			.append(loginId).append("' and password='")
			.append(password).append("'");
		
		SqlHelper helper = new SqlHelper();
		return helper.getCountBySql(sql.toString()) == 1 ? true : false;
	}

	
	
}
