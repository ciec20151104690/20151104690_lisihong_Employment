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

public class BusinessPositionListServlet extends HttpServlet {

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
		String title = req.getParameter("title");
		String address = req.getParameter("address");
		// 获得当前登录企业的id
		String businessId = (String) req.getSession().getAttribute("business_id");
		// 通过查询条件获得数据
		List<Map<String, String>> positionList = getPositionList(businessId, title, address, curPage);
		int count  = getPositionListCount(businessId, title, address);
		int pageNum = count % 8 == 0 ? count / 8 : count / 8 + 1;
		// 设置前台的参数
		req.setAttribute("positionList", positionList);
		req.setAttribute("title", title);
		req.setAttribute("address", address);
		req.setAttribute("curPage", curPage);
		req.setAttribute("pageNum", pageNum);

		req.getRequestDispatcher("/jsp/business/position-list.jsp").forward(req, resp);

	}

	private List<Map<String, String>> getPositionList(String businessId, String title, String address, int curPage) {
		// sql 语句
		StringBuilder sql = new StringBuilder();
		sql.append("select * from position where deleted = 0 and business_id = '")
			.append(businessId).append("' ");
		if (!StringUtils.isNullOrEmpty(title)) {
			sql.append("and title like '%").append(title).append("%' ");
		}

		if (!StringUtils.isNullOrEmpty(address)) {
			sql.append("and address like '%").append(address).append("%' ");
		}
		// 增加排序条间
		sql.append("order by publish_date desc ");

		int start = (curPage - 1) * 8;
		sql.append(" limit ").append(start).append(", 8;");

		// 查询
		SqlHelper helper = new SqlHelper();
		return helper.getDataBySql(sql.toString());
	}

	private int getPositionListCount(String businessId, String title, String address) {
		// sql 语句
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from position where deleted = 0 and business_id = '")
			.append(businessId).append("' ");
		if (!StringUtils.isNullOrEmpty(title)) {
			sql.append("and title like '%").append(title).append("%' ");
		}

		if (!StringUtils.isNullOrEmpty(address)) {
			sql.append("and address like '%").append(address).append("%' ");
		}

		// 查询
		SqlHelper helper = new SqlHelper();
		return helper.getCountBySql(sql.toString());
	}

}
