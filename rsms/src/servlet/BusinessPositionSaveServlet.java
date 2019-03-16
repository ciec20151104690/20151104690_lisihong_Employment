package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SqlHelper;
import common.UuidUtil;

public class BusinessPositionSaveServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String address = req.getParameter("address");
		String salary = req.getParameter("salary");
		String experience = req.getParameter("experience");
		String degree = req.getParameter("degree");
		String description = req.getParameter("description");
		// 获得企业的登录标识
		String businessId = (String) req.getSession().getAttribute("business_id");
		String result = "FAIL";
		if (savePosition(businessId, title, address, salary, experience, degree, description)) {
			result = "SUC";
		}
		
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private boolean savePosition(String businessId, String title, String address, String salary, 
			String experience, String degree, String description) {
		// 生成uuid
		String uuid = UuidUtil.getUUID();
		StringBuilder sql = new StringBuilder();
		sql.append("insert into position values('")
			.append(uuid).append("','")
			.append(businessId).append("','")
			.append(title).append("','")
			.append(address).append("',now(),'")
			.append(salary).append("','")
			.append(experience).append("','")
			.append(degree).append("','")
			.append(description).append("', 0)");
		
		// 执行sql
		SqlHelper helper = new SqlHelper();
		return helper.executeBySql(sql.toString());
	}
	
}
