package co.mini_project.project.app.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mini_project.project.common.Command;
import co.mini_project.project.dao.BoardDAO;
import co.mini_project.project.vo.BoardVO;

public class BoardDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO boardDelete.do 게시판 삭제

		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();

		vo.setbTitle(request.getParameter("mTitle"));

		int n = dao.boardDelete(vo);
		String viewPage = "board.do";

		if (n == 0) {
			viewPage = "board/boardDeleteFail";
		}

		return viewPage;
	}

}
