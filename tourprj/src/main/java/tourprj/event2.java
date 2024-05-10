package tourprj;

import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;

import org.json.JSONArray;
import org.json.JSONObject;

@Component
public class event2 {

    public String getDataForMonth(String year, String month, String area) throws IOException {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, Integer.parseInt(year));
        cal.set(Calendar.MONTH, Integer.parseInt(month) - 1);
        int lastDayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551011/KorService1/searchFestival1");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=8Y1lUgVaQUxTkl%2BZ9d9MIR8S6HXYTseLCTOPhC8BvvtBN47Izx%2B4oaaS1o6TsXPkjv1ktUfEjhExH3JSmP7nJg%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("arrange", "UTF-8") + "=" + URLEncoder.encode("R", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("eventStartDate", "UTF-8") + "=" + URLEncoder.encode(year + month + "01", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("eventEndDate", "UTF-8") + "=" + URLEncoder.encode(year + month + lastDayOfMonth, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(area, "UTF-8"));
      
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        return sb.toString();
    }
	
    public ArrayList<EventDto2> extractEvents(String jsonData, String selectedMonth) {
        JSONArray arr = new JSONObject(jsonData).getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
        ArrayList<EventDto2> list = new ArrayList<>();
        for (int i = 0; i < arr.length(); i++) {
            JSONObject item = arr.getJSONObject(i);
            String eventEndDate = item.getString("eventenddate");
            String eventMonth = eventEndDate.substring(4, 6);
            if (eventMonth.equals(selectedMonth)) {
                Object title = item.get("title");
                Object firstimage = item.get("firstimage");
                Object addr1 = item.get("addr1");
                Object addr2 = item.get("addr2");
                Object eventstartdate = item.get("eventstartdate");
                EventDto2 event = new EventDto2(title, firstimage, addr1, addr2, eventstartdate, eventEndDate);
                list.add(event);
            }
        }
        return list;
    }
}
