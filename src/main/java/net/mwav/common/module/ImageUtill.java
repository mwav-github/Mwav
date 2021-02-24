package net.mwav.common.module;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

//http://mvnrepository.com/artifact/com.mortennobel/java-image-scaling
//pom.xml 설정 후 사라짐. 
import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.ResampleOp;

/* 
 ========이미지를 변환하고 저장하는것을 담당하는 ImageUtill ==========
 용도 : 비율 별 이미지 생성, 사이즈 별 이미지 생성, 이미지저장.

 ========일자 별 설명=========

 순번  |    요일    |             내용              |     
 ㅡㅡㅡ------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 1.   12 20     메소드생성(scaleRatio(), scaleSize(), saveImage())
 */
public class ImageUtill {
	/* 자바 imageScaling */
	/**
	 * 비율로 이미지를 변환하여 반환하는 메소드 (예 - 80퍼센트 이렇게) 파라미터- srcImage: 변환시킬 원본이미지. ratio:
	 * 변환시킬 비율. 리턴값- rescaledImage: 변환된 이미지.
	 */
	public static BufferedImage scaleRatio(BufferedImage srcImage, double ratio) {
		int actualHeight = srcImage.getHeight();
		int actualWidth = srcImage.getWidth();
		System.out.println("원본이미지의 넓이: " + actualWidth);
		System.out.println("원본이미지의 높이: " + actualHeight);
		ratio = (double) (ratio / 100);
		System.out.println("적용시킬 비율: " + ratio);

		int height, width;
		height = (int) (actualHeight * ratio);
		width = (int) (actualWidth * ratio);
		System.out.println("변환될 이미지의 넓이: " + width);
		System.out.println("변환될 이미지의 넓이: " + height);
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
		System.out.println("원본이미지의 넓이: " + x);
		System.out.println("원본이미지의 높이: " + y);

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
		System.out.println("변환될 이미지의 넓이: " + x);
		System.out.println("변환될 이미지의 높이: " + y);
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
		System.out.println("path= " + path);
		File destFile = new File(path);
		try {

			System.out.println("rescaledImage =" + rescaledImage);
			ImageIO.write(rescaledImage, format, destFile);
			System.out.println("성공적으로 저장되었습니다.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
