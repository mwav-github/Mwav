package net.mwav.common.module;

import org.springframework.stereotype.Component;

@Component("constants")
public final class Constants {

	public static final boolean SUCEESS = true;
	public static final boolean FAIL = false;

	public Goods goods = new Goods();

	public class Goods {
		public final String tmpImgFilePath = "/xUpload/GoodsData/TempImages";
		//public final String imgFilePath = "/xUpload/GoodsData/Goods"; // (xUpload/GoodsData/)경로 Goods-10001.jpg 생김
		public final String imgFilePath = "/MwavDev/workspace/MwavDev/src/main/webapp/xUpload/GoodsData/Goods"; //C:\MwavDev\workspace\MwavDev\src\main\webapp\xUpload
		
	}

	public final String dot = ".";
}
