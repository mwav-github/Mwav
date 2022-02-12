package net.mwav.common.module;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.ResampleOp;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/* 
 ========이미지를 변환하고 저장하는것을 담당하는 ImageUtill ==========
 용도 : 비율 별 이미지 생성, 사이즈 별 이미지 생성, 이미지저장.

 ========일자 별 설명=========

 순번  |    요일    |             내용              |     
 ㅡㅡㅡ------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 1.   12 20     메소드생성(scaleRatio(), scaleSize(), saveImage())
 */
public class ImageUtill {

	private static final Logger logger = LoggerFactory.getLogger(ImageUtill.class);

	/* 자바 imageScaling */
	/**
	 * 비율로 이미지를 변환하여 반환하는 메소드 (예 - 80퍼센트 이렇게) 파라미터- srcImage: 변환시킬 원본이미지. ratio:
	 * 변환시킬 비율. 리턴값- rescaledImage: 변환된 이미지.
	 */
	public static BufferedImage scaleRatio(BufferedImage srcImage, double ratio) {
		int actualHeight = srcImage.getHeight();
		int actualWidth = srcImage.getWidth();
		logger.debug("원본이미지의 넓이: " + actualWidth);
		logger.debug("원본이미지의 높이: " + actualHeight);
		ratio = (double) (ratio / 100);
		logger.debug("적용시킬 비율: " + ratio);

		int height, width;
		height = (int) (actualHeight * ratio);
		width = (int) (actualWidth * ratio);
		logger.debug("변환될 이미지의 넓이: " + width);
		logger.debug("변환될 이미지의 넓이: " + height);
		ResampleOp resampleOp = new ResampleOp(width, height);
		resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
		BufferedImage rescaledImage = resampleOp.filter(srcImage, null);

		return rescaledImage;
	}

	/* 아래 두개 메소드는 GdsCellProcAction, GdsUpLoaderAction 사용 */
	/**
	 * 사이즈로 이미지를 변환하여 반환하는 메소드 파라미터- srcImage: 변환시킬 원본이미지. width: 변환시킬 이미지의 넓이값.
	 * height: 변환시킬 이미지의 높이값. 리턴값- rescaledImage: 변환된 이미지.
	 */
	public static BufferedImage scaleSize(BufferedImage srcImage, double maxWidth, double maxHeight) {
		double x = srcImage.getHeight();
		double y = srcImage.getWidth();
		logger.debug("원본이미지의 넓이: " + x);
		logger.debug("원본이미지의 높이: " + y);

		int i = 0;
		while (x > maxWidth || y > maxHeight) {
			// 축소
			if (x > maxWidth) {
				y *= maxWidth / x;
				x = maxWidth;
			}
			if (y > maxHeight) {
				x *= maxHeight / y;
				y = maxHeight;
			}
			i += 1;
			if (i == 10)
				break;
		}
		logger.debug("변환될 이미지의 넓이: " + x);
		logger.debug("변환될 이미지의 높이: " + y);
		ResampleOp resampleOp = new ResampleOp((int) x, (int) y);
		resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
		BufferedImage rescaledImage = resampleOp.filter(srcImage, null);

		return rescaledImage;
	}

	/**
	 * 이미지를 저장하는 메소드 파라미터- path: 이미지가 저장될 경로. rescaledImage: 저장시킬 이미지. format:
	 * 저장시의 확장자.
	 */
	public static void saveImage(String path, BufferedImage rescaledImage, String format) {
		logger.debug("path= " + path);
		File destFile = new File(path);
		try {

			logger.debug("rescaledImage =" + rescaledImage);
			ImageIO.write(rescaledImage, format, destFile);
			logger.debug("성공적으로 저장되었습니다.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
