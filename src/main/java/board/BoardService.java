package board;

import java.util.List;

public interface BoardService {
	
	//CRUD
	
	int board_insert(BoardVO vo);
	BoardPage board_list(BoardPage page);
	BoardVO board_detail(int bid);
	void board_read(int bid);
	int board_update(BoardVO vo);
	int board_delete(int bid);
	
	int board_comment_insert(BoardCommentVO vo);
	List<BoardCommentVO> board_comment_list(int pid);
	int board_comment_update(BoardCommentVO vo);
	int board_comment_delete(int bid);


}
