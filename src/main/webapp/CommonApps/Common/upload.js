/*
class isError {
	constructor(height, width) {
		this.isErr = true;
	    this.errString = "";
	  }	
}
*/
var isError = {
	isErr: false,
	errString: ""	  
};

class ImageUpload {
	tempUpload(fd, url, isError) {
		if (fd == null || fd.length == 0) {
			// alert('파일이 없습니다.');
			isError.isErr = false;
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
				if (data) {					
					isError.isErr = false;	
					isError.errString = "업로드 성공";
				} 
				else {
					isError.isErr = true;
					isError.errString = "업로드 실패";					
				}
			}
		});
	}
}
