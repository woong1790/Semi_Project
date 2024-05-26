package com.nbp.product.review.model.DTO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Review {
	private int reviewNo;
	private String memberId;
	private int productNo;
	private Date reviewEnrollDate;
	private Date reviewUpdateDate;
	private Date reviewDeleteDate;
	private String reviewTitle;
	private String reviewContent;
	private int reviewRate;
	private int reviewDeleteYn;
	
	
	
}
