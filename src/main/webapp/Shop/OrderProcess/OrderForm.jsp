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

<script>
function orderCheck(count_sId) {
			var theForm = document.orderCartForm;
			if(count_sId == "0") {
				alert("장바구니에 담긴 물품이 없습니다.");
				return;
			} else {
				theForm.action = "orderPayView.mwav";
				theForm.submit();
			}
				
		}
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
		<!-- /.row -->
		<!-- Page Features -->
		<div class="row col-md-12">

			<!-- Modal -->
			<div class="orderCart" id="orderCart">
				<form class="form-horizontal" name="orderCart_frm" id="cart_list"
					method="post" action="/shop/order/orderPayView.mwav">

					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12 col-md-10 col-md-offset-1">
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
											<th class="text-center">Total</th>
											<th></th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="VselectListOrderCartList"
											items="${selectListOrderCartList}" varStatus="status">

											<c:if
												test="${VselectListOrderCartList.ocChoiceDt != '' || VselectListOrderCartList.ocChoiceDt ne null}">

												<tr class="${VselectListOrderCartList.goods_id }">
													<input type="hidden" id="goods_id" name="goods_idCount${status.count }"
														value="${VselectListOrderCartList.goods_id }" />
													<input type="hidden" id="goods_id" name="goods_id"
														value="${VselectListOrderCartList.goods_id }" />	

													<input type="hidden" id="orderCart_id" name="orderCart_id"
														value="${VselectListOrderCartList.orderCart_id}" />

													<input type="hidden" id="ocChoiceDt" name="ocChoiceDtCount${status.count }"
														value="${VselectListOrderCartList.ocChoiceDt }" />
													<input type="hidden" id="ocChoiceDt" name="ocChoiceDt"
														value="${VselectListOrderCartList.ocChoiceDt }" />	

													<td class="col-sm-1 col-md-1"><input type="checkbox"
														name="listNum" value="${status.count }" checked></td>
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


													<%-- <input type="text" id="ocAmount"
												name="ocAmount" value="${price}" /> --%>

													<%-- <button type="button" class="btn btn-default btn-md qtyplus"
													field='ocAmount' onClick="qtyplus(${price});">
													<span class="glyphicon glyphicon glyphicon-plus
"
														aria-hidden="true"></span>
												</button>

												<button type="button"
													class="btn btn-default btn-md qtyminus" field='ocAmount'
													onClick="qtyminus(${price});">
													<span class="glyphicon glyphicon glyphicon-minus"
														aria-hidden="true"></span>
												</button> --%>
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
											<td class="text-right subtotal_Price"><strong>${map.totalConsumerPrice}</strong></td>
										</tr>
										<tr>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><h5>Estimated shipping</h5></td>
											<td class="text-right total_DeliveryCost">${map.totalDeliveryCost}<h5>
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
											<td class="text-right total_Price">${map.AllTotal_ConsumerPrice}<h5>
													<strong> </strong>
												</h5></td>
										</tr>
										<tr>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											
											<td>
												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-shopping-cart"></span>
													Continue Shopping
												</button>
											</td>
											<td>
												<button type="button" class="btn btn-success">
													Checkout <span class="glyphicon glyphicon-play"></span>
												</button>
											</td>
											<td>
												<button type="submit" class="btn btn-success">
													Pay <span class="glyphicon glyphicon-play"></span>
												</button>
											</td>
										</tr>
									</tbody>

								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
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
