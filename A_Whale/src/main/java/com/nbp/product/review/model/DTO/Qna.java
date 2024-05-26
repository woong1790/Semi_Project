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
public class Qna {
	private String qnaId;
	private String memberId;
	private int qnaAnswerNumber;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaEnrollDate;
	private Date updateDate;
	private Date deleteDate;
	private int qnaDeleteYn;
	private int qnaSecretYn;
	private String productName;
}
