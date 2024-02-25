package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements BoardService {
	
	@Autowired
	SqlSession sql;

	@Override
	public int board_insert(BoardVO vo) {
		        
		return sql.insert("board.mapper.insert", vo);
	} 

	@Override
	public BoardPage board_list(BoardPage page) {	
		page.setTotalList((Integer) sql.selectOne("board.mapper.total",page));
		page.setList(sql.selectList("board.mapper.list", page));
		return page;
	}

	@Override
	public BoardVO board_detail(int bno) {
		
		return sql.selectOne("board.mapper.detail", bno);
	}

	@Override
	public void board_read(int bno) {
		sql.update("board.mapper.read", bno);

	}

	@Override
	public int board_update(BoardVO vo) {
		
		return sql.update("board.mapper.update", vo);
	}

	@Override
	public int board_delete(int bno) {

		return sql.delete("board.mapper.delete", bno);
	}

	@Override
	public int board_comment_insert(BoardCommentVO vo) {
		
		return sql.insert("board.mapper.comment_insert", vo);
	}

	@Override
	public List<BoardCommentVO> board_comment_list(int bno) {
	
		return sql.selectList("board.mapper.comment_list", bno);
	}


	@Override
	public int board_comment_update(BoardCommentVO vo) {
	
		return sql.update("board.mapper.comment_update", vo);
	}

	@Override
	public int board_comment_delete(int cno) {
		
		return sql.delete("board.mapper.comment_delete", cno);
	}

}
