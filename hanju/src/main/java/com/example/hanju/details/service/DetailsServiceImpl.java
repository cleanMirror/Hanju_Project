package com.example.hanju.details.service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.details.mapper.DetailsMapper;
import com.example.hanju.details.model.Details;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DetailsServiceImpl implements DetailsService {
	
	@Autowired
	DetailsMapper detailsMapper;

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> searchDetails(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println("service");
			List<Details> details = detailsMapper.selectDetail(map);
			resultMap.put("info", details);
			resultMap.put("result", "success");
			resultMap.put("message", "조회되었음");

		return resultMap;
	}

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> searchItemImage(Map<String, Object> map) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("searchItem", detailsMapper.selectProduct(map));
		map.put("status", "D");
		result.put("detailImage", detailsMapper.detailImage(map));
		map.put("status", "P");
		result.put("productImage", detailsMapper.detailImage(map));
		return result;
	}
}