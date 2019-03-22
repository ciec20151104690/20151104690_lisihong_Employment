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

public class BusinessDeliveryHistoryListServlet extends HttpServlet {

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
		String userName = req.getParameter("userName");
		String positionName = req.getParameter("positionName");
		// 获得当前登录企业的id
		String businessId = (String) req.getSession().getAttribute("business_id");
		// 通过查询条件获得数据
		List<Map<String, String>> deliveryList = getDeliveryList(businessId, userName, positionName, curPage);
		int count  = getDeliveryListCount(businessId, userName, positionName);
		int pageNum = count % 8 == 0 ? count / 8 : count / 8 + 1;
		// 设置前台的参数
		req.setAttribute("deliveryList", deliveryList);
		req.setAttribute("userName", userName);
		req.setAttribute("positionName", positionName);
		req.setAttribute("curPage", curPage);
		req.setAttribute("pageNum", pageNum);

		req.getRequestDispatcher("/jsp/business/delivery-history-list.jsp").forward(req, resp);

	}

	private List<Map<String, String>> getDeliveryList(String businessId, String userName, String positionName, int curPage) {
		// sql 语句
		StringBuilder sql = new StringBuilder();
		sql.append("select d.id, u.user_id,u.login_name,u.education,u.university,u.contack_num, p.title,p.address, d.status from delivery d ")
			.append("left join (select id as user_id, login_name,education,university, contack_num from user) u ")
			.append("on d.user_id = u.user_id left join position p on d.position_id = p.id ")
			.append("where d.status <> 0 and d.business_id ='")
			.append(businessId).append("' ");
		if (!StringUtils.isNullOrEmpty(userName)) {
			sql.append("and u.login_name like '%").append(userName).append("%' ");
		}

		if (!StringUtils.isNullOrEmpty(positionName)) {
			sql.append("and p.title like '%").append(positionName).append("%' ");
		}
		// 增加排序条间
		sql.append("order by delivery_date desc ");

		int start = (curPage - 1) * 8;
		sql.append(" limit ").append(start).append(", 8;");

		// 查询
		SqlHelper helper = new SqlHelper();
		return helper.getDataBySql(sql.toString());
	}

	private int getDeliveryListCount(String businessId, String userName, String positionName) {
		// sql 语句
		StringBuilder sql = new StringBuilder();
		sql.append("select count(d.id) from delivery d ")
			.append("left join (select id as user_id, login_name,education,university, contack_num from user) u ")
			.append("on d.user_id = u.user_id left join position p on d.position_id = p.id ")
			.append("where d.status <> 0 and d.business_id ='")
			.append(businessId).append("' ");
		if (!StringUtils.isNullOrEmpty(userName)) {
			sql.append("and u.login_name like '%").append(userName).append("%' ");
		}

		if (!StringUtils.isNullOrEmpty(positionName)) {
			sql.append("and p.title like '%").append(positionName).append("%' ");
		}

		// 查询
		SqlHelper helper = new SqlHelper();
		return helper.getCountBySql(sql.toString());
	}

}
