package com.example.hanju.details.controller;

import com.example.hanju.details.service.DetailsService;
import com.example.hanju.test.service.TestService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class DetailsController {

	@Autowired
	DetailsService detailsService;

	@RequestMapping("details/details.do")
	public String testPage(Model model) throws Exception{
		return "details/details";
	}


	@RequestMapping(value = "details/details.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchDetails(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> result = detailsService.searchDetails(map);
		result.put("img", detailsService.searchItemImage(map)) ;
		System.out.println("controller");
		return new Gson().toJson(result);
	}

}