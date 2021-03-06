package servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.StringUtils;

import common.SqlHelper;

public class AdminBusinessListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 翻页信息
		String curPageStr = req.getParameter("curPage");
		int curPage = 1;
		if (!StringUtils.isNullOrEmpty(curPageStr)) {
			curPage = Integer.parseInt(curPageStr);
		}
		// 查询信息
		String city = req.getParameter("city");
		String name = req.getParameter("name");
		// 通过查询条件获得数据
		List<Map<String, String>> businessList = getBusinessList(city, name, curPage);
		int count  = getBusinessListCount(city, name);
		int pageNum = count % 8 == 0 ? count / 8 : count / 8 + 1;
		// 设置前台的参数
		req.setAttribute("businessList", businessList);
		req.setAttribute("city", city);
		req.setAttribute("name", name);
		req.setAttribute("curPage", curPage);
		req.setAttribute("pageNum", pageNum);

		req.getRequestDispatcher("/jsp/admin/business-list.jsp").forward(req, resp);

	}

	private List<Map<String, String>> getBusinessList(String city, String name, int curPage) {
		// sql 语句
		StringBuilder sql = new StringBuilder();
		sql.append("select * from business where deleted = 0 ");
		if (!StringUtils.isNullOrEmpty(city)) {
			sql.append("and city like '%").append(city).append("%' ");
		}

		if (!StringUtils.isNullOrEmpty(name)) {
			sql.append("and login_name like '%").append(name).append("%' ");
		}
		// 增加排序条间
		sql.append("order by login_num desc ");

		int start = (curPage - 1) * 8;
		sql.append(" limit ").append(start).append(", 8;");

		// 查询
		SqlHelper helper = new SqlHelper();
		return helper.getDataBySql(sql.toString());
	}

	private int getBusinessListCount(String city, String name) {
		// sql 语句
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from business where deleted = 0 ");
		if (!StringUtils.isNullOrEmpty(city)) {
			sql.append("and city like '%").append(city).append("%' ");
		}

		if (!StringUtils.isNullOrEmpty(name)) {
			sql.append("and login_name like '%").append(name).append("%' ");
		}

		// 查询
		SqlHelper helper = new SqlHelper();
		return helper.getCountBySql(sql.toString());
	}

}
