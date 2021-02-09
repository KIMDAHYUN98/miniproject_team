<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- Title -->
<title>YD Dosirak</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">

<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Nunito:600,700" rel="stylesheet">

<!-- CSS 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CSS 스타일 -->
<link href="css/style.css" rel="stylesheet">

<script type="text/javascript">
	function clickFunc(e) {
		console.log($(e.target).parent().parent().parent().parent().children().eq(3).html());
		$('#mTitle').val($(e.target).parent().parent().parent().parent().children().eq(3).html());
	}
</script>
<style type="text/css">

 #th-btn {
 	width: 141px;
 }
	
#th-content {
	width: 300px;
}

#th-title {
	width: 150px;
}


#th-tel {
	width: 150px;
}
#th-bkind {
	width: 100px;
}

.trTitle {
	background-color: #ffc107;
}

.table.table-bordered {
	text-align: center;
}

</style>
</head>
<jsp:include page="../common/menu.jsp" />

<!-- 페이지 내용 Start -->
<!-- Page Header Start -->
<div class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2>Board</h2>
			</div>
		</div>
	</div>
</div>
<!-- Page Header End -->
<c:if test="${admin ne null }">
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr class="trTitle">
					<th id="th-Id">ID</th>
					<th id="th-tel">전화번호</th>
					<th id="th-email">이메일</th>
					<th id="th-title">제목</th>
					<th id="th-content">내용</th>
					<th id="th-bkind">평가</th>
					<th id="th-btn">수정 / 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${board }">
					<c:if test="${board.mId eq id }">
					<tr class="trContent">
						<td>${board.mId }</td>
						<td>${board.mTel }</td>
						<td>${board.mEmail }</td>
						<td>${board.bTitle }</td>
						<td>${board.bContent }</td>
						<td>${board.bKind }</td>
						<td>
							<div class="btn-group">
								<form action="boardEditForm.do" method="post">
									<input type="hidden" value="${id }" id="mIde" name="mIde">
									<input name="modify" type="submit" class="btn btn-xs btn-warning" value="수정">
								</form>
								<a href="#deleteEmployeeModal" data-toggle="modal" onclick='clickFunc(event)'>
									<button name="delete" class="btn btn-xs btn-danger">삭제</button>
								</a>
							</div>
						</td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<form action="boardForm.do" method="post">
		<input type="hidden" value="${id }" id="mId" name="mId">
		<input type="hidden" value="${email }" id="mEmail" name="mEmail">
		<input type="hidden" value="${tel }" id="mTel" name="mTel">
		<button id="createBtn" type="submit" class="btn btn-info btn-sm" data-toggle="modal">새 글 쓰기</button>
		</form>
	</div>
</c:if>

<c:if test="${admin eq null }">
<div class="login-form">
    <form action="login.do" method="post">
        <h2 class="text-center">로그인</h2>   
        <div class="form-group">
        	<div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">
                        <span class="fa fa-user"></span>
                    </span>                    
                </div>
                <input id="mId" name="mId" type="text" class="form-control" placeholder="ID" required="required">
            </div>
        </div>
		<div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fa fa-lock"></i>
                    </span>                    
                </div>
                <input id="mPassword" name="mPassword" type="password" class="form-control" placeholder="Password" required="required">
            </div>
        </div>        
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
        </div>
    </form>
    <p class="text-center">회원이 아니신가요? <a href="createUser.do">회원가입</a></p>
</div>
</c:if>
	
<!-- 글쓰기 삭제 -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="boardDelete.do" method="post">
			<input type="text" id="mTitle" name="mTitle">
				<div class="modal-header">						
					<h4 class="modal-title">회원 정보 삭제</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>정말로 회원 정보를 삭제하시겠습니까?</p>
					<p class="text-warning"><small>이 작업은 되돌릴 수 없습니다.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="취소">
					<input type="submit" class="btn btn-danger" value="삭제">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<!-- 페이지 내용 End -->
<jsp:include page="../common/footer.jsp" />