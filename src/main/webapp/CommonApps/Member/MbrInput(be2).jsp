<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- container 안에 포함시키면 된다. 
http://planbong.tistory.com/531
-->
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">


<!-- 크기를 줄이고 싶으면 row -->
<div class='container'>
	<div class='panel panel-primary dialog-panel'>
		<div class='panel-heading'>
			<h5>Mwav - Member Registration</h5>
		</div>
		<div class='panel-body'>
			<form class='form-horizontal' role='form'>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_accomodation'>Login Id</label>

					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-11'>
								<input type="text" class="form-control" name="mbrLoginId"
									id="InputName" placeholder="예) mymg2002" required>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_accomodation'>Password</label>

					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-11'>
								<input type="text" class="form-control" name="mbrLoginPw"
									id="InputName" placeholder="예) 8자리이상" required>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_title'>Name</label>
					<div class='col-md-8'>
						<div class='col-md-2'>
							<div class='form-group internal'>
								<select class='form-control' name="mbrLastName" id='id_title'>
									<option>Mr</option>
									<option>Ms</option>
									<option>Mrs</option>
									<option>Miss</option>
									<option>Dr</option>
								</select>
							</div>
						</div>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<input class='form-control' name="mbrFirstName"
									id='id_first_name' placeholder='First Name' type='text'>
							</div>
						</div>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<input class='form-control' name="mbrLastName" id='id_last_name'
									placeholder='Last Name' type='text'>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_adults'>Phone</label>
					<div class='col-md-8'>
						<div class='col-md-2'>
							<div class='form-group internal'>
								<input class='form-control col-md-8' name="member_CellularP_1"
									id='id_adults' placeholder='010' type='number'>
							</div>
						</div>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<input class='form-control' name="member_CellularP_2"
									id='id_children' placeholder='3180' type='number'>
							</div>
						</div>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<input class='form-control' name="member_CellularP_3"
									id='id_children_free' placeholder='4451' type='number'>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_email'>Contact</label>
					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-11'>
								<input class='form-control' name="mbrEmail" id='id_email'
									placeholder='E-mail' type='text'>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_checkin'>Checkin</label>
					<div class='col-md-8'>
						<div class='col-md-3'>
							<div class='form-group internal input-group'>
								<input class='form-control datepicker' id='id_checkin'>
								<span class='input-group-addon'> <i
									class='glyphicon glyphicon-calendar'></i>
								</span>
							</div>
						</div>
						<label class='control-label col-md-2' for='id_checkout'>Checkout</label>
						<div class='col-md-3'>
							<div class='form-group internal input-group'>
								<input class='form-control datepicker' id='id_checkout'>
								<span class='input-group-addon'> <i
									class='glyphicon glyphicon-calendar'></i>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_equipment'>Equipment type</label>
					<div class='col-md-8'>
						<div class='col-md-3'>
							<div class='form-group internal'>
								<select class='form-control' id='id_equipment'>
									<option>Travel trailer</option>
									<option>Fifth wheel</option>
									<option>RV/Motorhome</option>
									<option>Tent trailer</option>
									<option>Pickup camper</option>
									<option>Camper van</option>
								</select>
							</div>
						</div>
						<div class='col-md-9'>
							<div class='form-group internal'>
								<label class='control-label col-md-3' for='id_slide'>Slide-outs</label>
								<div class='make-switch' data-off-label='NO' data-on-label='YES'
									id='id_slide_switch'>
									<input id='id_slide' type='checkbox' value='chk_hydro'>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_service'>Required Service</label>
					<div class='col-md-8'>
						<select class='multiselect' id='id_service' multiple='multiple'>
							<option value='hydro'>Hydro</option>
							<option value='water'>Water</option>
							<option value='sewer'>Sewer</option>
						</select>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2' for='id_pets'>Pets</label>
					<div class='col-md-8'>
						<div class='make-switch' data-off-label='NO' data-on-label='YES'
							id='id_pets_switch'>
							<input id='id_pets' type='checkbox' value='chk_hydro'>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_comments'>Comments</label>
					<div class='col-md-6'>
						<textarea class='form-control' id='id_comments'
							placeholder='Additional comments' rows='3'></textarea>
					</div>
				</div>
				<div class='form-group'>
					<div class='col-md-offset-4 col-md-3'>
						<button class='btn-lg btn-primary' type='submit'>Request
							Reservation</button>
					</div>
					<div class='col-md-3'>
						<button class='btn-lg btn-danger' style='float: right'
							type='submit'>Cancel</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

