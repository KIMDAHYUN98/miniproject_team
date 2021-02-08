package co.mini_project.project.app.food;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;
import co.mini_project.project.dao.FoodDAO;
import co.mini_project.project.vo.FoodVO;

public class FoodInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 메뉴 입력
		FoodDAO dao = new FoodDAO();
		FoodVO vo = new FoodVO();
		vo.setmKind(request.getParameter("mKind"));
		vo.setmName(request.getParameter("mName"));
		vo.setmPrice(request.getParameter("mPrice"));
		vo.setmContent(request.getParameter("mContent"));
//		vo.setImage(request.getParameter("image"));
		
		dao.insert(vo);

		return "foodList.do";
	}
}