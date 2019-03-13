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

import common.SqlHelper;

public class AdminUserDetailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		// 获得人员详情
		Map<String, String> user = getUserDetailById(id);
		String result = JSON.toJSONString(user);
		
		resp.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();
	}
	
	private Map<String, String> getUserDetailById(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from user where id ='")
			.append(id).append("'");
		// 执行sql
		SqlHelper helper = new SqlHelper();
		List<Map<String, String>> list = helper.getDataBySql(sql.toString());
		if (list != null || list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
}
