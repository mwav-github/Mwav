package net.admins.service;

import net.admins.dao.PromoterDAO;
import net.common.common.CommandMap;
import net.mwav.common.module.AesEncryption;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PromoterServiceImpl implements PromoterService{

    private final PromoterDAO pmtDAO;

    public PromoterServiceImpl(PromoterDAO pmtDAO) {
        this.pmtDAO = pmtDAO;
    }

    @Override
    public int selectPmtOneGetTotalCount(CommandMap commandMap) {
        return pmtDAO.selectPmtOneGetTotalCount(commandMap);
    }

    @Override
    public List<Map<String, Object>> selectListPmtList(Map<String, Object> map) {
        return pmtDAO.selectListPmtList(map);
    }

    @Transactional
    @Override
    public void insertPmtForm(CommandMap commandMap) throws Exception {
        // AES/CBC/IV 암호화 (키,암호화텍스트,iv)
        String b_stfLoginPw = (String) commandMap.get("pmtLoginPw");
        byte[] encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, b_stfLoginPw, AesEncryption.sInitVector);

        // 암호화된 값이 String으로 반환
        commandMap.put("pmtLoginPw", AesEncryption.aesEncodeBuf(encrypted));

        // Promoter_tbl
        pmtDAO.insertPromoter_tbl(commandMap);

        // PromoterValue_tbl
        pmtDAO.insertPromoterValue_tbl(commandMap);

        // PromoterValueLog_tbl
        commandMap.put("pvlRemark", "신규 회원가입");
        pmtDAO.insertPromoterValueLog_tbl(commandMap);

        // PromoterSpecialty_tbl, 전문분야를 체크 했을 때만 쿼리를 실행
        if(commandMap.get("pmtSpecialtyName") != null){
            pmtDAO.insertPromoterSpecialty_tbl(commandMap);
        }

        // PromoterLicense_tbl
        pmtDAO.insertPromoterLicense_tbl(commandMap);

        // PromoterChannel_tbl
        commandMap.put("pmtChannelMember", 0);
        commandMap.put("pmtChannelDaillyVisit", 0);
        pmtDAO.insertPromoterChannel_tbl(commandMap);

        // PromoterAccount_tbl
        pmtDAO.insertPromoterAccount_tbl(commandMap);
    }

    public boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception{
        return pmtDAO.selectOnePmtLoginIdCheck(stfLoginId) == 0 ? true : false;
    }

    @Override
    public Map<String, Object> selectPmtView(String promoter_id) {
        Map<String, Object> resultMap = pmtDAO.selectPmtView(promoter_id);
        // 프로모터 전문 분야는 N row가 나오기 때문에 별도로 조회
        resultMap.put("pmtSpecialtyNames", pmtDAO.selectPmtSpecialtyNames(promoter_id));
        return resultMap;
    }

    @Override
    public Map<String, Object> updatePmtForm(String promoter_id) {
        Map<String, Object> resultMap = pmtDAO.updatePmtForm(promoter_id);
        // 프로모터 전문 분야는 N row가 나오기 때문에 별도로 조회
        resultMap.put("pmtSpecialtyNames", pmtDAO.selectPmtSpecialtyNames(promoter_id));
        return resultMap;
    }

    @Transactional
    @Override
    public void updatePmt(CommandMap commandMap) {

        // Promoter_tbl
        pmtDAO.updatePromoter_tbl(commandMap);

        // PromoterValue_tbl 보류
//		pmtDAO.updatePromoterValue_tbl(commandMap);

        // PromoterValueLog_tbl
        commandMap.put("pvlRemark", "프로모터 회원 정보 수정");
        pmtDAO.insertPromoterValueLog_tbl(commandMap);

        // PromoterSpecialty_tbl, 체크했을때만 쿼리를 실행함
        pmtDAO.deletePromoterSpecialty_tbl((String) commandMap.get("promoter_id"));
        // 이 테이블의 경우 DELETE -> INSERT 방식으로 업데이트를 진행
        if(commandMap.get("pmtSpecialtyName") != null){
            pmtDAO.insertPromoterSpecialty_tbl(commandMap);
        }

        // PromoterLicense_tbl
        pmtDAO.updatePromoterLicense_tbl(commandMap);

        // PromoterChannel_tbl
        pmtDAO.updatePromoterChannel_tbl(commandMap);

        // PromoterAccount_tbl
        pmtDAO.updatePromoterAccount_tbl(commandMap);
    }

    @Transactional
    @Override
    public boolean updatePmtPassword(CommandMap commandMap) throws IOException {
        String pmtLoginPw = (String) commandMap.get("pmtLoginPw");
        String pmtLoginPw2 = (String) commandMap.get("pmtLoginPw2");

        // 신규 비밀번호와 재입력한 비밀번호가 일치한지 재확인
        boolean chkUpdate = pmtLoginPw.equals(pmtLoginPw2) ? true : false;

        if(chkUpdate){
            // AES/CBC/IV 암호화 (키,암호화텍스트,iv)
            byte[] encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, pmtLoginPw, AesEncryption.sInitVector);
            // 암호화된 값이 String으로 반환
            commandMap.put("pmtLoginPw", AesEncryption.aesEncodeBuf(encrypted));

            pmtDAO.updatePmtPassword(commandMap);
            chkUpdate = true;

            // PromoterValueLog_tbl, TODO : 예외처리 객체를 만들어서 로그처리 필요함
            commandMap.put("pvlRemark", "비밀번호 수정");
            pmtDAO.insertPromoterValueLog_tbl(commandMap);
        }

        return chkUpdate;
    }

    @Transactional
    @Override
    public void leavePmt(CommandMap commandMap) {

        // PromoterValue_tbl -> pmtLeaveDt -> NOW()
        pmtDAO.leavePmt(commandMap);

        // PromoterValueLog_tbl
        commandMap.put("pvlRemark", "관리자 -> 프로모터 탈퇴");
        pmtDAO.insertPromoterValueLog_tbl(commandMap);
    }

    @Override
    public Map<String, Object> selectStaffSeek(CommandMap commandMap) {
        int page = commandMap.get("page") != null ? Integer.parseInt(commandMap.get("page").toString()) : 0;
        // 10페이지 단위
        commandMap.put("page", page*10);

        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("stfList", pmtDAO.selectStaffSeek(commandMap));

        int maxCount = pmtDAO.selectStaffSeekMaxCount(commandMap);
        resultMap.put("maxCount", maxCount);
        resultMap.put("minCount", 0);

        int maxCountPage = (maxCount-1)/10;

        resultMap.put("maxCountPage", maxCountPage);

		/*
             최소 페이지(minPage)는
             전체 페이지 갯수(maxCountPage)의 -2 한 값보다 현재 페이지(page) 값이 크다면
             전체 페이지 기준으로 -4 한 값으로 최소 페이지를 준다.
             반대라면 현재 페이지에서 -2 한 값으로 준다.
         */
        int minPage = page > maxCountPage - 2 ? maxCountPage-4 : page-2;

        // 페이지의 최소값은 0보다 작을 수 없음
        minPage = minPage > 0 ? minPage : 0;
        resultMap.put("minPage", minPage);

        // 페이지의 최댓값은 maxCount 보다 클 수 없으며, 페이지가 0, 1, 2 라면 5로 고정
        int maxPage = page+2 > maxCountPage ? maxCountPage : page+2;
        if(maxPage < 4){
            if(maxCountPage < 4){
                maxPage = maxCountPage;
            }else{
                maxPage = 4;
            }
        }
        resultMap.put("maxPage", maxPage);

        return resultMap;
    }

    @Transactional
    @Override
    public void returnPmt(CommandMap commandMap) {
        // PromoterValue_tbl -> pmtLeaveDt -> Null
        pmtDAO.returnPmt(commandMap);

        // PromoterValueLog_tbl
        commandMap.put("pvlRemark", "관리자 -> 프로모터 복귀");
        pmtDAO.insertPromoterValueLog_tbl(commandMap);
    }
}
