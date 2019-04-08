package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;

import common.SqlHelper;

public class UserDeliveryAllListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		// 获得人员详情
		List<Map<String, String>> deliveryList = getDeliveryAllList(id);
		String result = JSON.toJSONString(deliveryList);
		
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private List<Map<String, String>> getDeliveryAllList(String id) {
		// sql 语句
		StringBuilder sql = new StringBuilder();
		sql.append("select b.login_name, p.salary, p.title,p.address, d.status, d.delivery_date from delivery d ")
			.append("left join business b on d.business_id = b.id ")
			.append("left join position p on d.position_id = p.id ")
			.append("where d.user_id ='")
			.append(id).append("' ");
		// 增加排序条间
		sql.append("order by d.delivery_date desc ");

		// 查询
		SqlHelper helper = new SqlHelper();
		return helper.getDataBySql(sql.toString());
	}
	
}
