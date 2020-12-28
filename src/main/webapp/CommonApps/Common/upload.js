
var isError = {
	isErr: false,
	errString: ""	  
};

class ImageUpload {
	tempUpload(fd, url, isError) {
		if (fd == null || fd.length == 0) {
			// alert('파일이 없습니다.');
			isError.isErr = true;
			isError.errString = "파일이 없습니다.";			
			return;
		}
		
		//var fd = new FormData();
		//fd.append(files[0].name, files[0]);
		$.ajax({
			type : "POST",			
			url : url,
			data : fd,
			contentType : false,
			processData : false,
			cache : false,
			success : function(data) {
				if (data) { isError.isErr = false; } 
				else {
					isError.isErr = true;
					isError.errString = "업로드 실패";					
				}
			},
			/*error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        } */
		});
	}
}
