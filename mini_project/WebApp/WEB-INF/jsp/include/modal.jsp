<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">


<!-- CSS 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<!-- CSS 스타일 -->
<link href="css/style(longin&createUser).css" rel="stylesheet">
<style type="text/css">
	#textarea {
		resize: none;
	}
</style>
<script type="text/javascript">
</script>
<jsp:include page="../common/menu.jsp" />
</head>
<body>
	<div class="container" align="center">
		<br><h1>게시판</h1><br/>
			<form method="post" action="boardInsert.do">
				<div class="card bg-light">
				<table style="text-align: center;">
					<thead>
					</thead>
					<tbody>
						<tr>
							<th>ID</th>
							<td>
								<input type="text" class="form-control" placeholder="아이디" >
							</td>
							<th>전화번호</th>
							<td>
								<input type="text" class="form-control" placeholder="전화번호" >
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" class="form-control" placeholder="이메일" >
							</td>
							<th> 평가</th>
							<td>
							<label><input type="radio" name="1"> 매우만족</label>&nbsp;
							<label><input type="radio" name="2"> 만족</label>&nbsp;
							<label><input type="radio" name="3"> 보통</label>&nbsp;
							<label><input type="radio" name="4"> 불만족</label>&nbsp;
							<label><input type="radio" name="5"> 매우불만족</label>&nbsp;
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3">
								<input type="text" size="50"  class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"/>
							</td>
						</tr>
						<tr>
							<td colspan="4" >
								<textarea id="textarea" class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				</div><br/>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />
			</form>
	</div>
</body>
</html>

	