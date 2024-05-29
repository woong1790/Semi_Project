package com.nbp.product.model.DTO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {

	private int productNo;
	private String productName;
	private String productSubname;
	private String productDetail;
	private int productPrice;
	private int productStock;
	private int productAlcoholLv;
	private String productOrigin;
	private int productVolume;
	private int productAge;
	private String productBrand;
	private Date productEnrollDate;
	private int productDeleteYn;
	private String memberId;
	private String productImg; 
	private String categoryName;
}
