package com.nbp.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.nbp.product.model.service.ProductCartService;

/**
 * Servlet implementation class ProductCartServlet
 */
@WebServlet("/product/productcart.do")
public class ProductCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode = objectMapper.readTree(request.getReader());
		Gson gson=new Gson();
		
		String memberId = jsonNode.get("memberId").asText();
		String productId = jsonNode.get("productId").asText();
		String cartVolume = jsonNode.get("cartVolume").asText();
		
		JsonNode name = jsonNode.get("optionName");
		// optionName을 Java 객체로 변환 후 Gson으로 직렬화
		JsonElement optionNameElement = JsonParser.parseString(jsonNode.get("optionName").toString());
		String optionName = gson.toJson(optionNameElement);
		
		JsonNode price = jsonNode.get("optionPrice");
        // optionPrice를 Java 객체로 변환 후 Gson으로 직렬화
        JsonElement optionPriceElement = JsonParser.parseString(jsonNode.get("optionPrice").toString());
        String optionPrice = gson.toJson(optionPriceElement);
		
		int result = new ProductCartService().insertCart(memberId, productId, cartVolume, optionName, optionPrice);
		
		
	
//		System.out.println(memberId);
//		System.out.println(Integer.parseInt(productId));
//		System.out.println(Integer.parseInt(cartVolume));
//		System.out.println(optionName);
//		System.out.println(optionPrice);
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
