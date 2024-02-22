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
	public BoardVO board_detail(int bid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void board_read(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int board_update(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_comment_insert(BoardCommentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardCommentVO> board_comment_list(int pid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int board_comment_update(BoardCommentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_comment_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
