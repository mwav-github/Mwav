package net.mwav.common.module;

import org.springframework.stereotype.Component;

@Component("constants")
public final class Constants {
	
	public class Goods {
		public final String tmpImgFilePath = "/xUpload/GoodsData/TempImages";	
		public final String imgFilePath = "/xUpload/GoodsData/Goods";
	}
	
	public Goods goods = new Goods();
}
