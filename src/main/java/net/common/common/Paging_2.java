package net.common.common;

public class Paging_2 {

	PagingVO paging = new PagingVO();
	int pageSize; // 한 페이지의 글의 개수
	int currentPage;
	int startRow; // 한 페이지의 시작글 번호
	int endRow; // 한 페이지의 마지막 글번호
	int count;
	int number;
	int pageCount;
	int imsi;
	int pageBlock;
	int result;
	int startPage;
	int endPage;

	public PagingVO pagevalue(int count, int pageSize) {
		this.count = count;
		this.pageSize = 5;
		initialize();

		return paging;
	}

	public void initialize() {

		if (count % pageSize == 0) {
			imsi = 0;
		} else {
			imsi = 1;
		}

		pageCount = count / pageSize + imsi;
		pageBlock = 3;
		result = (currentPage - 1) / pageBlock;
		startPage = result * pageBlock + 1;
		endPage = startPage + pageBlock - 1;
		startRow = (currentPage - 1) * pageSize + 1;
		endRow = currentPage * pageSize;
		
		if (endPage > pageCount){
			endPage = pageCount;
		}

		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setPageBlock(pageBlock);
		paging.setPageCount(pageCount);
		paging.setEndRow(endRow);
		paging.setStartRow(startRow);
	}

	public int getStartRow(String pageNum) {
		currentPage = Integer.parseInt(pageNum);
		startRow = (currentPage - 1) * pageSize + 1;
		System.out.println("currentPage="+currentPage);
		System.out.println("pageSize="+pageSize);
		System.out.println("startRow="+startRow);
		return startRow;

	}

	public int getEndRow(String pageNum) {
		currentPage = Integer.parseInt(pageNum);
		endRow = currentPage * pageSize;
		System.out.println("currentPage="+currentPage);
		System.out.println("pageSize="+pageSize);
		System.out.println("endRow="+endRow);
		return endRow;

	}
}