package com.nbp.order.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class PortOneAPI {
	private static final String IMP_KEY = "4774112821065528"; // 발급받은 REST API 키 (임의의 데이터)
    private static final String IMP_SECRET = "cyccaj6WGfdS8HMMdVccUfxFZR0YOsRtjB53sDUPYKOuqjdY9w8KHJ6ZItg1zNL11teBMzj1Q8aT5dQZ"; // 발급받은 REST API Secret (임의의 데이터)

    public String getAccessToken() {
    	try {
            URL url = new URL("https://api.iamport.kr/users/getToken");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            // 요청 바디 설정
            String params = "{\"imp_key\":\"" + IMP_KEY + "\",\"imp_secret\":\"" + IMP_SECRET + "\"}";
            OutputStream os = conn.getOutputStream();
            os.write(params.getBytes());
            os.flush();
            os.close();

            // 응답 코드 확인
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) { // 정상 응답
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                br.close();

                // JSON 응답 파싱
                JSONParser parser = new JSONParser();
                JSONObject jsonResponse = (JSONObject) parser.parse(response.toString());
                JSONObject responseObj = (JSONObject) jsonResponse.get("response");
                return (String) responseObj.get("access_token"); // 엑세스 토큰 반환
            } else { // 오류 응답
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                StringBuilder errorResponse = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    errorResponse.append(line);
                }
                br.close();
                System.out.println("Error response: " + errorResponse.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // 엑세스 토큰 발급 실패 시 null 반환
    }
}
