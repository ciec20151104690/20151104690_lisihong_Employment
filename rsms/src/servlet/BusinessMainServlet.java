package servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SqlHelper;

public class BusinessMainServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 通过id，获得企业的信息
		String businessId = (String) req.getSession().getAttribute("business_id");
		Map<String, String> businessInfo = getBusinessInfoById(businessId);
		req.setAttribute("businessInfo", businessInfo);
		
		req.getRequestDispatcher("/jsp/business/business-main.jsp").forward(req, resp);

	}
	
	private Map<String, String> getBusinessInfoById(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from business where id='")
			.append(id).append("'");
		
		SqlHelper helper = new SqlHelper();
		List<Map<String, String>> list = helper.getDataBySql(sql.toString());
		if (list != null && list.size() == 1) {
			return list.get(0);
		}
		return null;
	}
	
}
