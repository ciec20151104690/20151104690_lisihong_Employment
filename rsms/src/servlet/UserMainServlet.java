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

public class UserMainServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 翻页信息
		String curPageStr = req.getParameter("curPage");
		int curPage = 1;
		if (!StringUtils.isNullOrEmpty(curPageStr)) {
			curPage = Integer.parseInt(curPageStr);
		}
		// 获得所有的岗位信息，每20进行分页
		List<Map<String, String>> positionList = getPosition(curPage);
		int count  = getPositionCount();
		int pageNum = count % 20 == 0 ? count / 20 : count / 20 + 1;

		// 获得登陆人标识
		String user_id = req.getSession().getAttribute("user_id") == null ? "" : req.getSession().getAttribute("user_id").toString();
		String user_name = req.getSession().getAttribute("user_name") == null ? "" : req.getSession().getAttribute("user_name").toString();
		
		req.setAttribute("user_id", user_id);
		req.setAttribute("user_name", user_name);
		req.setAttribute("positionList", positionList);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("curPage", curPage);
		req.getRequestDispatcher("/jsp/user/user-main.jsp").forward(req, resp);
	}

	private List<Map<String, String>> getPosition(int curPage) {
		StringBuilder sql = new StringBuilder();
		sql.append("select p.id, p.business_id, p.title, p.address,p.salary,p.degree,p.experience, b.login_name, b.website ")
				.append("from position p left join business b on p.business_id = b.id ")
				.append("where p.deleted = 0 ")
				.append(" order by publish_date desc ");

		int start = (curPage - 1) * 20;
		sql.append(" limit ").append(start).append(", 20;");

		SqlHelper helper = new SqlHelper();
		return helper.getDataBySql(sql.toString());
	}

	private int getPositionCount() {
		StringBuilder sql = new StringBuilder();
		sql.append("select count(p.id) ")
		.append("from position p left join business b on p.business_id = b.id ")
		.append("where p.deleted = 0 ");
		// 查询
		SqlHelper helper = new SqlHelper();
		return helper.getCountBySql(sql.toString());
	}

}
