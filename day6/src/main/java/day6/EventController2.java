package day6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class EventController2 {

    @Autowired
    event2 eventService;

    @RequestMapping(value = "/area")
    public String openApi(@RequestParam(value = "year", defaultValue = "") String year,
                          @RequestParam(value = "month", defaultValue = "") String month,
                          @RequestParam(value = "area", defaultValue = "") String area,
                          Model model, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();

        Calendar cal = Calendar.getInstance();
        if (year.isEmpty()) {
            year = String.valueOf(cal.get(Calendar.YEAR));
        }
        
        if (month.equals("") || month.isEmpty()) {
            // 이전에 선택한 월 값 가져오기
            month = (String) session.getAttribute("selectedMonth");
            if (month == null) {
                // 이전에 선택한 월 값이 없는 경우 기본값으로 설정
                month = String.format("%02d", cal.get(Calendar.MONTH) + 1);
            }
        } else {
            // 새로운 월 값 선택한 경우 세션에 저장
            session.setAttribute("selectedMonth", month);
        }
        
        if (area.equals("") || area.isEmpty()) {
            // 이전에 선택한 지역 코드 가져오기
            area = (String) session.getAttribute("selectedArea");
            if (area == null) {
                // 이전에 선택한 지역 코드가 없는 경우 기본값으로 설정
                area = "1"; // 서울을 기본값으로 설정
            }
        } else {
            // 새로운 지역 코드 선택한 경우 세션에 저장
            session.setAttribute("selectedArea", area);
        }

        String result = eventService.getDataForMonth(year, month, area);
        ArrayList<EventDto2> eventlist = eventService.extractEvents(result, month);
        model.addAttribute("list", eventlist);
        model.addAttribute("selectedYear", year);
        model.addAttribute("selectedMonth", month);
        model.addAttribute("selectedArea", area);
        return "area";
    }
}