package net.common.common;

public class Paging {

	private int totalRows = 0;
	private int currentPage = 1;
	private int pageSize = 10;
	private int blockSize = 10;
	private int totalPages;
	private int totalBlocks;
	private int startPageNum;
	private int endPageNum;
	private int currentBlock;

	private String amp = "";

	// for design
	public String firstLink = "[<<]";
	public String firstOffLink = "";
	public String prevLink = "[<]";
	public String prevOffLink = "";
	public String nextLink = "[>]";
	public String nextOffLink = "";
	public String lastLink = "[>>]";
	public String lastOffLink = "";

	public String delimiter = "|";

	// current Page Wrapper
	public String preWrap = "<b>";
	public String postWrap = "</b>";

	public String linkPage = "";
	public String queryString = "";

	// result temp object
	public StringBuffer pageString = new StringBuffer();

	public Paging(int currentPage, int pageSize, int blockSize, int totalRows) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		this.totalRows = totalRows;

		initialize();
	}

	public void initialize() {
		this.totalPages = (int) Math.ceil((double) this.totalRows
				/ this.pageSize);
		this.totalBlocks = (int) Math.ceil((double) this.totalPages
				/ this.blockSize);
		this.currentBlock = (int) Math
				.ceil((double) ((this.currentPage - 1) / this.blockSize)) + 1;
		this.startPageNum = ((this.currentBlock - 1) * this.pageSize) + 1;
		this.endPageNum = this.startPageNum + this.pageSize;
	}

	public void prePrint() {
		// set first block link
		if (this.currentBlock > 1)
			pageString.append("<a href=\"" + this.linkPage + "?"
					+ this.queryString + this.amp + "pageNum="
					+ (((this.currentBlock - 2) * this.pageSize) + 1) + "\">"
					+ this.firstLink + "</a> ");
		else
			pageString.append(this.firstOffLink + " ");

		// set prev page link
		if (this.currentPage > 1)
			pageString.append("<a href=\"" + this.linkPage + "?"
					+ this.queryString + this.amp + "pageNum="
					+ (this.currentPage - 1) + "\">" + this.prevLink + "</a> ");
		else
			pageString.append(this.prevOffLink + " ");
	}

	public void postPrint() {
		// set next page link
		if (this.currentPage < this.totalPages)
			pageString.append("<a href=\"" + this.linkPage + "?"
					+ this.queryString + this.amp + "pageNum="
					+ (this.currentPage + 1) + "\">" + this.nextLink + "</a> ");
		else
			pageString.append(this.nextOffLink + " ");

		// set last page link
		if (this.currentBlock < this.totalBlocks)
			pageString.append("<a href=\"" + this.linkPage + "?"
					+ this.queryString + this.amp + "pageNum="
					+ ((this.currentBlock * this.pageSize) + 1) + "\">"
					+ this.lastLink + "</a> ");
		else
			pageString.append(this.lastOffLink);
	}

	public void printList() {
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i > this.totalPages || i == endPageNum)
				break;
			else if (i > startPageNum)
				pageString.append(this.delimiter);

			if (i == this.currentPage)
				pageString.append(" " + this.preWrap + i + this.postWrap + " ");
			else
				pageString.append(" <a href=\"" + this.linkPage + "?"
						+ this.queryString + this.amp + "pageNum=" + i + "\">"
						+ i + "</a> ");
		}
	}

	public String print() {
		// set amp if already to set up queryString property
		if (!this.queryString.equals(""))
			this.amp = "&";

		if (this.totalPages > 1) {
			this.prePrint();
			this.printList();
			this.postPrint();
		}

		return (pageString.toString());
	}

	/**
	 * @param args
	 */
	/*
	 * public static void main(String[] args) {
	 * 
	 * // TODO Auto-generated method stub PagingHepler pageNum = new
	 * PagingHepler(1 , 10, 10 , 11); pageNum.linkPage = "pagenum.jsp";
	 * pageNum.queryString = "param1=test&param2=test2";
	 * 
	 * // for design pageNum.firstLink = "<img src=\"/first.gif\">";
	 * pageNum.prevLink = "<img src=\"/prev.gif\">"; pageNum.nextLink =
	 * "<img src=\"/next.gif\">"; pageNum.lastLink = "<img src=\"/last.gif\">";
	 * 
	 * pageNum.firstOffLink = "[<<]"; pageNum.prevOffLink = "[<]";
	 * pageNum.nextOffLink = "[>]"; pageNum.lastOffLink = "[>>]";
	 * 
	 * pageNum.delimiter = "||";
	 * 
	 * 
	 * //print System.out.println(pageNum.print()); }
	 */

}
