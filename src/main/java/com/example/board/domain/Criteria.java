package com.example.board.domain;

public class Criteria {
	private int page;
	private int perPageNum;
	
	/* perPageNum : 외부에서 파라미터로 읽어 와야 함 (추후 고려) */
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
	    if (page <= 0) {
	      this.page = 1;
	      return;
	    }

	    this.page = page;
	  }

	  public void setPerPageNum(int perPageNum) {
	    if (perPageNum <= 0 || perPageNum > 100) {
	      this.perPageNum = 10;
	      return;
	    }

	    this.perPageNum = perPageNum;
	  }

	  public int getPage() {
	    return page;
	  }

	  // method for MyBatis SQL Mapper : where board_id between pageStart and pageEnd
	  public int getPageStart() {
	    return (this.page - 1) * perPageNum + 1;
	  }
	  
	  // method for MyBatis SQL Mapper
	  public int getPageEnd() {
		  return this.page * perPageNum;
	  }

	  // method for MyBatis SQL Mapper
	  public int getPerPageNum() {
	    return this.perPageNum;
	  }

	  @Override
	  public String toString() {
	    return "Criteria [page=" + page + ", "
	        + "perPageNum=" + perPageNum + "]";
	  }
}