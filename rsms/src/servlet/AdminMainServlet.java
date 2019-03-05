package servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SqlHelper;

public class AdminMainServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		req.getRequestDispatcher("/jsp/admin/admin-main.jsp").forward(req, resp);

	}
	
	private Map<String, String> getAdminInfo(String adminId) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from admin where id='")
			.append(adminId).append("'");
		SqlHelper helper = new SqlHelper();
		List<Map<String, String>> list = helper.getDataBySql(sql.toString());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	
	
}
