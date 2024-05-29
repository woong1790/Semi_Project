package com.nbp.shoppingbasket.model.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@ToString
public class ShoppingBasketDto {
	private int cartNo;
	private String memberId;
	private int productId;
	private int cartTotalPrice;
	private int cartVolume;
	private String categoryName;
	private int productprice;
	private String pImgUrl;
	private String productBrand;
	private String productName;
}
