package com.hj.home.DTO;

import lombok.Data;

@Data
public class PaginationDTO {
	private int limit;
    private int listCount;
    private int maxPage;
    private int startPage;
    private int endPage;
}
