<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Default Light Table -->
<div class="row">
  <div class="col">
    <div class="card card-small mb-4">
      <div class="card-header border-bottom">
      <form name="searchForm" id="searchForm" action="/cus/list" method="get">
      <div class="row">
        <div class="col-sm-12 col-md-6">
	    <div class="dataTables_length" id="dataTable_length">
	      <label>Show 
	        <select id="size" name="size" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
	          <option value="5">5</option>
	          <option value="10">10</option>
	          <option value="15">15</option>
	          <option value="20">20</option>
	        </select> entries
	      </label>
	    </div>
	  </div>
	  <div class="col-sm-12 col-md-6">
	    <div id="dataTable_filter" class="dataTables_filter">
	      <label>Search:
	        <input type="search" name="keyWord" id="keyWord" class="form-control form-control-sm" placeholder="검색어를 입력해주세요" aria-controls="dataTable" value="${list.keyWord}">
	      </label>
          &nbsp;
          <a href="#" class="btn btn-success btn-icon-split" onclick="fn_submit()">
              <span class="icon text-white-50">
                  <i class="fas fa-check"></i>
              </span>
              <span class="text">검색</span>
          </a>
	    </div>
	  </div>
      </div>
      </form>
      </div>
      <div class="card-body p-0 pb-3 text-center">
        <table class="table mb-0">
          <thead class="bg-light">
            <tr>
              <th scope="col" class="border-0">번호</th>
              <th scope="col" class="border-0">고객명</th>
              <th scope="col" class="border-0">연락처</th>
              <th scope="col" class="border-0">주소</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="cusVO" items="${list.content}">
            <tr>
              <td>${cusVO.rnum}</td>
              <td><a href="/cus/detail?cusNum=${cusVO.cusNum}">${cusVO.cusNm}</a></td>
              <td>${cusVO.pne}</td>
              <td>${cusVO.addr}</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
	<div class="row">
	  <div class="col-sm-12 col-md-5">
	    <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
	    <!-- A*7-6	A*7 -->
	      <c:if test="${list.currentPage * list.size > total}">
	        &nbsp;&nbsp;Showing ${list.currentPage * list.size - (list.size - 1)} to ${total} of ${total} entries
	      </c:if>
	      <c:if test="${list.currentPage * list.size <= total}">
	        &nbsp;&nbsp;Showing ${list.currentPage * list.size - (list.size - 1)} to ${list.currentPage * list.size} of ${total} entries
	      </c:if>
	    </div>
	  </div>
	  <div class="col-sm-12 col-md-7">
	    <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
	      <!-- 페이징 처리 시작 -->
	      <ul class="pagination">
	        <!-- Previous 시작 -->
	        <li class="paginate_button page-item previous <c:if test='${list.startPage < list.size}'>disabled</c:if>" id="dataTable_previous"><a href="/cus/list?currentPage=${list.startPage - 5}&keyWord=${list.keyWord}&size=${list.size}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
	        <!-- Previous 끝 -->
	        <!-- Page번호 시작 -->
	        <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
	        <li class="paginate_button page-item <c:if test='${list.currentPage eq pNo}'>active</c:if>"><a href="/cus/list?currentPage=${pNo}&keyWord=${list.keyWord}&size=${list.size}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${pNo}</a></li>
	        </c:forEach>
	        <!-- Page번호 끝 -->
	        <!-- Next 시작 -->
	        <li class="paginate_button page-item next <c:if test='${list.endPage >= list.totalPages}'>disabled</c:if>" id="dataTable_next"><a href="/cus/list?currentPage=${list.startPage + 5}&keyWord=${list.keyWord}&size=${list.size}" aria-controls="dataTable" data-dt-idx="${list.size}" tabindex="0" class="page-link">Next</a></li>
	        <!-- Next 끝 -->
	      </ul>
	      <!-- 페이징 처리 끝 -->
	    </div>
	  </div>
	</div>
    </div>
  </div>
</div>
<a href="/cus/insert" class="mb-2 btn btn-sm btn-success mr-1" style="float: right;">고객 등록</a>
<!-- End Default Light Table -->

<script type="text/javascript">
	function fn_submit(){
		var frm = document.searchForm;
		frm.submit();
	}
</script>

<script type="text/javascript">
	$(function() {
		$("#size").val(`${list.size}`).prop("selected", true);
		$("#size").on("change", function() {
			var optVal = $("#size option:selected").val();
			console.log(optVal);
			
			location.href = "/cus/list?size=" + optVal + "&keyWord=${list.keyWord}";
		});
	});
</script>