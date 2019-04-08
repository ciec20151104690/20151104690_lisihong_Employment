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


public class UserDeliverySaveServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = req.getParameter("userId");
		String businessId = req.getParameter("businessId");
		String positionId = req.getParameter("positionId");
		
		
		String result = "ERROR";
		
		if (saveDelivery(userId, businessId, positionId)) {
			// 登录成功
			result = "SUC";
		} else {
			result = "用户名或密码错误";
		}
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private boolean saveDelivery(String userId, String businessId, String positionId) {
		String uuid = UuidUtil.getUUID();
		StringBuilder sql = new StringBuilder();
		sql.append("insert into delivery values('").append(uuid).append("','")
			.append(businessId).append("','").append(positionId).append("','")
			.append(userId).append("', now(), 0)");
		
		SqlHelper helper = new SqlHelper();
		return helper.executeBySql(sql.toString());
	}

	
	
}
