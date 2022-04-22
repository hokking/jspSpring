function CheckAddProduct() {
	// productId 상품 아이디
	// <input type="text" name="productId" id="productId"..>
	var productId = document.getElementById("productId");
	
	// pname 상품명
	var pname = document.getElementById("pname");

	// uniPrice 가격
	var uniPrice = document.getElementById("uniPrice");
	
	// unitsInStock 재고수
	var unitsInStock = document.getElementById("unitsInStock");
	
	// 상품 아이디 체크
	if(!check(/^P[0-9]{4,11}$/, productId, "[상품 코드]\nP와 숫자를 조합하여 5-12자까지 입력하세요.\n첫 글자는 반드시 P로 시작하세요.")){
			// submit을 하지 않음
			return false;
	}
	// 상품명 체크
	if(pname.value.length < 4 || pname.value.length > 12) {
		alert("[상품명]\n최소 4자에서 12자까지 입력하세요.");
		pname.select();
		pname.focus();
		return false;
	}
	// 상품 가격 체크
	if(uniPrice.value.length == 0 || isNaN(uniPrice.value)) {
		alert("[가격]\n숫자만 입력해주세요.");
		uniPrice.select();
		uniPrice.focus();
		return false;
	}
	if(uniPrice.value < 0) {
		alert("[가격]\n음수는 입력할 수 없습니다.");
		uniPrice.select();
		uniPrice.focus();
		return false;
	} else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/, uniPrice, "[가격]\n소수점 둘째 자리까지만 입력해주세요.")) {
		return false;
	}
	// 재고 수 체크
	if(isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력해주세요.");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	// regExp : 정규표현식, e : 대상객체, msg : alert 할 메시지
	// 정규표현식에 맞으면 ture, 다르면 false를 요청한 곳으로 return
	function check(regExp, e, msg) {
		// 정규식에 맞으면 바로 true를 return
		if(regExp.test(e.value)) {
			return true;
		}
		// 정규식에 맞지 않으면
		alert(msg);
		e.select();
		e.focus();
		
		// form이 submit 되지 않음
		return false;
	}
	
	// <form name="newProduct"..>
	document.newProduct.submit();
}