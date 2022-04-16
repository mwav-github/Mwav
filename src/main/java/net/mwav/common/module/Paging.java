package net.mwav.common.module;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Paging {

	private static final Logger logger = LoggerFactory.getLogger(Paging.class);

	PagingVO paging = new PagingVO();
	int pageSize; // 한 페이지의 글의 개수
	int currentPage; // 현재 페이지
	// *pageNum도 현재 페이지 단! pageNum은 세션으로 고정 // currentPage는 계산으로 쓰이기에 분리
	int startRow; // 한 페이지의 시작글 번호 =쿼리에서 ROWNUM (시작)
					// ex) pageSize가 5인경우 1페이지 - 1 // 2페이지 - 6
	int endRow; // 한 페이지의 마지막 글번호 = ROWNUM (끝)
				// ex) pageSize가 5인경우 1페이지 - 5 // 2페이지 - 10
	int totalRow; // 전체 글의 갯수

	int pageCount; // 전체 페이지수
					// 위는 전체 글의 갯수이고 해당 필드는 전체 페이지의 수이다.

	int remainRow; // 남은 행이 있는지 검사
					// 전체 행(=COUNT) % 페이지 크기(10)0이면 딱 맞는 것이고 1이면 false 적거나 많은 것
	int pageBlock; // 하나의 블록에 몇 페이지가 속해있는지
					// 즉 3이면 보이지는 곳에는 1,2,3 페이지가 한블록 // 4,5,6 페이지가 한 블록
	int result; // 시작페이지를 잡아준다.
	int startPage; // 현재 블록의 시작 페이지 아래를 보면 6페이지부터는 2블록이 된다.
					// 1페이지 는 0 * 1/5 + 1 => 1
					// 6페이지 는 6 * 6/5 + 1 => 2

	int endPage; // 현재 블록의 마지막 페이지

	int number; // 실제 화면에 보여지는 시작 글 번호 1페이지 맨위 번호

	// count는 요청시마다 다시 온다.
	// -> 계층형게시판시 사용

	public PagingVO setPagingInfo(int totalRow, int pageSize, String pageNum) {
		this.totalRow = totalRow;
		this.pageSize = pageSize; // 한 페이지에 5개의 게시글 노출
		this.currentPage = Integer.parseInt(pageNum);
		initialize();

		return paging;
	}

	public void initialize() {

		if (totalRow % pageSize == 0) {
			remainRow = 0;
		} else {
			remainRow = 1;
		}

		pageCount = totalRow / pageSize + remainRow;
		logger.debug("pageCount" + pageCount);
		pageBlock = 5; // <<1,2,3,4,5>>

		result = (currentPage - 1) / pageBlock;
		logger.debug("result=" + result);

		startPage = result * pageBlock + 1;
		logger.debug("startPage=" + startPage);

		endPage = startPage + pageBlock - 1;
		startRow = (currentPage - 1) * pageSize + 1;
		endRow = currentPage * pageSize;

		// 남는 페이지에 대한 처리를 위해서 사용
		// 만약에 내가 페이지 블록으로 1~5까지 설정했을 때, endPage 즉 3,4,5에 내용이 없어도 페이지는 생성하게 된다.
		// 즉 endPage = pageCount로 잡아주어 해당 페이지까지만 생성해주는 것이다.
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setPageBlock(pageBlock);
		paging.setPageCount(pageCount);
		paging.setEndRow(endRow);
		paging.setStartRow(startRow);
	}

	public int getStartRow(String pageNum) { // 현재 페이지에서 첫 열 계산
		// currentPage = Integer.parseInt(pageNum);
		startRow = (currentPage - 1) * pageSize + 1;
		logger.debug("currentPage=" + currentPage);
		// logger.debug("pageSize="+pageSize);
		logger.debug("startRow=" + startRow);
		return startRow;

	}

	public int getEndRow(String pageNum) { // 현재 페이지에 마지막 열 계산
		currentPage = Integer.parseInt(pageNum);
		endRow = currentPage * pageSize;
		// logger.debug("currentPage="+currentPage);
		// logger.debug("pageSize="+pageSize);
		logger.debug("endRow=" + endRow);
		return endRow;

	}

	public String getPageNum(String imsi_pageNum) {
		String pageNum = imsi_pageNum;
		logger.debug("pageNum=" + pageNum);

		if (imsi_pageNum == null || imsi_pageNum == "") {
			pageNum = "1";
		}
		return pageNum;
	}
}