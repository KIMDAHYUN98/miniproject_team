<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
<title>매장 관리</title>

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
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});

	//edit->modal
	$(".edit").bind("click",function(){
		//alert($(this).attr('id'));
		let idx = $(this).attr('id').split('_')[1];
		$("#editStoreModal").find('#edit_sNumber').val($('#sNumber_'+idx).text());
		$("#editStoreModal").find('#edit_sName').val($('#sName_'+idx).text());
		$("#editStoreModal").find('#edit_sTel').val($('#sTel_'+idx).text());
		$("#editStoreModal").find('#edit_sAddress').val($('#sAddress_'+idx).text());
		$("#editStoreModal").find('#edit_sContent').val($('#sContent_'+idx).text());
	});
	//delete->modal
	$(".delete").bind("click",function(){
		//alert($(this).attr('id'));
		let idx = $(this).attr('id').split('_')[1];
		$("#deleteStoreModal").find('#delete_sNumber').val($('#sNumber_'+idx).text());
	});
});

	function clickFunc(e){//.children().children().eq(1).html()
		console.log($(e.target));
		$('#sNumber').val($(e.target).parent().parent().parent().children().eq(1).html());
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
						<h2><b>매장 관리</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addStoreModal" class="btn btn-success" data-toggle="modal">
						<i class="material-icons">&#xE15C;</i><span>매장 등록</span></a>
						<a href="#deleteStoreModal"  class="btn btn-danger" data-toggle="modal">
						<i class="material-icons">&#xE15C;</i><span>매장 삭제</span></a>					
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
						<th>번 호</th> <!-- sNumber -->
						<th>이 름</th> <!-- sName -->
						<th>연락처</th> <!-- sTel --> 
						<th>주 소</th> <!-- sAddress -->
						<th>상세정보</th> <!-- sContent -->
						<th>정보수정</th>
					</tr>
				</thead>
				<c:forEach var = "vo" items="${list }">
				<tbody>
					<tr>
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1" onclick="clickFunc(event)">
								<label for="checkbox1"></label>
							</span>
						</td>
						<td id="sNumber_${vo.sNumber}">${vo.sNumber}</td> <!-- sNumber -->
						<td id="sName_${vo.sNumber}">${vo.sName}</td> <!-- sName -->
						<td id="sTel_${vo.sNumber}">${vo.sTel}</td> <!-- sTel --> 
						<td id="sAddress_${vo.sNumber}">${vo.sAddress}</td> <!-- sAddress -->
						<td id="sContent_${vo.sNumber}">${vo.sContent}</td> <!-- sCon -->
						<td>
							<a href="#editStoreModal" id="btnEditModal_${vo.sNumber}"class="edit" data-toggle="modal">
							<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteStoreModal" id="btnDelModal_${vo.sNumber}" class="delete" data-toggle="modal" onclick="clickFunc(event)">
							<i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
						</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			
		</div>
	</div>        
</div>
<!-- 매장 추가 Modal -->
<div id="addStoreModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="storeInsert.do" method="post">
				<div class="modal-header">						
					<h4 class="modal-title">매장 등록</h4> <!-- insert -->
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>매장 이름</label>
						<input type="text" class="form-control" id="sName" name="sName" required>
					</div>
					<div class="form-group">
						<label>매장 연락처</label>
						<input type="text" class="form-control" id="sTel" name="sTel" required>
					</div>
					<div class="form-group">
						<label>매장 주소</label>
						<input type="text" class="form-control" id="sAddress" name="sAddress" required>
					</div>	
					<div class="form-group">
						<label>매장 상세정보</label>
						<input type="text" class="form-control" id="sContent" name="sContent" required>
					</div>					
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="취소">
					<input type="submit" class="btn btn-success" value="추가">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 매장 수정 Modal -->
<div id="editStoreModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="storeUpdate.do" method="post">
				<div class="modal-header">						
					<h4 class="modal-title">매장 수정</h4> <!-- update -->
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>매장 번호</label>
						<input type="text" class="form-control" id="edit_sNumber" name="sNumber" readonly="readonly">
					</div>				
					<div class="form-group">
						<label>매장 이름</label>
						<input type="text" class="form-control" id="edit_sName" name="sName">
					</div>
					<div class="form-group">
						<label>매장 전화번호</label>
						<input type="text" class="form-control" id="edit_sTel" name="sTel" >
					</div>					
					<div class="form-group">
						<label>매장 주소</label>
						<input type="text" class="form-control" id="edit_sAddress" name="sAddress" >
					</div>
					<div class="form-group">
						<label>매장 상세정보</label>
						<input type="text" class="form-control" id="edit_sContent" name="sContent" >
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
<!-- 매장 삭제 Modal -->
<div id="deleteStoreModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="storeDelete.do" method="post">
				<input type="hidden" id="sNumber" name="sNumber">
				<div class="modal-header">						
					<h4 class="modal-title">매장 정보 삭제</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">				
					<p>정말로 매장 정보를 삭제하시겠습니까?</p>
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
</html>