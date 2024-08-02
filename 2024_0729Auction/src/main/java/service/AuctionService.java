package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import dao.AuctionDao;
import dao.ItemsDao;
import dao.MemberDao;
import vo.ItemsVo;

@Service
public class AuctionService {

	@Autowired
	private ItemsDao items_dao; // 경매 관련 데이터 접근 객체
	
	@Autowired
	private MemberDao member_dao;
	
	@Autowired
	private AuctionDao auction_dao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	
	@Scheduled(fixedRate = 20000) // 5초마다 이 스케츌 Method를 실행시킨다
	public void checkAuctionStatus() {
		// 경매 종료를 확인하는 로직
		// auction_list_view를 가져와서 a_sledding (진행 여부)를 확인할 수 있다.
		List<ItemsVo> items = items_dao.findActiveAuction();
		
		// 진행 여부를 판가름 하기위해서 boolean Method를 가져와서 참거짓을 밝힌다.
		for(ItemsVo item : items) {
			
			// 만약에 현재 시간이 경매 마감시간을 넘어간다면,
			if(isAuctionEnded(item)) {
				
				int a_idx = item.getA_idx();
				
				// 필요한 추가 작업 (예: 알림발송, 정산작업 등등) -- 추가질문요소
				// 경매 정산을 여기서 진행하면 되겠다.
				
				
				
				
				// 만약 구매자가 아무도 없다면 처리하는 로직
				if(item.getGumae_mem_name() == null) {
					// 구매 member가 없으면 그냥 종료 시켜주고 끝
					// 구매자가 없으면, 아무런 일도 일어나지 않기 때문에 거래 완료만 시켜주면 된다.
					// 경매 마감시간이 넘어간 요소의 진행 여부를 종료 시켜준다.
					int res = items_dao.update_auction_service_end(a_idx);
				// 구매자가 있다면 구매 정산 처리
				} else if(item.getGumae_mem_name() != null) {
					
					// 경매 마감시간이 넘어간 요소의 진행 여부를 종료 시켜준다.
					int res = items_dao.update_auction_service_end(a_idx);
					
					// 해당 판매글에 대한 구매자 확정시키기(구매확정 알람 보내기)
					
					
					// 판매자한테 낙찰금액 입금
					int a_initial_price = item.getA_initial_price(); // 입금액
					int mem_idx = item.getMem_idx(); 
					
					/*
					Map<String, Object> map4 = new HashMap<String, Object>();
					map4.put("a_initial_price", a_initial_price);
					map4.put("a_idx", a_idx);
					
					// 구매 완료시 member_point 가격 그대로 올려주기
					int res4 = auction_dao.update_point_plus_auction_final(map4);
					 */
					
					Map<String, Object> map5 = new HashMap<String, Object>();
					map5.put("mem_idx", mem_idx);
					map5.put("a_initial_price", a_initial_price);
					
					// memberdao에 +해준 가격 적용해주기
					int res5 = member_dao.update_point_plus_final(map5);
					
					
				}
				
				
			}
		}
	}
	
	
	// 경매 종료 여부를 판단하는 로직
	private boolean isAuctionEnded(ItemsVo item) {
		
		String a_sledding = item.getA_sledding();
		
		// 만약에 a_sledding이 n일 경우에는 그냥 false를 보내준다.
		if("n".equals(a_sledding)) {
			
			return false;
		} else {
			
			// 경매 종료 시간을 String에서 Date Type으로 변환 시키기
			String endTimeString = item.getA_endtime();
			
		    // endTimeString이 null인지 확인
		    if (endTimeString == null) {
		        // 로그를 남기거나 예외 처리
		        System.err.println("End time is null for item: " + item.getA_idx());
		        return false; // 또는 true로 설정하여 종료된 것으로 간주할 수 있습니다.
		    }
			
			// 날짜 형식을 yyyy-MM-dd HH:mm:ss으로 출력한다.
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			
			try {
				Date endTime = dateFormat.parse(endTimeString);
				// Date Type으로 바꾼 현재 시간(new Date)를 비교한 참거짓값을 반환한다.
				return endTime.before(new Date());
			} catch (Exception e) {
				e.printStackTrace();
				return false;
				// TODO: handle exception
			}
		}
	}
	
	
	
}
