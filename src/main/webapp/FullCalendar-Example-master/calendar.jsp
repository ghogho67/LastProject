<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/FullCalendar-Example-master/css/main.css">

</head>

<body>
    <div class="container">
   
    

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">방문간병</a></li>
                <li><a tabindex="-1" href="#">병원간병</a></li>
                <li><a tabindex="-1" href="#">운동도움</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-startDate">시작날짜</label>
                                <input class="inputModal" type="text" name="edit-startDate" id="edit-startDate" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-endDate">종료날짜</label>
                                <input class="inputModal" type="text" name="edit-endDate" id="edit-endDate" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-StartTime">시작시간</label>
                                <input class="inputModal" type="text" name="edit-startTime" id="edit-startTime" />
                            </div>
                      
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-endTime">종료시간</label>
                                <input class="inputModal" type="text" name="edit-endTime" id="edit-endTime" />
                            </div>
                        </div>
                        
                        <div class="row" id="dayInfo">
                            <div class="col-xs-12">
                  				<label class="col-xs-4" for="dayInfo[]">요일 선택</label>
                                <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="1">일요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="2">월요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="3">화요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="4">수요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="5">목요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="6">금요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="7">토요일</label>
                            </div>
                        </div>
                        
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
		                           <option value="방문간병">방문간병</option>
		                            <option value="병원간병">병원간병</option>
		                            <option value="운동도움">운동도움</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event2">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        
          <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="approvalModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-startDate">시작날짜</label>
                                <input class="inputModal" type="text" name="edit-startDate" id="edit-startDate" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-endDate">종료날짜</label>
                                <input class="inputModal" type="text" name="edit-endDate" id="edit-endDate" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-StartTime">시작시간</label>
                                <input class="inputModal" type="text" name="edit-startTime" id="edit-startTime" />
                            </div>
                      
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-endTime">종료시간</label>
                                <input class="inputModal" type="text" name="edit-endTime" id="edit-endTime" />
                            </div>
                        </div>
                        
                        <div class="row" id="dayInfo">
                            <div class="col-xs-12">
                  				<label class="col-xs-4" for="dayInfo[]">요일 선택</label>
                                <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="1">일요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="2">월요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="3">화요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="4">수요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="5">목요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="6">금요일</label>
		                        <label class="checkbox-inline"><input type="checkbox" name = "dayInfo[]" value="7">토요일</label>
                            </div>
                        </div>
                        
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
		                           <option value="방문간병">방문간병</option>
		                            <option value="병원간병">병원간병</option>
		                            <option value="운동도움">운동도움</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


    </div>
    <!-- /.container -->

    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/ko.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/js/addEvent.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/js/editEvent.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/js/etcSetting.js"></script>
</body>

</html>