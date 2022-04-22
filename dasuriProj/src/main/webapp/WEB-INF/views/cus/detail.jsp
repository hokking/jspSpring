<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<script type="text/javascript" src="/resources/js/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/html2pdf.bundle.min.js"></script>
<script type="text/javascript" src="/resources/js/html2canvas.min.js"></script>
<script type="text/javascript" src="/resources/js/jspdf.min.js"></script>

<script type="text/javascript">
	$(function(){
		//------------- 이미지 미리보기 시작 ------------------
		$("#input_img").on("change", handleImgFileSelect);
		
		function handleImgFileSelect(e) {
			
			//e.target : 파일객체
			//e.target.files : 파일객체 안의 파일들
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			//f : 파일 객체
			filesArr.forEach(function(f){
				//미리보기는 이미지만 가능함
				if(!f.type.match("image.*")){
					alert("이미지만 가능합니다");
					return;
				}
				
				//파일객체 복사
					// sel_file.push(f);
				//파일을 읽어주는 객체 생성
				var reader = new FileReader();
				reader.onload = function(e){
					//forEach 반복 하면서 img 객체 생성
// 					var img_html = "<img src=\"" + e.target.result + "\" />";
					$("#fileImg").prop({"background":"url(" + e.target.result + ")"
                        ,"background-size":"contain"
                        ,"background-repeat":"no-repeat"
                        ,"background-position":"center"});
				}
				reader.readAsDataURL(f);
			});
		}
		//------------- 이미지 미리보기 끝 ------------------
		
		
	}); 

	function makePdf(){
		//pdf다운로드
		html2canvas($(".detail")[0]).then(function(canvas) {
			var doc = new jsPDF("1", "px", [1370,700]);
			var imgData = canvas.toDataURL("image/png");
			doc.addImage(imgData, "PNG",0,0);
			doc.save("sample.pdf");
		});
	}
	
	function openHomeSearch(){
		new daum.Postcode({
			oncomplete:function(data){
// 				alert("data : " + JSON.stringify(data));
				$('[name=addr]').val(data.zonecode + " " + data.address + " " + data.buildingName);
			}
		}).open();
	}
</script>

<div class="color-switcher-toggle animated pulse infinite">
  <i class="material-icons">settings</i>
</div>

<div class="main-content-container container-fluid px-4 detail">
  <!-- Main Navbar -->
  <!-- / .main-navbar -->
      
  <!-- 
  		업데이트 성공시 뜨는 문 
  <div class="alert alert-success alert-dismissible fade show mb-0" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">×</span>
    </button>
    <i class="fa fa-check mx-2"></i>
    <strong>Success!</strong> Your profile has been updated! </div>
   -->
  <div class="main-content-container container-fluid px-4">
    <!-- Default Light Table -->
    <form:form modelAttribute="cusVO" method="post" action="/cus/detail"
	enctype="multipart/form-data">
    <div class="row">
      <div class="col-lg-4">
        <div class="card card-small mb-4 pt-3">
          <div class="card-header border-bottom text-center">
            <div class="mb-3 mx-auto imgs_wrap">
              <c:forEach var="attachFilesVO" items="${cusVO.attachFilesVO}">
                <img class="rounded-circle" src="${attachFilesVO.uploadFileName}" alt="User Avatar" width="110">
              </c:forEach>
            </div>
            <div class="form-group">
	           <input type="file" name="uploadFile" id="input_imgs" multiple style="display: none;" />
	        </div>
            <h4 class="mb-0">${cusVO.cusNm}</h4>
            <button type="button" class="mb-2 btn btn-sm btn-pill btn-outline-primary mr-2">
              <i class="material-icons mr-1">person_add</i>Follow</button>
          </div>
          <ul class="list-group list-group-flush">
          
<!--                     <li class="list-group-item px-4"> -->
<!--                       <div class="progress-wrapper"> -->
<!--                         <strong class="text-muted d-block mb-2">Workload</strong> -->
<!--                         <div class="progress progress-sm"> -->
<!--                           <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100" style="width: 74%;"> -->
<!--                             <span class="progress-value">74%</span> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </li> -->

            <li class="list-group-item p-4">
              <strong class="text-muted d-block mb-2">Description</strong>
              <span>회원 페이지의 상세보기 페이지입니다.</span>
            </li>
          </ul>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card card-small mb-4">
          <div class="card-header border-bottom">
            <h6 class="m-0"><strong>고객 상세 정보</strong></h6>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item p-3">
              <div class="row">
                <div class="col">
                    <div class="form-row">
                      <div class="form-group col-md-6 rdonly">
                        <label for="feFirstName">고객번호</label>
                        <input type="text" class="form-control" id="cusNum" name="cusNum" placeholder="" value="${cusVO.cusNum}"> </div>
                      <div class="form-group col-md-6 rdonly">
                        <label for="feLastName">고객명</label>
                        <input type="text" class="form-control" id="cusNm" name="cusNm" placeholder="" value="${cusVO.cusNm}"> </div>
                    </div>
                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <label for="feEmailAddress">연락처</label>
                        <input type="text" class="form-control" id="pne" name="pne" placeholder="" value="${cusVO.pne}"> </div>
                    </div>
                    <div class="form-group">
                      <label for="feInputAddress">주소</label>
                      <input type="text" class="form-control" id="addr" name="addr" value="${cusVO.addr}"> </div>
                    <div class="form-row">
                    
<!--                               <div class="form-group col-md-12"> -->
<!--                                 <label for="feDescription">Description</label> -->
<!--                                 <textarea class="form-control" name="feDescription" rows="5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio eaque, quidem, commodi soluta qui quae minima obcaecati quod dolorum sint alias, possimus illum assumenda eligendi cumque?</textarea> -->
<!--                               </div> -->
                      
                    </div>
                    <div class="form-group row">
                    <button type="button" id="editBtn" class="btn btn-accent" style="margin-left: 5px;">정보 수정</button>
                    <button type="button" id="chkBtn" class="btn btn-accent" style="display: none; margin-left: 5px;">확인</button>
                    <button type="button" id="cnclBtn" class="btn btn-danger" style="display: none; margin-left: 5px;">취소</button>
                    <a class="btn btn-warning" id="listBtn" href="/cus/list" style="margin-left: 5px;">목록</a>
                    <button type="button" id="pdfBtn" class="btn btn-secondary"
                    	onclick="makePdf()" style="margin-left: 5px;">PDF다운로드</button>
                    </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
    </form:form>
    <!-- End Default Light Table -->
  </div>
</div>


<script type="text/javascript">
	$(function(){
		
		
		$(".form-control").prop("readonly", true);
		//수정버튼 클릭 시 수정버튼 사라지고, 확인/취소버튼 보임
		$("#editBtn").on("click",function(){
			$("#addr").on("click", openHomeSearch);
			$(".form-control").prop("readonly", false);
			//수정 대상이 아닌 요소 처리
			//disabled -> true(비활성) (x) => form으로 안넘어감..
			$("#cusNum").prop("readonly", true);
			$("#cusNm").prop("readonly", true);
			//수정버튼 사라지고
			$("#editBtn").css("display","none");
			//확인/취소버튼 보임
			$("#chkBtn").css("display","block");
			$("#cnclBtn").css("display","block");
			
			$("#input_imgs").css("display","block");
		});
		//취소버튼 클릭 시 새로고침 처리
		$("#cnclBtn").on("click",function(){
			location.reload();
		});
		//확인버튼 클릭 시 수정 요청
		$("#chkBtn").on("click",function(){
			$("#cusVO").submit();
		});
		
		
		
// 		$(".b-image").on("click", function() {
	// 		alert("다운로드 하시겠습니까?");
			
// 			$("#ifrm").prop("src", "/download?fileName=${buyerVO.buyerImg}");
			
// 		});

	
	$("#input_imgs").on("change", handleImgsFileSelect);
	
		
	});
	//------------- 이미지 미리보기 시작 ------------------

	//e : change 된 이벤트 정보
	function handleImgsFileSelect(e){
		//이벤트가 일어난 파일 객체의 이미지 파일들을 가져옴
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		$(".imgs_wrap").html("");
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
</script>