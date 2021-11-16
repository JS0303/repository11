package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;


@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	/// Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	

	public PurchaseController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	
	//@RequestMapping("/addPurchase.do")
	@RequestMapping( value="addPurchase", method=RequestMethod.GET)
	public String addPurchase(@RequestParam("prod_no") int prodNo, Model model) throws Exception {

		
		System.out.println("/purchase/addPurchase : GET");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	//@RequestMapping("/addPurchase.do")
	@RequestMapping( value="addPurchase", method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase, @ModelAttribute("product") Product product, HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		
		System.out.println("/purchase/addPurchase : POST");

		model.addAttribute("purchase", purchase);

		purchaseService.addPurchase(purchase);

		return "forward:/purchase/addPurchase.jsp";
	}

	//@RequestMapping("/getPurchase.do")
	@RequestMapping( value="getPurchase", method=RequestMethod.GET)
	public String getPurchase(@RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("/purchase/getPurchase : GET");
		
//		/////////////////////// Cookie part ///////////////////////////////
//		String history = "";
//
//		Cookie[] cookies = request.getCookies();
//
//		if (cookies != null) {
//			for (int i = 0; i < cookies.length; i++) {
//				Cookie h = cookies[i];
//
//				if (h.getName().equals("history")) {
//
//					history = h.getValue();
//					System.out.println(history);
//				}
//			}
//		}
//		history += request.getParameter("prodNo") + ",";
//
//		Cookie cookie = new Cookie("history", history);
//		
//		//System.out.println(cookie.getValue());
//
//		cookie.setPath("/");
//
//		response.addCookie(cookie);
//		
//		/////////////////////// Cookie part ////////////////////////////
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(prodNo);

		model.addAttribute("purchase", purchase);

		request.setAttribute("purchase", purchase);

		//System.out.println(":: getPurchase Method에서 불러온 menu :: " + request.getParameter("menu"));

		if (request.getParameter("roll") != null && request.getParameter("roll").equals("user")) {
			return "forward:/purchase/getPurchase.jsp";
//		}

//		if (request.getParameter("menu").equals("search")) {
//			return "forward:/purchase/getPurchase.jsp";
//
		} else {
			return "forward:/purchase/updatePurchase.jsp";
		}
//
//		// return "forward:/purchase/getPurchase.jsp";
	}

	//@RequestMapping("/updatePurchaseView.do")
	@RequestMapping( value="updatePurchase", method=RequestMethod.GET)
	public String updatePurchase(@RequestParam("prodNo") int prodNo, Model model) throws Exception {

		System.out.println("/purchase/updatePurchase : GET");

		Purchase purchase = purchaseService.getPurchase(prodNo);

		model.addAttribute("purchase", purchase);

		return "forward:/purchase/updatePurchase.jsp";
	}

	//@RequestMapping("/updatePurchase.do")
	@RequestMapping( value="updatePurchase", method=RequestMethod.POST)
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase, Model model)
			throws Exception {

		System.out.println("/purchase/updatePurchase : POST");

		purchaseService.updatePurchase(purchase);

		model.addAttribute("purchase", purchase);
		

		return "redirect:/purchase/getPurchase?prodNo=" + purchase.getPurchaseProd();
	}

	//@RequestMapping("/listPurchase.do")
	@RequestMapping( value="listPurchase")
	public String listPurchase(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/purchase/listPurchase : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = purchaseService.getPurchaseList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/purchase/listPurchase.jsp";
	}

}
