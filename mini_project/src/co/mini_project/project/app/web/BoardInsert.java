package co.mini_project.project.app.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;
import co.mini_project.project.dao.BoardDAO;
import co.mini_project.project.vo.BoardVO;

public class BoardInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO boardInsert.do 글쓰기
		
		BoardVO vo = new BoardVO();
		BoardDAO dao = new BoardDAO();
		
		vo.setmId(request.getParameter("mId"));
		vo.setmTel(request.getParameter("mTel"));
		vo.setmEmail(request.getParameter("mEmail"));
		vo.setbKind(request.getParameter("bKind"));
		vo.setbContent(request.getParameter("bContent"));
		vo.setbTitle(request.getParameter("bTitle"));
		
		int n = dao.boardInsert(vo);
		
		String viewPage = "board.do";
		
		if(n == 0) {
			viewPage = "board/boardInsertFail";
		}
		
		return viewPage;
	}

}
