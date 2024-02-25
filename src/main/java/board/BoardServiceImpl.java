package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO dao;

	@Override
	public int board_insert(BoardVO vo) {
		
		return dao.board_insert(vo);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		
		return dao.board_list(page);
	}

	@Override
	public BoardVO board_detail(int bno) {
		
		return dao.board_detail(bno);
	}

	@Override
	public void board_read(int bno) {
		dao.board_read(bno);
		
	}

	@Override
	public int board_update(BoardVO vo) {
		
		return dao.board_update(vo);
	}

	@Override
	public int board_delete(int bno) {
		
		return dao.board_delete(bno);
	}

	@Override
	public int board_comment_insert(BoardCommentVO vo) {
		
		return dao.board_comment_insert(vo);
	}

	@Override
	public List<BoardCommentVO> board_comment_list(int bno) {
		
		return dao.board_comment_list(bno);
	}

	@Override
	public int board_comment_update(BoardCommentVO vo) {
		
		return dao.board_comment_update(vo);
	}

	@Override
	public int board_comment_delete(int cno) {
		
		return dao.board_comment_delete(cno);
	}

}
