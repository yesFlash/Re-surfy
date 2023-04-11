package org.zerock.service;

import java.util.List;

import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;


public interface CartService {
	public void register(List<CartVO> cart);

	public boolean modify(CartVO cart);

	public boolean remove(Long cno);

	public List<CartVO> getList();
}
