package com.nbp.wishlist.model.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
public class WishList {
	private int wishListNo;
	private int productNo;
	private String memberId;
	private String productName;
	private String productPrice;
	//등록날짜 넣으려면 나중에 추가하기 
}
