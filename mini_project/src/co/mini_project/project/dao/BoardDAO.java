package co.mini_project.project.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.mini_project.project.common.DAO;
import co.mini_project.project.vo.BoardVO;

public class BoardDAO extends DAO {

	private PreparedStatement psmt;
	private ResultSet rs;

	public ArrayList<BoardVO> boardList() {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		BoardVO vo;
		String sql = "select * from board order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new BoardVO();
				vo.setmId(rs.getString("mId"));
				vo.setbNumber(rs.getInt("bNumber"));
				vo.setbKind(rs.getString("bKind"));
				vo.setbTitle(rs.getString("bTitle"));
				vo.setbContent(rs.getString("bContent"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public BoardVO boardSelect(BoardVO vo) {
		String sql = "select * from board where bNumber = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getbNumber());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVO();
				vo.setmId(rs.getString("mId"));
				vo.setbNumber(rs.getInt("bNumber"));
				vo.setbKind(rs.getString("bKind"));
				vo.setbTitle(rs.getString("bTitle"));
				vo.setbContent(rs.getString("bContent"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	
	public int boardInsert(BoardVO vo ) {
		int n = 0;
		String sql = "insert into board values(pro_seq.nextval, ?, ?, ? , ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getbTitle());
			psmt.setString(2, vo.getbKind());
			psmt.setString(3, vo.getbContent());
			psmt.setString(4, vo.getmId());
			
			n = psmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
	}
	
	public int boardEdit(BoardVO vo) {
		int n = 0;
		String sql = "update board set btitle=?, bcontent=?, BKIND=? where bnumber=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getbTitle());
			psmt.setString(2, vo.getbContent());
			psmt.setString(3, vo.getbKind());
			psmt.setInt(4, vo.getbNumber());
			
			n = psmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
	}
	
	public int boardDelete(BoardVO vo) {
		int n = 0;
		String sql = "delete from board where bNumber=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getbNumber());
			
			n = psmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
	}

	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
