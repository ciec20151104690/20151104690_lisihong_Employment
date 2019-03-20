package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SqlHelper;

public class BusinessDeliveryChangeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String status = req.getParameter("status");
		
		String result = "FAIL";
		if (changeStatus(id, status)) {
			result = "SUC";
		}
		
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private boolean changeStatus(String id, String status) {
		StringBuilder sql = new StringBuilder();
		sql.append("update delivery set status = ")
			.append(status)
			.append(" where id ='")
			.append(id).append("'");
		// 执行sql
		SqlHelper helper = new SqlHelper();
		return helper.executeBySql(sql.toString());
	}
	
}
