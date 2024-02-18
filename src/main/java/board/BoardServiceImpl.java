package board;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Override
	public int board_insert(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO board_detail(int id) {
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
