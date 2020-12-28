
class ImageMng {
	
	getResizeDataurl(p_imgObj, p_width, p_height, p_type) {
		
		var canvas = document.createElement("canvas");    
		var ctx = canvas.getContext("2d");
		
		canvas.width = p_width;
        canvas.height = p_height;		
        
        var ctx = canvas.getContext("2d");
        ctx.drawImage(p_imgObj, 0, 0, p_width, p_height);
				
        var l_img_type = 'image' + '/' + p_type;
        var dataurl = canvas.toDataURL(l_img_type);
        return dataurl;        
	}
	
}