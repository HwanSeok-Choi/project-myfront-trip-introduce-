package tourprj;

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
            // �씠�쟾�뿉 �꽑�깮�븳 �썡 媛� 媛��졇�삤湲�
            month = (String) session.getAttribute("selectedMonth");
            if (month == null) {
                // �씠�쟾�뿉 �꽑�깮�븳 �썡 媛믪씠 �뾾�뒗 寃쎌슦 湲곕낯媛믪쑝濡� �꽕�젙
                month = String.format("%02d", cal.get(Calendar.MONTH) + 1);
            }
        } else {
            // �깉濡쒖슫 �썡 媛� �꽑�깮�븳 寃쎌슦 �꽭�뀡�뿉 ���옣
            session.setAttribute("selectedMonth", month);
        }
        
        if (area.equals("") || area.isEmpty()) {
            // �씠�쟾�뿉 �꽑�깮�븳 吏��뿭 肄붾뱶 媛��졇�삤湲�
            area = (String) session.getAttribute("selectedArea");
            if (area == null) {
                // �씠�쟾�뿉 �꽑�깮�븳 吏��뿭 肄붾뱶媛� �뾾�뒗 寃쎌슦 湲곕낯媛믪쑝濡� �꽕�젙
                area = "1"; // �꽌�슱�쓣 湲곕낯媛믪쑝濡� �꽕�젙
            }
        } else {
            // �깉濡쒖슫 吏��뿭 肄붾뱶 �꽑�깮�븳 寃쎌슦 �꽭�뀡�뿉 ���옣
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