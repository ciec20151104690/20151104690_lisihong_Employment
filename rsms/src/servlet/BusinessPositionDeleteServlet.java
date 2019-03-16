package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SqlHelper;

public class BusinessPositionDeleteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		String result = "FAIL";
		if (deletePositionById(id)) {
			result = "SUC";
		}
		
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private boolean deletePositionById(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("update position set deleted = 1 where id ='")
			.append(id).append("'");
		// 执行sql
		SqlHelper helper = new SqlHelper();
		return helper.executeBySql(sql.toString());
	}
	
}
