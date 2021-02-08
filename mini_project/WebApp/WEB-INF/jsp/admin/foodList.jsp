<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
<title>메뉴 관리</title>

<!-- 폰트 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- CSS 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- CSS 스타일 -->
<link href="css/style(admin).css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		// Activate tooltip
		$('[data-toggle="tooltip"]').tooltip();

		// Select/Deselect checkboxes
		var checkbox = $('table tbody input[type="checkbox"]');
		$("#selectAll").click(function() {
			if (this.checked) {
				checkbox.each(function() {
					this.checked = true;
				});
			} else {
				checkbox.each(function() {
					this.checked = false;
				});
			}
		});
		checkbox.click(function() {
			if (!this.checked) {
				$("#selectAll").prop("checked", false);
			}
		});
	});

	function clickFunc(e) {
		console.log($(e.target).parent().parent().parent().children().eq(1).html()); //eq >> 몇번째 값
		$('#mNumber').val($(e.target).parent().parent().parent().children().eq(1).html());
	}

	function editFunc(e) {
		$('#mNumber2').val($(e.target).parent().parent().parent().children().eq(1).html());
		$('#mKind2').val($(e.target).parent().parent().parent().children().eq(2).html());
		$('#mName2').val($(e.target).parent().parent().parent().children().eq(3).html());
		$('#mPrice2').val($(e.target).parent().parent().parent().children().eq(4).html());
		$('#mContent2').val($(e.target).parent().parent().parent().children().eq(5).html());
	}
</script>
</head>
<jsp:include page="../common/menu.jsp" />

<!-- 페이지 내용 Start -->
<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2><b>음식 관리</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
						<i class="material-icons">&#xE147;</i><span>메뉴 등록</span></a>
						<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal">
						<i class="material-icons">&#xE15C;</i><span>메뉴 삭제</span></a>		
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
						</th>
						<th>번호</th>
						<th>종류</th>
						<th>이름</th>
						<th>가격</th>
						<th>내용</th>
						<th>사진</th>
						<th>정보수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
					<tr>
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1" onclick="clickFunc(event)">
								<label for="checkbox1"></label>
							</span>
						</td>
						<td>${vo.mNumber }</td>
						<td>${vo.mKind }</td>
						<td>${vo.mName }</td>
						<td>${vo.mPrice }</td>
						<td>${vo.mContent }</td>
						<td>${vo.mImage }</td>
						<td>
							<a href="#editEmployeeModal" class="edit" data-toggle="modal" onclick="editFunc(event)">
							<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteEmployeeModal" class="delete" data-toggle="modal" onclick="clickFunc(event)">
							<i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- 메뉴 추가 Modal -->
<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="frm" name="frm" action="foodInsert.do" method="post"> <!-- enctype="multipart/form-data" onsubmit="copyImage(event)" -->
				<div class="modal-header">
					<h4 class="modal-title">메뉴 추가</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>메뉴 종류</label><br>
							<input list="mKind" name="mKind" size="33">
								<datalist id="mKind">
								<option value="도시락">도시락</option>
								<option value="스낵">스낵</option>
								<option value="음료">음료</option>
								</datalist>
 								<input type="submit" value="확인">
					</div>
					<div class="form-group">
						<label>메뉴 이름</label>
						<input type="text" id="mName" name="mName" class="form-control">
					</div>
					<div class="form-group">
						<label>메뉴 가격</label>
						<input type="text" id="mPrice" name="mPrice" class="form-control" value="￦ ">
					</div>
					<div class="form-group">
						<label>상세 정보</label>
						<textarea class="form-control" id="mContent" name="mContent"></textarea>
					</div>
<!-- 					<div class="form-group">
						<label>Image</label>
						<input class="form-control" type="file" name="file">
						<input type="hidden" name="image" id="image">
					</div> -->
				</div>
					<div class="modal-footer">
						<input type="reset" class="btn btn-default" data-dismiss="modal" value="취소">
						<input type="submit" class="btn btn-success" value="추가">
					</div>
			</form>
		</div>
	</div>
</div>
<!-- 메뉴 수정 Modal -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="frr" name="frr" method="post" action="foodUpdate.do">
				<div class="modal-header">
					<h4 class="modal-title">메뉴 수정</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>번호</label>
						<input type="text" class="form-control"	id="mNumber2" name="mNumber2" required readonly="readonly">
					</div>
					<div class="form-group">
						<label>메뉴 종류</label><br>
							<input list="menu" id="mKind2" name="mKind2" size="33" required>
								<datalist id="menu">
								<option value="도시락">도시락</option>
								<option value="스낵">스낵</option>
								<option value="음료">음료</option>
								</datalist>
 								<input type="submit" value="확인">
					</div>
					<div class="form-group">
						<label>메뉴 이름</label>
						<input type="text" class="form-control" id="mName2" name="mName2" required>
					</div>
					<div class="form-group">
						<label>메뉴 가격</label>
						<input type="text" class="form-control" id="mPrice2" name="mPrice2" required>
					</div>
					<div class="form-group">
						<label>상세 정보</label>
						<textarea class="form-control" id="mContent2" name="mContent2" required></textarea>
					</div>
				</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="취소">
						<input type="submit" class="btn btn-info" value="저장">
					</div>
			</form>
		</div>
	</div>
</div>
<!-- 메뉴 삭제 Modal -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="foodDelete.do" method="post">
				<input type="hidden" id="mNumber" name="mNumber">
				<div class="modal-header">
					<h4 class="modal-title">메뉴 삭제</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>정말 메뉴를 삭제하시겠습니까?</p>
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
<script>
	function copyImage(e) {
		e.preventDefault();
		//console.log(e.target.childNodes[3].childNodes[9].childNodes[3].value);
		var imgName = e.target.childNodes[3].childNodes[9].childNodes[3].value;
			imgName = imgName.substring(imgName.lastIndexOf('\\') + 1);
			$('#image').val(imgName);
			document.frm.submit();
		}
</script>
</body>
</html>