package service;

import java.util.List;
import java.util.Map;

import dao.ProductDao;
import vo.ProductVo;

public class ProductServiceImpl implements ProductService {

	// 입고,출고,재고에 관련된 Interface
	ProductDao product_in_dao; 		// 입고
	ProductDao product_out_dao; 	// 출고
	ProductDao product_remain_dao; 	// 재고

	// Contructor Injection (순서 중요하다)
	public ProductServiceImpl(ProductDao product_in_dao, ProductDao product_out_dao, ProductDao product_remain_dao) {
		super();
		this.product_in_dao = product_in_dao;
		this.product_out_dao = product_out_dao;
		this.product_remain_dao = product_remain_dao;
	}

	@Override
	public Map<String, List<ProductVo>> selectTotalMap() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert_in(ProductVo vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert_out(ProductVo vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
