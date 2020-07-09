package net.admins.service;

import net.common.common.CommandMap;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

public class StaffServiceImplTest {

    @Test
    public void selectStaffSeek() {
        CommandMap commandMap = new CommandMap();
        commandMap.put("page", 15);

        int page = commandMap.get("page") != null ? Integer.parseInt(commandMap.get("page").toString()) : 0;
        // 10페이지 단위
        commandMap.put("page", page*10);

        Map<String, Object> resultMap = new HashMap<String, Object>();
        // resultMap.put("stfList", staffDAO.selectStaffSeek(commandMap));

        int maxCount = 138; // staffDAO.selectStaffSeekMaxCount(commandMap);
        resultMap.put("maxCount", maxCount);
        resultMap.put("minCount", 0);

        int maxCountPage = (maxCount-1)/10;

        resultMap.put("maxCountPage", maxCountPage);

        // 페이지의 최소값은 0보다 작을 수 없으며, 페이지가 maxCountPage, maxCountPage-1, maxCountPage-2 라면 maxCountPage 로 고정
        int minPage = 0 > page-2 ? 0 : page-2;
        if(minPage > maxCountPage-4 && maxCount != 0){
            minPage = maxCountPage-4 < 0 ? 0 : maxCountPage-4;
        }
        resultMap.put("minPage", minPage);

        // 페이지의 최댓값은 maxCount 보다 클 수 없으며, 페이지가 0, 1, 2 라면 4로 고정
        int maxPage = page+2 > maxCountPage ? maxCountPage : page+2;
        if(maxPage < 4){
            if(maxCountPage < 4){
                maxPage = maxCountPage;
            }else{
                maxPage = 4;
            }
        }
        resultMap.put("maxPage", maxPage);

        System.out.println("maxCountPage : " + resultMap.get("maxCountPage"));
        System.out.println("minCount : " + resultMap.get("minCount"));
        System.out.println("maxCount : " + resultMap.get("maxCount"));

        System.out.println("minPage : " + resultMap.get("minPage"));
        System.out.println("maxPage : " + resultMap.get("maxPage") + "\n");

        // 페이지 번호 출력 상황
        for(int i = minPage; i <= maxPage; i++){
            System.out.print(i+1 + " ");
        }
    }
}