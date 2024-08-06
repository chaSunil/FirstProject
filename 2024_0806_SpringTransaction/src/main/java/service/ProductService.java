package service;

import java.util.List;
import java.util.Map;

import vo.ProductVo;

public interface ProductService {
	
	
	// 입고, 출고, 재고 목록 가져오는데 사용할 것이다.
	// ArrayList가 3개이기에 List가 값으로 담기는 것이다.
	Map<String, List<ProductVo>> selectTotalMap(); // 전체조회
	
	// 입고처리
	int insert_in(ProductVo vo) throws Exception;
	
	// 출고처리
	int insert_out(ProductVo vo) throws Exception;
	
	

}
