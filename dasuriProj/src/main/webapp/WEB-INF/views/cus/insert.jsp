<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form modelAttribute="cusVO" method="post" action="/cus/insert"
	enctype="multipart/form-data">
<ul class="list-group list-group-flush">
  <li class="list-group-item p-3">
    <div class="row">
      <div class="col-sm-12 col-md-6">
          <strong class="text-muted d-block mb-2">고객 이름</strong>
          <div class="form-group">
            <form:input path="cusNm" class="form-control"/> 
            <font color="red" style="font-size: 8pt;">
              <form:errors path="cusNm"/>
            </font>
          </div>
          <strong class="text-muted d-block mb-2">연락처</strong>
          <div class="form-group">
            <form:input path="pne" class="form-control"/> 
            <font color="red" style="font-size: 8pt;">
              <form:errors path="pne"/>
            </font>
          </div>
          <strong class="text-muted d-block mb-2">고객 주소</strong>
          <div class="form-row">
	          <div class="form-group col-md-7">
	            <form:input path="addr" class="form-control" />
	            <font color="red" style="font-size: 8pt;">
	              <form:errors path="addr"/>
	            </font>
	          </div>
	          <div class="form-group col-md-5">
	            	<button type="button" class="mb-2 btn btn-sm btn-info mr-1"
	            		onclick="openHomeSearc()">우편번호 검색</button>
	          </div>
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="addr1" name="addr1" placeholder="">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="addr2" name="addr2" placeholder="">
          </div>
      </div>
      <div class="col-sm-12 col-md-6">
        <strong class="text-muted d-block mb-2">고객 이미지</strong>
        <div class="form-group">
        	<div class="imgs_wrap"></div>
        </div>
        <div class="form-group">
           <input type="file" name="uploadFile" id="input_imgs" multiple />
        </div>
      </div>
    </div>
    <div class="form-group" style="float:right;">
	  <button type="reset" id="insert_btn" class="mb-2 btn btn-sm btn-danger mr-1">취소</button>
	  <button type="submit" id="insert_btn" class="mb-2 btn btn-sm btn-success mr-1">고객 등록</button>
  	</div>
  </li>
</ul>
</form:form>

<script type="text/javascript">
	$(function(){
		//------------- 이미지 미리보기 시작 ------------------
		$(function(){
			$("#input_imgs").on("change", handleImgsFileSelect);		
		});
		//e : change 된 이벤트 정보
		function handleImgsFileSelect(e){
			//이벤트가 일어난 파일 객체의 이미지 파일들을 가져옴
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다");
					// 업로드 종료
					return;
				}
				
				var reader = new FileReader();
				reader.onload = function(e){
					console.log(e);
					var img_html = "<img src=\"" + e.target.result + "\" style='width:100px;' />";
					$(".imgs_wrap").append(img_html);
				}
				reader.readAsDataURL(f);
			});
		}
		//------------- 이미지 미리보기 끝 ------------------
	});
</script>