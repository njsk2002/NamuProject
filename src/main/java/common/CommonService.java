package common;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.Servlet;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonService {
	public void sendEmail(String email, String name, HttpSession session) {
		//1. 기본 이메일 전송 처리
		//sendSimple(email, name);
		
		//2. 첨부 파일 있는 이메일 전송 처리
		//session이 있어야 파일 첨부가 가능
		//sendAttach(email, name, session);
		
		//3. HTML 태그 이메일 전송 처리
		sendHtml(email, name, session);

		//4. 공공 데이터 REST API 요청 처리
	}
	 // 일단 사용 안함(첨부없는 이메일)
	private void sendSimple(String email, String name) { 
		SimpleEmail mail =new SimpleEmail();
		
		mail.setHostName("smtp.naver.com"); // 메일 전송 서버 지정,네이버메일 - 환경설정-POP3
		mail.setCharset("utf-8"); //인코딩 설정
		mail.setDebug(true); //메일 전송 과정 추적해서 콘솔에 띄워줌
		
		mail.setAuthentication("아이디", "비밀번호"); //로그인하기 위해 정보 입력
		mail.setSSLOnConnect(true); // 입력한 정보로 로그인 요청
		
		try {
			mail.setFrom("보내는 메일", "관리자"); //보내는 사람 메일/이름 설정
			mail.addTo(email, name); //받는사람 메일 /이름,회원가입 페이지에서 가져온다.
			mail.addTo("받을 메일","수신자");//복수의 사람 지정 가능
			
			mail.setSubject("회원가입 축하"); // 메일 제목
			mail.setMsg(name + "님! 가입을 축하드립니다!"); //메일 내용
			
			mail.send(); //메일발송
		} catch (Exception e) {
		   System.out.println(e.getMessage());
		}		
	}
	
	private void sendAttach(String email, String name, HttpSession session) {
		MultiPartEmail mail = new MultiPartEmail();
		
		mail.setHostName("smtp.naver.com"); // 메일 전송 서버 지정,네이버메일 - 환경설정-POP3
		mail.setCharset("utf-8"); //인코딩 설정
		mail.setDebug(true); //메일 전송 과정 추적해서 콘솔에 띄워줌
		
		mail.setAuthentication("njsk2002", "promise2002"); //로그인하기 위해 정보 입력
		mail.setSSLOnConnect(true); // 입력한 정보로 로그인 요청
		
		try {
			mail.setFrom("njsk2002@naver.com", "관리자"); //보내는 사람 메일/이름 설정
			mail.addTo(email, name); //받는사람 메일 /이름,회원가입 페이지에서 가져온다.
			//mail.addTo("받을 메일","수신자");//복수의 사람 지정 가능
			
			mail.setSubject("첨부 파일 테스트"); // 메일 제목
			mail.setMsg(name + "님! 가입을 축하드립니다!\n 첨부파일 테스트"); //메일 내용
			//mail.setContent("테스트 메일의 내용입니다.", "text/plain; charset=euc-kr"); setContent로 보낼때는 반드시 charset=euc-kr로 표기 필요
			
			//파일 첨부 하기
			EmailAttachment file = new EmailAttachment();
			
			// 물리적 디스크내 파일 첨부
			file.setPath("C:\\upload\\스프링부트파일.txt");
			mail.attach(file);
			
			
			//프로젝트 내의 파일 첨부
		    file = new EmailAttachment();
		    file.setPath(session.getServletContext().getRealPath("C:\\Users\\3232\\Desktop\\profile\\4.jpg"));
			mail.attach(file);
			
			
			
			mail.send(); //메일발송
		} catch (Exception e) {
		   System.out.println(e.getMessage());
		}		
		
		
	}
 
	private void sendHtml(String email, String name, HttpSession session) {
		
		HtmlEmail mail = new HtmlEmail();
		
		mail.setHostName("smtp.naver.com"); // 메일 전송 서버 지정,네이버메일 - 환경설정-POP3
		mail.setCharset("utf-8"); //인코딩 설정
		mail.setDebug(true); //메일 전송 과정 추적해서 콘솔에 띄워줌
		
		mail.setAuthentication("njsk2002", "promise2002"); //로그인하기 위해 정보 입력
		mail.setSSLOnConnect(true); // 입력한 정보로 로그인 요청
	
		try {
			mail.setFrom("njsk2002@naver.com", "관리자"); //보내는 사람 메일/이름 설정
			mail.addTo(email, name); //받는사람 메일 /이름,회원가입 페이지에서 가져온다.
			//mail.addTo("받을 메일","수신자");//복수의 사람 지정 가능
			
			mail.setSubject("HTML 메일 테스트"); // 메일 제목
			//mail.setMsg(name + "님! 가입을 축하드립니다!\n 첨부파일 테스트"); //메일 내용
			//mail.setContent("테스트 메일의 내용입니다.", "text/plain; charset=euc-kr"); setContent로 보낼때는 반드시 charset=euc-kr로 표기 필요
			
		    StringBuffer msg = new StringBuffer();
		    msg.append("<html>");
			msg.append("<body>");
			msg.append("<a href='https://mvnrepository.com'><img src='https://mvnrepository.com/assets/images/392dffac024b9632664e6f2c0cac6fe5-logo.png' /></a>");
			msg.append("<hr>");
			msg.append("<h3>HTML 메일 테스트</h3>");
			msg.append("<p>가입을 축하드립니다.</p>");
			msg.append("<p>HTML 메일 테스트</p>");
			msg.append("</body>");
			msg.append("</html>");
            mail.setHtmlMsg(msg.toString());
		    
			//파일 첨부 하기
			EmailAttachment file = new EmailAttachment();
			
			// 물리적 디스크내 파일 첨부
			file.setPath(session.getServletContext().getRealPath("resources/css/common.css"));
			mail.attach(file);
			
			
			//프로젝트 내의 파일 첨부
		    file = new EmailAttachment();
		    file.setURL(new URL("https://search.naver.com/search.naver?ssc=tab.image.all&where=image&sm=tab_jum&query=%EB%89%B4%EC%A7%84%EC%8A%A4#imgId=image_sas%3Ablog_01fb4e348a203adcc3f2c4b1a6d6c4c8"));
			mail.attach(file);
			
			
			
			mail.send(); //메일발송
		} catch (Exception e) {
		   System.out.println(e.getMessage());
		}		
	
	}
	
	//첨부 파일 업로드 처리////////////////////////////////////////////////////////
		public String upload(String category, MultipartFile file, HttpSession session) {
			//서버의 업로드할 물리적 위치
			// workspace/.metadata/....../wtpwebapps/iot/resources
			String resources = session.getServletContext().getRealPath("resources");
			String upload = resources + "/upload";
			
			//업로드할 파일의 형태 : .../upload/notice/2020/07/13/abc.txt
			//String folder = upload + "/upload/2020/07/13";
			String folder = upload + "/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
			
			//폴더가 없다면 폴더를 생성
			File f = new File(folder);
			if(!f.exists()) { f.mkdirs(); } //폴더가 존재하지 않으면 경로 생성
			
			//동시 다발적 동일명의 파일 업로드를 위한 고유 ID 부여: afd324adfa_abc.txt
			String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			try {
				file.transferTo( new File(folder, uuid) );
			} catch (Exception e) {
				System.out.println(e.getMessage());		
			}
			
			// /upload/.../asdfadsfsa_abc.txt ▶ 업로드한 파일의 경로를 반환
			// ① folder.replace(resources, "")
			// ② folder.substring(resources.length()) + "/" + uuid;
			return folder.substring(resources.length()+1) + "/" + uuid;
		}//upload
		
	//첨부 파일 다운로드 처리 ///////////////////////////////////////////////////////
		public File download(String filename, String Filepath, HttpSession session, HttpServletResponse response) {
			File file = new File(session.getServletContext().getRealPath("resources") + "/" + Filepath);
			//filepath에 resources/ << 슬래쉬부터의 경로가 지정되어 있다.
			String mime = session.getServletContext().getMimeType(filename);
		
			response.setContentType(mime);
			
	
				try {
					filename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
					// + 는 기호라 \ 필요, \ 또한 기호라 \ 필요
					// %20 = 스페이스바
					response.setHeader("content-disposition","attachment; filename=" + filename);
					
					ServletOutputStream out = response.getOutputStream();
					FileCopyUtils.copy(new FileInputStream(file), out);
					out.flush();
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  catch (Exception e) {
					System.out.println(e.getMessage());
				}
				
				return file;
						
		} //download
		
	// 공공데이터 REST API 요청처리 =========================================================================================
		
		public String xml_list(StringBuilder url) {
			String result = url.toString();
			
			try {
				HttpURLConnection conn
				= (HttpURLConnection) new URL( result ).openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application.json");
				BufferedReader rd;
				
				if(conn.getResponseCode() >=200 && conn.getResponseCode() <=300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8")); //utf-8 추가
				} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8")); //utf-8 추가
				}
				StringBuilder sb = new StringBuilder();
				String line;
				while((line = rd.readLine()) !=null) {
					sb.append(line);
				}
				rd.close();
				conn.disconnect();
				        result = sb.toString();
				        System.out.println(result);
			} catch (Exception e) {
				System.out.println(e.getMessage());
		
			}
			return result;
		}
		
   //JSON ===============================================================================================================
	   public String json_list(StringBuilder url) {
		   JSONObject json = null; //JSONObject 클래스를 사용하기 위해 메이븐에서 JSON.simple 라이브러리 추가
		   
		   try {
			   json = (JSONObject) new JSONParser().parse( xml_list(url));
			   json = (JSONObject) json.get("response");
			   json = (JSONObject) json.get("body");
			   int count = json.get("totalCount") == null ? 0 : Integer.parseInt(json.get("totalCount").toString());
			   
			   if(json.get("items") instanceof JSONObject) { //instanceof 타입 비교 키워드
				   json = (JSONObject) json.get("items");
			   }
			   json.put("count", count);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} 
		  return json.toJSONString(); 
	   }
		
	}

