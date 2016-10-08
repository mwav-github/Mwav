//http://codereview.stackexchange.com/questions/35316/javascript-module-pattern-with-ajax

function ajax_call() {
	
	//alert('sdfdf00');
	//open the modal
	//the update, delete and insert functions come from boxes present in a modal not shown
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
	$('#btnDeletePerson').click(function() {
		var personId = $('#tbDelete').val();
		person.remove(personId);
	});

	//update
	$('.ajax_btnUpdate').click(function() {
		var data = {
			personId : $('#tbPersonId').val(),
			firstName : $('#tbFirstName').val(),
			lastName : $('#tbLastName').val()
		};
		console.log(JSON.stringify(data));
		person.update(data);
	});
	
	$('.ajax_btnUpdate').change(function() {
		//alert('sdff');
		var data = {
			goods_id : $('#goods_id').val(),
			ocAmount : $('#ocAmount').val(),
			ocChoiceDt : $('#ocChoiceDt').val()
		};
		console.log(JSON.stringify(data));
		var url = '/shop/order/orderCartUpdate.do';
		console.log(url);
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
			dataType : "json",
			contentType : "application/json",
			success : {},
			error : {}
		}

		//************ insert
		function insert(data) {
			ajax.url = '../Service.asmx/InsertPerson';
			ajax.success = function() {
				console.log('success before setTimeout');
				var successMessage = $('<div>').text(
						'Successfully added to the database...').css('color',
						'green').attr('id', 'success');
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
		function remove(data) {
			ajax.url = '../Service.asmx/DeletePerson';
			console.log('working string: ');
			var obj = {
				personId : data
			};
			console.log(JSON.stringify(obj));
			ajax.data = JSON.stringify(obj);
			console.log(ajax.data);
			ajax.success = function() {
				console.log('person successfully deleted');
				var successMessage = $('<div>').text(
						'Person successfully deleted from the database').css(
						'color', 'red');
				$('.modal-body').append(successMessage);
				window.setTimeout(function() {
					$('.modal-body input').each(function() {
						$(this).val('');
					});
					$('#contact').modal('hide');
				}, 1000);
			};
			ajax.error = function(xhr, ajaxOptions) {
				console.log(xhr.status);
				console.log(ajaxOptions);
			}
			$.ajax(ajax);
		}
		//*************** update
		function update(data, url) {
			ajax.url = url, ajax.data = JSON
					.stringify(data),
					ajax.success = function() {
						console.log('update was successful');
						var name, select, option;

						select = frm.elements["ocAmount"];

						// Clear the old options
						select.options.length = 0;

						// Load the new options
						//https://developer.mozilla.org/en-US/docs/Web/API/HTMLOptionElement/Option 
						for (name in data) {
							if (data.hasOwnProperty(name)) {
								//원래 select.options.add(new Option(data[name], name)); 
								select.options.add(new Option(data[name], data[name]));
							}
						}
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
						var label = $('<span>').text(prop).addClass(
								'badge pull-left').appendTo($person);
						var propertyData = $('<span>').text(json[obj][prop])
								.addClass('pull-right').appendTo($person);
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
						'Successfully added to the database...').css('color',
						'green').attr('id', 'success');
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

}