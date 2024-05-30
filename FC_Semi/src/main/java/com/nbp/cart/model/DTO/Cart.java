package com.nbp.cart.model.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Cart {
	private int cartNo;
	private String memberId;
	private int productId;
	private int productPrice;
	private int cartVolume;
	private String optionName;
	private String optionPrice;
	private String productName;
	private String productImg;
}
