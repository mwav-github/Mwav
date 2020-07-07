<!-- /*
파일명 : StaffSeek.jsp
내 용 : 직원 검색을 위한 모듈
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
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
                                                <input type="text" name="keyword" class="form-control" placeholder="Press Enter" onkeydown="StfenterSearch();"/>
                                                <span class="input-group-btn">
													<button type="button" class="btn btn-default" onclick="getAddrLoc()">
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
															<th class="col-md-6 text-center">부서</th>
															<th class="col-md-4 text-center">이름</th>
														</tr>
                                                    </thead>
                                                    <tbody id="stfResult" class="ondis" style="display: none">

                                                    </tbody>
                                                    <tbody id="stfNull">

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
