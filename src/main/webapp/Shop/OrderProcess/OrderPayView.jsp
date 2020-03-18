<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
http://bootsnipp.com/snippets/featured/responsive-shopping-cart 
반응형 체크 필요.

http://bootsnipp.com/snippets/featured/carousel-product-cart-slider
>cart 슬라이더 형태로 

16.07.09 Admins/Order에는 있었으나 여기에는 동일 파일명으로 신규생성
wish 는 https://www.wish.com/#cid=563db50683b75d5a54fedcfc 와 같이 id 값은 변경 	
 --%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<script src="/CommonLibrary/Javascript/ajax_call.js"></script>

<script>
	$(document).ready(
			function() {
				$.extend({
					getUrlVars : function() {
						var vars = [], hash;
						var hashes = window.location.href.slice(
								window.location.href.indexOf('?') + 1).split(
								'&');
						for (var i = 0; i < hashes.length; i++) {
							hash = hashes[i].split('=');
							vars.push(hash[0]);
							vars[hash[0]] = hash[1];
						}
						return vars;
					},
					getUrlVar : function(name) {
						return $.getUrlVars()[name];
					}
				});
				var byName = $.getUrlVar('mode');
				var mode_ = "<c:out value='${mode}'/>"// 이것도 가능. ${mode} 아래의 단계를 인식 못함.

				if (byName == 'SMbrInput') {
					$('ul.setup-panel li:eq(1)').removeClass('disabled');
					$('ul.setup-panel li:eq(0)').removeClass('active');
					$('ul.setup-panel li:eq(1)').addClass('active');

					$('ul.setup-panel li:eq(2)').addClass('disabled');
					$('ul.setup-panel li:eq(0)').addClass('disabled');
					$(this).remove();
				} else if (mode_ == 'SDMbrInput') {
					$('ul.setup-panel li:eq(2)').removeClass('disabled');
					$('ul.setup-panel li:eq(0)').removeClass('active');
					$('ul.setup-panel li:eq(2)').addClass('active');

					$('ul.setup-panel li:eq(1)').addClass('disabled');
					$('ul.setup-panel li:eq(0)').addClass('disabled');
					$(this).remove();
				}
			});
</script><script>
	$(document).ready(
			function() {

				$('#openModal').click(function() {
					$('#contact').modal();
				});
				//insert
				$('#btnSavePerson').click(function() {
					//is it a good idea to have the data objects inside all of these functions?    
					var data = {

						personId : $('#tbPersonId').val(),
						firstName : $('#tbFirstName').val(),
						lastName : $('#tbLastName').val()
					};
					person.insert(data);
				});

				//delete
				$('.ajax_btnDelete').click(
						function() {

							var url = '/shop/order/OrderCartDelete.mwav';
							console.log(url);
							
							var now_position = $(this).closest("tr");
							
							var goods_id = now_position.children("input[name~='goods_id']").val();
							console.log(goods_id);
							var orderCart_id = now_position.children("input[name~='orderCart_id']").val();
							console.log(ocChoiceDt);
							
							var ocChoiceDt = now_position.children("input[name~='ocChoiceDt']").val();
							
							var data = "goods_id=" + goods_id
									+ "&orderCart_id=" + orderCart_id
									+ "&ocChoiceDt=" + ocChoiceDt
									+ "";
							console.log(data);
							person.remove(data, url);
						});

				//update
				/* $('.ajax_btnUpdate').click(function() {
					var data = {
						personId : $('#tbPersonId').val(),
						firstName : $('#tbFirstName').val(),
						lastName : $('#tbLastName').val()
					};
					console.log(JSON.stringify(data));
					person.update(data);
				}); */

				$('.ajax_btnUpdate').change(
						function() {
							//alert('sdff');
							/* var data = {
								goods_id : $("input[name~='goods_id']").val(),
								ocAmount : $("input[name~='ocAmount']").val(),
								ocChoiceDt : $("input[name~='ocChoiceDt']").val()
							}; */
							//console.log(JSON.stringify(data));
							
							//http://opendive.tistory.com/585  - context 의미
							var url = '/shop/order/orderCartUpdate.mwav';
							console.log(url);

							alert($(this).val()+'개를 선택하셧습니다.');
							
							console.log($(this));
							
							console.log($(this).closest("tr"));
							
							var now_position = $(this).closest("tr");
							var now_positions = $(this).parent();
							
							console.log(now_position);
							console.log(now_positions);
							
							var now_goods_id = now_position.children("input[name~='goods_id']");
							console.log(now_goods_id);
							var now_ocChoiceDt = now_position.children("input[name~='ocChoiceDt']");
							console.log(now_ocChoiceDt);
							var ocAmount = $(this).val();
							//console.log(now_ocAmount);
							
							
							var goods_id = now_goods_id.val();
							var ocChoiceDt = now_ocChoiceDt.val(); 
							//var ocAmount = now_ocAmount.val(); 
							//var goods_id = $("input[name~='goods_id']").val();
							//var ocAmount = $("select[name~='ocAmount']").val();
							
							//var ocChoiceDt = $("select."+ goods_id + "").val();
							//var gConsumerPrice = $(this).text('.gConsumerPrice');
							
							/* alert(eachPrice);
							var eachDeliveryCost = $('.eachDeliveryCost').val();
							var eachPrice = $('.eachPrice').val(); */
							
					
							

							//$("input[name~='ocAmount']").find('option:selected').removeAttr("selected");
							//var ocChoiceDt = $("input[name~='ocChoiceDt']").val();

							var data = "goods_id=" + goods_id + "&ocAmount="
									+ ocAmount + "&ocChoiceDt=" + ocChoiceDt;
							console.log(data);
							person.update(data, url);
						});
				//get
				$('#getPeople').click(function() {
					person.get();
				});
				//*********************person module

				$('#serializePeople').click(function() {
					person.get();

					var formData = $("#postfinder_2").serialize(); // 폼의 데이터를 한번에 다 http://chongmoa.com/6764 (파일업로드는 안됨)
					person.serialize(formData);
				});
				//*********************person serizlize

				//file 추가 하기 

				var person = (function() {
					//the ajax object will be passed and shared between
					//the functions here (type and dataType dont change in this example)
					var ajax = {
						type : "POST",
						url : "",
						data : {},
						//dataType : "json",
						//contentType : "application/json",
						success : {},
						error : {}
					}

					//************ insert
					function insert(data) {
						ajax.url = '../Service.asmx/InsertPerson';
						ajax.success = function() {
							console.log('success before setTimeout');
							var successMessage = $('<div>').text(
									'Successfully added to the database...')
									.css('color', 'green')
									.attr('id', 'success');
							$('.modal-body').append(successMessage);
							window.setTimeout(function() {
								$('.modal-body').each(function() {
									$(this).val('');
								});
								$('#contact').modal('hide');
							}, 1000);
						}
						ajax.data = JSON.stringify(data);
						ajax.error = function(xhr, ajaxOptions) {
							console.log(xhr.status);
							console.log(ajaxOptions);
						};
						$.ajax(ajax);
					}
					//************* delete
					function remove(data, url) {
						ajax.url = url;
						//console.log('working string: ');
						ajax.data = data, ajax.success = function(data) {

							var check = data.check;

							if (check >= 1) {
								console.log("삭제성공");
								
								$('.subtotal_Price').text(data.totalConsumerPrice);
								$('.total_DeliveryCost').text(data.totalDeliveryCost);
								$('.total_Price').text(data.AllTotal_ConsumerPrice);

								//alert($("." + data.goods_id + ""));
								$("tr." + data.goods_id + "").hide();
								//cartlist_sum();

							} else {
								console.log("삭제실패");

							}

						};
						ajax.error = function(xhr, ajaxOptions) {
							console.log(xhr.status);
							console.log(ajaxOptions);
						}
						$.ajax(ajax);
					}
					//*************** update
					function update(data, url) {
						ajax.url = url, ajax.data = data,/* ajax.data = JSON
																																.stringify(data) */
						ajax.success = function(data) {
							console.log('update was successful');
							console.log('ocAmount' + data);
							var name, select, option;
							
							//var sum = (data * gConsumerPrice);
							//alert(sum);
							//('.subtotal_Price').text(sum);

							//아래와 같이 안하면 select가 동일name으로 되어있어서 하나 바꾸면 다 바뀐다. 구분을 못함
							
							//select = $('.ajax_btnUpdate');
							//select = select_goods_id;
							
							//추후 회원 및 비회원가에 대한 체크 필요.
							$('.subtotal_Price').text(data.totalConsumerPrice);
							$('.total_DeliveryCost').text(data.totalDeliveryCost);
							$('.total_Price').text(data.AllTotal_ConsumerPrice);
							
							select = $("select ."+ data.goods_id + "");
							//"."+ select + ""
							//selectOption = $('.ajax_btnUpdate option');
							selectOption = $("select ."+ data.goods_id + " option");
							selectOption.remove();

							// Clear the old options
							//	select.options.length = 0;

							// Load the new options
							//https://developer.mozilla.org/en-US/docs/Web/API/HTMLOptionElement/Option 
							/* for (name in data) {
								if (data.hasOwnProperty(name)) {
									//원래 select.options.add(new Option(data[name], name)); 
									selectOption.append(new Option(data[name], data[name]));
								}
							} */

							//추후 재고만큼 출력되도록 변경되어야한다. 
							for (i = 1; i <= 10; i++) {
								select.append($('<option>', {
									value : i,
									text : i
								}));
								//alert(selectOption.text());
								//alert(select.text());

								$("select ."+ data.goods_id + " option[value=" + data.ocAmount + "]")
										.attr("selected", "selected");
								
								//alert('dsf0='+$("select ."+ data.goods_id + " option[value=" + data.ocAmount + "]"));

								/* if( selectOption.text() == data ) {
									alert(data);
									selectOption.attr("selected","selected");
								 } */
							}
							
							//cartlist_sum();

						};
						ajax.error = function(xhr, ajaOptions) {
							console.log(xhr.status);
						};
						$.ajax(ajax);
					}
					;
					//************** get
					function get(data) {
						//****** appropriate to have this function here?
						function style(json) {
							json = $.parseJSON(json);
							var $personArray = [];
							for ( var obj in json) {
								var $person = $('<div>').addClass('person');
								for ( var prop in json[obj]) {
									var label = $('<span>').text(prop)
											.addClass('badge pull-left')
											.appendTo($person);
									var propertyData = $('<span>').text(
											json[obj][prop]).addClass(
											'pull-right').appendTo($person);
								}
								$personArray.push($person);
							}
							return $personArray;
						}
						ajax.url = '../Service.asmx/GetPersons';
						ajax.success = function(data) {
							data = data.d;
							console.log('ajax successful');
							$('body').append(style(data));
						};
						ajax.error = function(xhr, ajaxOptions) {
							console.log(xhr.status);
							console.log(ajaxOptions);
						}
						$.ajax(ajax);
					}

					//************** serialize
					function serialize() {
						ajax.url = '../Service.asmx/InsertPerson';
						ajax.success = function() {
							console.log('success before setTimeout');
							var successMessage = $('<div>').text(
									'Successfully added to the database...')
									.css('color', 'green')
									.attr('id', 'success');
							$('.modal-body').append(successMessage);
							window.setTimeout(function() {
								$('.modal-body').each(function() {
									$(this).val('');
								});
								$('#contact').modal('hide');
							}, 1000);
						}
						ajax.data = JSON.stringify(data);
						ajax.error = function(xhr, ajaxOptions) {
							console.log(xhr.status);
							console.log(ajaxOptions);
						};
						$.ajax(ajax);
					}
					//*********** public methods
					return {
						insert : insert,
						remove : remove,
						update : update,
						get : get,
						serialize : serialize
					};

				})();

				//cartlist_sum();
			});
</script>

</head>
<body>
	<!-- Navigation (=메인 메뉴 및 슬라이드 쇼 포함)
	     Index의 마스터 페이지
	 -->
	<!--  //////////////////////////////////// -->
	<jsp:include
		page="/PartsOfContent/SiteHeader/FrontHeader_Shop_Left.jsp"
		flush="false" />

	<!-- Page Content -->
	<div class="container">

		<div class="enter"></div>
		<div class="enter"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="row form-group">
					<div class="col-xs-12">
						<ul class="nav nav-pills nav-justified thumbnail setup-panel">
							<!-- a태그는 css 기본적용 때문에 추가 -->
							<li class="active"><a>
									<h4 class="list-group-item-heading">Step 1</h4>
									<p class="list-group-item-text">First step description</p>
							</a></li>
							<li class="disabled"><a>
									<h4 class="list-group-item-heading">Step 2</h4>
									<p class="list-group-item-text">Second step description</p>
							</a></li>
							<li class="disabled"><a>
									<h4 class="list-group-item-heading">Step 3</h4>
									<p class="list-group-item-text">Third step description</p>
							</a></li>
						</ul>
					</div>
				</div>
				<c:if test="${param.mode == 'Default'}">
					<!--/////////////////////////////////////////////////// -->
					<jsp:include page="/CommonApps/Member/TermsOfUse.jsp" flush="false" />
					<!--/////////////////////////////////////////////////// -->
				</c:if>
				<c:if test="${param.mode == 'SMbrInput'}">
					<div class="row setup-content" id="step-2">
						<div class="col-xs-12">
							<h1 class="text-left">STEP 2</h1>

							<!--/////////////////////////////////////////////////// -->
							<jsp:include page="/CommonApps/Member/MbrInput.jsp" flush="false" />
							<!--/////////////////////////////////////////////////// -->

						</div>
					</div>
				</c:if>

				<c:if test="${param.mode == 'SDMbrInput'}">

					<div class="row setup-content" id="step-3">
						<div class="col-xs-12">
							<h1 class="text-left">STEP 3</h1>

							<!--/////////////////////////////////////////////////// -->
							<jsp:include page="/CommonApps/Member/MbrLandingPage.jsp"
								flush="false" />
							<!--/////////////////////////////////////////////////// -->
						</div>
					</div>
				</c:if>

			</div>
		</div>

		<div class="enter"></div>
		<div class="enter"></div>

		<div class="row">

			<!-- Modal -->
			<div class="orderCart" id="orderCart">
				<form class="form-horizontal" name="orderCart_frm" id="cart_list"
					method="post">

					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12 col-md-12	">
								<table class="table table-hover">
									<colgroup>
										<col class="col-md-1">
										<col class="col-md-6">
										<col class="col-md-1">
										<col class="col-md-1">
										<col class="col-md-1">
										<col class="col-md-2">
									</colgroup>
									<thead>
										<tr>
											<th>No.</th>
											<th>Product</th>
											<th>Quantity</th>
											<th class="text-center">Price</th>
											<th class="text-center">Shipping</th>
											<th class="text-center">Total </th>
											<th></th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="VselectListOrderCartList"
											items="${selectListOrderCartChecked}" varStatus="status">

											<c:if
												test="${VselectListOrderCartList.ocChoiceDt != '' || VselectListOrderCartList.ocChoiceDt ne null}">

												<tr class="${VselectListOrderCartList.goods_id }">
													<input type="hidden" id="goods_id" name="goods_id"
														value="${VselectListOrderCartList.goods_id }" />

													<input type="hidden" id="orderCart_id" name="orderCart_id"
														value="${VselectListOrderCartList.orderCart_id}" />

													<input type="hidden" id="ocChoiceDt" name="ocChoiceDt"
														value="${VselectListOrderCartList.ocChoiceDt }" />

													<td class="col-sm-1 col-md-1">${status.count }</td>
													<td class="col-sm-6 col-md-6">
														<div class="media">
															<a class="thumbnail pull-left" href="#"> <img
																class="media-object"
																src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
																style="width: 72px; height: 72px;">
															</a>
															<div class="media-body">
																<h4 class="media-heading">
																	<a href="#">${VselectListOrderCartList.gName }</a>
																</h4>
																<h5 class="media-heading">
																	by <a href="#">${VselectListOrderCartList.gManufacturer }</a>
																</h5>
																<span>Status: </span><span class="text-success"><strong>In
																		Stock</strong></span>
															</div>
														</div>
													</td>

													<c:if test="${sessionScope.member_LoginId ne null }">
														<c:set var="price"
															value="${VselectListOrderCartList.gMemberPrice }" />
													</c:if>
													<c:if test="${sessionScope.member_LoginId eq null }">
														<c:set var="price"
															value="${VselectListOrderCartList.gConsumerPrice}" />
													</c:if>



													<td class="col-sm-1 col-md-1 text-center "><select
														name="ocAmount"
														class="form-control input-sm ajax_btnUpdate ${VselectListOrderCartList.goods_id }"
														value="${VselectListOrderCartList.goods_id }">


															<%-- <c:forEach var="ocCount" begin="1"
															end="${VselectListOrderCartList.ocAmount }" step="1"> --%>
															<c:forEach var="ocCount" begin="1" end="10" step="1">
																<c:choose>
																	<c:when
																		test="${ocCount eq VselectListOrderCartList.ocAmount}">
																		<option class="option_this" selected="selected">${ocCount}</option>
																	</c:when>
																	<c:otherwise>
																		<option class="option_this">${ocCount}</option>
																	</c:otherwise>

																</c:choose>
															</c:forEach>
															<c:set var="ocCount_" value="${ocCount.value}" />
													</select></td>

													<td class="col-sm-1 col-md-1 text-center gConsumerPrice">${VselectListOrderCartList.gConsumerPrice }</td>
													<!-- <td class="col-sm-1 col-md-1 text-center"><strong  class="totalprice" id="totalprice" value="">0</strong></td> -->
													<td class="eachPrice" style="display: none;">${(price * VselectListOrderCartList.ocAmount)}</td>
													<td class="col-sm-1 col-md-1 text-center eachDeliveryCost">${VselectListOrderCartList.gDeliveryCost }</td>

													<td class="col-sm-1 col-md-1 text-center eachTotalPrice">${(price * VselectListOrderCartList.ocAmount) + VselectListOrderCartList.gDeliveryCost}
													</td>
													<td class="col-sm-2 col-md-2">
														<button type="button"
															class="btn btn-danger ajax_btnDelete">
															<span class="glyphicon glyphicon-remove"></span> Remove
														</button>
													</td>
												</tr>
											</c:if>
											<c:if
												test="${VselectListOrderCartList.ocChoiceDt == '' || VselectListOrderCartList.ocChoiceDt eq null}">
												<tr>
													<td colspan="6">조회된 결과가 없습니다.</td>
												</tr>
											</c:if>

										</c:forEach>

										<tr>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><h5>Subtotal</h5></td>
											<td class="text-right subtotal_Price"><strong></strong></td>
										</tr>
										<tr>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><h5>Estimated shipping</h5></td>
											<td class="text-right total_DeliveryCost"><h5>
													<strong></strong>
												</h5></td>
										</tr>

										<tr>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><h5>Total</h5></td>
											<td class="text-right total_Price"><h5>
													<strong> </strong>
												</h5></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>


		<div class="row marketing">
			<div class="col-lg-6">

				<h4>
					<b>Product Name</b>
				</h4>
				<hr />

				<form class="form-horizontal" role="form">
					<fieldset>

						<!-- Text input-->
						<div class="form-group">
							<div class="col-sm-12">
								<input type="text" placeholder="Email Address"
									class="form-control">
							</div>
						</div>
						<hr>

						<p>
							<b>Shipping Details</b>
						</p>

						<!-- Text input-->
						<div class="form-group">
							<div class="col-sm-6">
								<input type="text" placeholder="First Name" class="form-control">
							</div>
							<div class="col-sm-6">
								<input type="text" placeholder="Last Name" class="form-control">
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<div class="col-sm-12">
								<input type="text" placeholder="Shipping Address"
									class="form-control">
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<div class="col-sm-12">
								<input type="text" placeholder="City" class="form-control">
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<div class="col-sm-6">
								<input type="text" placeholder="Phone #" class="form-control">
							</div>
							<div class="col-sm-6">
								<input type="text" placeholder="Post Code" class="form-control">
							</div>
						</div>

						<!-- Select Basic -->
						<div class="form-group">
							<div class="col-md-12">
								<select id="Country" name="Country" class="form-control">
									<option value="1">Sverige</option>
								</select>
							</div>
						</div>

					</fieldset>
				</form>

				<hr />
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Coupon">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">Apply</button>
					</span>
				</div>
				<!-- /input-group -->

			</div>

			<div class="col-lg-6">

				<p>
					<b>Product Options</b>
				</p>

				<p>Variable Type #1</p>

				<div class="btn-group btn-group-justified" data-toggle="buttons">
					<label class="btn btn-primary active"> <input type="radio"
						name="options" id="option1" autocomplete="off" checked>Variable
						#1
					</label> <label class="btn btn-primary"> <input type="radio"
						name="options" id="option2" autocomplete="off">Variable #2
					</label> <label class="btn btn-primary"> <input type="radio"
						name="options" id="option2" autocomplete="off">Variable #3
					</label>
				</div>

				<hr />

				<p>
					<b>Checkout</b>
				</p>

				<div class="btn-group btn-group-justified" data-toggle="buttons">

					<label class="btn btn-success"> <input type="radio"
						name="options" id="option2" autocomplete="on">Once-Off
					</label> <label class="btn btn-success"> <input type="radio"
						name="options" id="option2" autocomplete="on">Monthly
					</label> <label class="btn btn-success"> <input type="radio"
						name="options" id="option3" autocomplete="off">Quarterly
					</label>
				</div>

				<br />

				<div class="panel panel-default">
					<div class="panel-heading">
						<p>
							<span class="badge pull-right">249 SEK / monthly</span><span
								class="badge pull-left">Variable #1</span>
						</p>
					</div>

					<div class="panel-body">
						<form role="form">
							<div class="form-group">
								<label for="cardNumber">Card Number</label>
								<div class="input-group">
									<input type="text" class="form-control" id="cardNumber"
										placeholder="XXXX XXXX XXXX XXXX" required  /> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-7 col-md-7">
									<div class="form-group">
										<label for="expityMonth">Expiry Date</label> <br />

										<div class="col-xs-6 col-lg-6 pl-ziro">
											<input type="text" class="form-control" id="expityMonth"
												placeholder="MM" required />
										</div>
										<div class="col-xs-6 col-lg-6 pl-ziro">
											<input type="text" class="form-control" id="expityYear"
												placeholder="YY" required />
										</div>
									</div>
								</div>
								<div class="col-xs-5 col-md-5 pull-right">
									<div class="form-group">
										<label for="cvCode">CVV Code</label> <input type="password"
											class="form-control" id="cvCode" placeholder="XXX" required />
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

				<a href="http://bootsnipp.com/fullscreen/6nOBB"
					class="btn btn-warning btn-lg btn-block" role="button"><span
					class="glyphicon glyphicon-play"></span> CONFIRM ORDER</a>

			</div>


		</div>

	</div>

	</div>
	<!-- /container -->
	<!-- /.container -->

	<div class="enter"></div>

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter_Shop.mwav"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>
</body>
</html>
