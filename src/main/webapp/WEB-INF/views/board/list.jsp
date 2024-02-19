<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>

 
 <div class="container-fluid px-4">
       <h1 class="mt-4">Tables</h1>
                        <div>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="col-md-1">
                           <label for="country" class="form-label">키워드</label>
                        <select class="form-select form-select-lg mb-3" aria-label="Large select example">
						  <option selected>제목</option>
						  <option value="1">타이틀</option>
						  <option value="2">찜목록</option>						 
                        </select>
                        
                        <div class="row g-3">
				            <div class="col-sm-6">
				              <label for="firstName" class="form-label">First name</label>
				              <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
				              <div class="invalid-feedback">
				                Valid first name is required.
				              </div>
				            </div>
                        </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div> 
  
  
  <table class="table align-middle mb-0 bg-white">
  <thead class="bg-light">
    <tr>
      <th>작성자</th>
      <th>제목</th>
      <th>내용</th>
      <th>작성날짜</th>
      <th>조회수</th>
      <th>첨부파일</th>
    </tr>
  </thead>
  <tbody>
   
   <c:if test="${page.viewType eq 'list'}">
     <c:forEach var="vo" items="${page.list}">
    <tr>
      <td>
        <div class="d-flex align-items-center">
          <img
              src="https://mdbootstrap.com/img/new/avatars/8.jpg"
              alt=""
              style="width: 45px; height: 45px"
              class="rounded-circle"
              />
          <div class="ms-3">
            <p class="fw-bold mb-1">${vo.writer}</p>
            <p class="text-muted mb-0">john.doe@gmail.com</p>
          </div>
        </div>
      </td>
      <td>
        <p class="fw-normal mb-1">${vo.title}</p>
      </td>
      <td>
        <span class="badge badge-success rounded-pill d-inline">Awaiting</span>
      </td>
      <td>${vo.content}</td>
      <td>${vo.writedate}</td>
      <td>${vo.readcnt}</td>
      <td>${vo.filename}</td>
      <td>
        <button type="button" class="btn btn-link btn-sm btn-rounded">
          Edit
        </button>
      </td>
    </tr>
    </c:forEach>
    </c:if>
    
    <tr>
      <td>
        <div class="d-flex align-items-center">
          <img
              src="https://mdbootstrap.com/img/new/avatars/6.jpg"
              class="rounded-circle"
              alt=""
              style="width: 45px; height: 45px"
              />
          <div class="ms-3">
            <p class="fw-bold mb-1">Alex Ray</p>
            <p class="text-muted mb-0">alex.ray@gmail.com</p>
          </div>
        </div>
      </td>
      <td>
        <p class="fw-normal mb-1">Consultant</p>
        <p class="text-muted mb-0">Finance</p>
      </td>
      <td>
        <span class="badge badge-primary rounded-pill d-inline"
              >Onboarding</span
          >
      </td>
      <td>Junior</td>
      <td>
        <button
                type="button"
                class="btn btn-link btn-rounded btn-sm fw-bold"
                data-mdb-ripple-color="dark"
                >
          Edit
        </button>
      </td>
    </tr>
    <tr>
      <td>
        <div class="d-flex align-items-center">
          <img
              src="https://mdbootstrap.com/img/new/avatars/7.jpg"
              class="rounded-circle"
              alt=""
              style="width: 45px; height: 45px"
              />
          <div class="ms-3">
            <p class="fw-bold mb-1">Kate Hunington</p>
            <p class="text-muted mb-0">kate.hunington@gmail.com</p>
          </div>
        </div>
      </td>
      <td>
        <p class="fw-normal mb-1">Designer</p>
        <p class="text-muted mb-0">UI/UX</p>
      </td>
      <td>
        <span class="badge badge-warning rounded-pill d-inline">Awaiting</span>
      </td>
      <td>Senior</td>
      <td>
        <button
                type="button"
                class="btn btn-link btn-rounded btn-sm fw-bold"
                data-mdb-ripple-color="dark"
                >
          Edit
        </button>
      </td>
    </tr>
  </tbody>
</table>

 <%@include file="../includes/footer.jsp" %>