package com.nbp.wishlist.model.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@Getter
public class WishlistDto {
	private String wishListId;
	private int productId;
	private String memberId;
	private String productBrand;
	private String pImgUrl;
	private String productName;
	private int productprice;
}
