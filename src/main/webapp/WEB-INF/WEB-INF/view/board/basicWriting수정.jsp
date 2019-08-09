<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/joinCare.jsp"%>
</head>

<body>
	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>

	<br>
	<br>
	<br>

	<!-- Patient Area Starts -->
		<div class="container">
			<div class="row">
				<div class="section-top text-center">
					<h2>타이틀</h2>
					<p>subtitle</p>
				</div>
			</div>
			<div class="row">

				<section class="board-list">
					<form name="board_write_form" id="board_write_form" method="post"
						accept-charset="utf-8"
						class="ng-pristine ng-invalid ng-invalid-required">
						<input type="hidden" name="group_id" autocomplete="off" value="">
						<div class="board-list-in">
							<table class="education-table"
								style="text-align: unset !important;">

								<colgroup>
									<col style="width: 20%">
									<col style="width: auto">
								</colgroup>

								<thead>
									<tr>
										<th scope="row"><label for="subject">제목</label></th>
										<td class="left"><input type="text" name="subject"
											id="subject"
											class="form-control form-control-small ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"
											ng-model="boardWrite.subject" required="required"></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="2" class="left">
											<!--           이부분에 스마트 에디터를 넣으세요  -->
											<div class="note-editor note-frame panel panel-default">

												<div class="note-editing-area">
													<div class="note-handle"></div>

													<textarea class="note-codable"></textarea>
													<div class="note-editable panel-body"
														contenteditable="true" style="height: 300px;">
														<p>
															<br>
														</p>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div id="education-board-detail-in"
								class="education-board-detail-in">
								<div class="board-btn-area">
									<button type="button" class="btn btn-board btn-board2">목록으로</button>
									<div class="btn-right">
										<button type="submit" class="btn btn-board btn-primary">확인</button>
									</div>
								</div>
							</div>

						</div>
					</form>
				</section>
			</div>
		</div>
</body>
</html>