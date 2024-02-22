package kr.co.namu;

import java.io.File;
import java.util.concurrent.ConcurrentHashMap.KeySetView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import board.BoardCommentVO;
import board.BoardPage;
import board.BoardServiceImpl;
import board.BoardVO;
import common.CommonService;
import member.MemberVO;


@Controller
public class BoardController {
	@Autowired private BoardServiceImpl service;
	@Autowired private BoardPage page;
	@Autowired private CommonService common;
	
	//방명록 목록 화면 요청================================================================
	@RequestMapping("/list.bo")
	public String list(HttpSession session, Model model, @RequestParam(defaultValue = "1") int curPage, String search, String keyword
			,@RequestParam(defaultValue = "10") int pageList, @RequestParam(defaultValue= "list" ) String viewType) {
		//DB에서 방명록 정보를 조회해와 목록 화면에 출력
		session.setAttribute("category", "bo");
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		page.setViewType(viewType);
		
		model.addAttribute("page", service.board_list(page));
		
		return "board/list";
	} //list()
	
	//방명록 신규 화면 요청 ================================================================
	 @RequestMapping("/new.bo")
	 public String board() {
		 //방명록 글쓰기 화면으로 연결
		 return "board/new";
	 } // board
	 
	//신규 방명록 저장 처리 요청 ===============================================
	 
	 @RequestMapping("/insert.bo")
	 public String insert(BoardVO vo, MemberVO mvo, MultipartFile file, HttpSession session) {
		 //화면에서 입력한 정보를 db에 저장한 후 목록 화면으로 연결
		 if(!file.isEmpty()) {
			 vo.setFilename(file.getOriginalFilename());
			 vo.setFilepath(common.upload("board", file, session));
		 }
		 vo.setWriter(((MemberVO) session.getAttribute("login_info")).getId());		 
		 vo.setMfilepath(mvo.getFilepath());
		 service.board_insert(vo);
		 return "redirect:list.bo";
	 }//insert()
	 
	 //방명록 상세 화면 요청 ====================================================================
	 @RequestMapping("/detail.bo")
	 public String detail(int id, Model model) {
		 //선택한 방명록 글을 db에서 조회해 상세 화면에 출력
		 System.out.println("id=:" + id);
		 service.board_read(id);
		 model.addAttribute("vo", service.board_detail(id));
		 model.addAttribute("page", page);
		 model.addAttribute("crlf","\r\n");
		 
		 return "board/detail";
	 } // detail()
	 
	 //방명록 다운로드 ==================================================================
	 
	 @ResponseBody
	 @RequestMapping("/download.bo")
	 public void download(int id, HttpSession session, HttpServletResponse response) {
		 //해당 글의 첨부 파일 저옵를 죄해해서 다운로드 한다.
		 BoardVO vo = service.board_detail(id);
		 common.download(vo.getFilename(), vo.getFilepath(), session, response);
		 
	 }//download()
	 
	 //방명록 수정 화면 요청 ===============================================================
	 @RequestMapping("/modify.bo")
	 public String modify(int id, Model model) {
		 //선택한 방명록 글의 정보를 db에서 조회해 수정 화면에 출력
		 model.addAttribute("vo", service.board_detail(id));
		 return "board/modify";
		
	 }//modify()
	 
	 // 방명록 수정(update) 요청
	 @RequestMapping("/update.bo")
	 public String update(BoardVO vo, MultipartFile file, HttpSession session, String attach, Model model) {
		 //화면에서 입력한 정보를 bb에 변경,저장한후 상세 화면으로 연결
		// BoardVO board = service.board_detail(vo.getBid());
	//	 String uuid = session.getServletContext().getRealPath("resource")+ board.getFilepath();
     if(!file.isEmpty()) {
    	 vo.setFilename(file.getOriginalFilename());
    	 vo.setFilepath(common.upload("board", file, session));
     
		 
			/*
			 * if(board.getFilename() != null) { File f = new File(uuid); if((f.exists()))
			 * {f.delete();} }
			 */
     } else {
    	 //파일 첨부가 없는 경우 = if에 없고, else는 있었는데, 그대로 사용할 경우
			/*
			 * if(attach.isEmpty()) { File f = new File(uuid); if((f.exists()))
			 * {f.delete();} } else { vo.setFilename(board.getFilename());
			 * vo.setFilepath(board.getFilepath()); }
			 */
     }
     
     service.board_update(vo);
     
     //기존 방법
     //return "redirect:detail.bo?id=" + vo.getId();
     
     //다른 방법
      model.addAttribute("url","detail.bo");
    //  model.addAttribute("id",vo.getId());
      return "board/redirect";
	 }
	 
	 
	 //방명록 삭제 ======================================================================
	  @RequestMapping("/delete.bo")
	  public String delete(int id, Model model) {
		  //선택한 글을 bB에서 삭제한 후 목록 화면으로 연결
		  service.board_delete(id);
		  
		  model.addAttribute("url","list.bo");
		  model.addAttribute("id", id);
		  model.addAttribute("page", page);
		  
		  return "board/redirect";
	  } // delete
	  

	  //댓글 저장 처리 요청 ================================================================
	  @ResponseBody
	  @RequestMapping("/board/comment/insert")
	  public boolean comment_insert(BoardCommentVO vo, HttpSession session) {
		  //화면에서 입력한 정보를 db에 저장한다.
		  vo.setWriter( ((MemberVO) session.getAttribute("login_info")).getId());
		  return service.board_comment_insert(vo) > 0 ? true :false;
	  } //comment_insert()
	  
	  //댓글 목록 조회 요청 =================================================================
	  @RequestMapping("/board/comment/{pid}")
	  public String comment_list(@PathVariable int pid, Model model) {
		  //db에서  댓글 목록을 조회해서 댓글 목록 화면에 출력
		  model.addAttribute("list", service.board_comment_list(pid));
		  //System.out.println("PID: " + pid);
		  return "board/comment/list";
	  } // comment_list()
      
	  //댓글 변경 저장 처리 요청
	  @ResponseBody
	  @RequestMapping(value="/board/comment/update", produces ="application/text; charset=utf-8")
	  public String comment_update(@RequestBody BoardCommentVO vo) {
		  return service.board_comment_update(vo) > 0 ? "성공" : "실패";
	  }//comment_update()
	  
	  //댓글 삭제 처리 요청
	  //ResponseBody : 화면(jsp)으로 연결이 아니라 호출한쪽으로 돌아갈때 사용하는 어노테이션
	  @ResponseBody
	  @RequestMapping("/board/comment/delete/{id}")
	  public void comment_delete(@PathVariable int id) {
		  service.board_comment_delete(id);
	  }//comment_delete()
	  
	  
	  
} //class
