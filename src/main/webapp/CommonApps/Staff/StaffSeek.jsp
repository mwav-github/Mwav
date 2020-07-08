<!-- /*
파일명 : StaffSeek.jsp
내 용 : 직원 검색을 위한 모듈
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script>

        <!-- 모든 직원 리스트를 불러옴 -->
        function getStfList() {
            var stfName = $('#stfName').val();

            $.ajax({
                url:'/admins/staff/selectStaffSeek.mwav',
                data:{
                    'stfName' : stfName
                },
                type:'post',
                async:false,
                success:function (stf) {

                    <% // TODO : 화면 리스트 출력 조정 필요 %>
                    stf.stfList.forEach(function (item, index, arr){
                        $('#stfResult').append('<tr>' +
                                '<td>' + item.staff_id + '</td>' +
                                '<td>' + item.stfClass + '</td>' +
                                '<td>' + item.stfDeptName + '</td>' +
                                '<td>' + item.stfName + '</td>' +
                            '</tr>');
                    })
                },
                error:function (err) {
                    alert(err)
                }
            });

        }

        // 텍스트 엔터 이벤트
        function stfEnterSearch() {
            var evt_code = (window.netscape) ? ev.which : event.keyCode;
            if (evt_code == 13) {
                event.preventDefault();
                getStfList();
            }
        }
    </script>
</head>
<body>

<!-- 모든필드 필수값으로 ~!  -->
<div class="container">
    <!-- Modal -->
    <div class="modal fade stf_modal_post " id="StaffSeekModal" aria-hidden="true" role="dialog">
        <div class="modal-dialog modal-md">

            <div class="modal-content">

                <div class="modal-header" style="border-bottom: 0px solid #eee; background-color: #0480be; color: white;">
                    <h4 class="modal-title">직원 찾기</h4>
                </div>
                <br>

                <div class="modal-body">
                    <div class="container-fluid">
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active fade in">
                                <form class="form-horizontal" id="post_form" method="post">

                                    <div class="col-md-12 ">
                                        <div class="row">
                                            <div class="input-group">
                                                <input type="hidden" name="currentPage" value="1"/>
                                                <input type="hidden" name="countPerPage" value="5"/>

												<span class="input-group-addon">직원 명</span>
                                                <input type="text" id='stfName' name="keyword" class="form-control" placeholder="Press Enter" onkeydown="stfEnterSearch();"/>
                                                <span class="input-group-btn">
													<button type="button" class="btn btn-default" onclick="getStfList()">
														<span class="glyphicon glyphicon-search">
															<span class="sr-only">Search</span>
														</span>
													</button>
												</span>

                                            </div>
                                        </div>
                                        <div class="row" style="margin-top:10px;">
                                            <div id="">
                                                <table class="table-responsive table table-striped ">
                                                    <thead>
														<tr>
															<th class="col-md-2 text-center">사번</th>
															<th class="col-md-5 text-center">부서</th>
                                                            <th class="col-md-2 text-center">직급</th>
															<th class="col-md-3 text-center">이름</th>
														</tr>
                                                    </thead>
                                                    <tbody id="stfResult" class="ondis">

                                                    </tbody>
                                                </table>

                                            </div>
                                            <div class="text-center">
                                                <div class="col-lg-12">
                                                    <ul class="pagination" id="stfPageApi">
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
