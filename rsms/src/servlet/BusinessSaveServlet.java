package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SqlHelper;

public class BusinessSaveServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String login_name = req.getParameter("login_name");
		String city = req.getParameter("city");
		String scale = req.getParameter("scale");
		String website = req.getParameter("website");
		String intoduce = req.getParameter("intoduce");
		
		String result = "FAIL";
		if (saveBusiness(id, login_name, city, scale, website, intoduce)) {
			result = "SUC";
		}
		
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private boolean saveBusiness(String id, String login_name, String city, 
			String scale, String website, String intoduce) {
		StringBuilder sql = new StringBuilder();
		sql.append("update business set login_name = '")
			.append(login_name).append("',city='")
			.append(city).append("',scale='")
			.append(scale).append("',website='")
			.append(website).append("', intoduce='")
			.append(intoduce).append("' ")
			.append("where id='").append(id).append("'");
		// 执行sql
		SqlHelper helper = new SqlHelper();
		return helper.executeBySql(sql.toString());
	}
	
}
