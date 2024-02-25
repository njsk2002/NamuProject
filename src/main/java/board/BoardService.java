package board;

import java.util.List;

public interface BoardService {
	
	//CRUD
	
	int board_insert(BoardVO vo);
	BoardPage board_list(BoardPage page);
	BoardVO board_detail(int bno);
	void board_read(int bno);
	int board_update(BoardVO vo);
	int board_delete(int bno);
	
	int board_comment_insert(BoardCommentVO vo);
	List<BoardCommentVO> board_comment_list(int bno);
	int board_comment_update(BoardCommentVO vo);
	int board_comment_delete(int cno);


}
