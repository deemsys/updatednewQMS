package qms.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import qms.dao.ProductId_NCDAO;
import qms.forms.ProductId_NC_Form;
import qms.forms.Type_of_NC_Form;
import qms.model.ProductIDNC;
import qms.model.Type_of_NC;

@Controller
@SessionAttributes({"productidnc"})
public class ProductId_NCController {
	@Autowired
	ProductId_NCDAO productId_NCDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
@RequestMapping(value = { "/addproductidnc" }, method = RequestMethod.GET)
	
	public String addTypeNC(HttpSession session,ModelMap model, Principal principal) {
		//session.removeAttribute("formlocation");
		model.addAttribute("menu","admin");
		return "add_productidnc";
	}
//Insert a record
@RequestMapping(value = "/addproductidnc", method = RequestMethod.POST)
public String postType(HttpSession session,@ModelAttribute("ProductIDNC") @Valid ProductIDNC productIDNC,BindingResult result, ModelMap model) {

	session.setAttribute("productIDNC",productIDNC);
		if (result.hasErrors())
		{
		
			ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
			productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
			model.addAttribute("productId_NC_Form",productId_NC_Form);
			model.addAttribute("Success","true");
	        return "add_productidnc";
		}
		productId_NCDAO.insert_Type(productIDNC);
		ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
		productId_NC_Form.setProductIDNCs(productId_NCDAO.getlimitedproductid(1));
		model.addAttribute("nooofpages",(int) Math.ceil(productId_NCDAO.getnoofproductidreport() * 1.0/5));
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
		model.addAttribute("productId_NC_Form",productId_NC_Form);
		model.addAttribute("menu","admin");
		model.addAttribute("success","true");
	return "productidNC_list";
}
@RequestMapping(value="/productidNC_list", method=RequestMethod.GET)
public String Typelist(HttpServletRequest request,ModelMap model, Principal principal) {
	
	
	model.addAttribute("menu","admin");
	ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
	productId_NC_Form.setProductIDNCs(productId_NCDAO.getlimitedproductid(1));
	model.addAttribute("nooofpages",(int) Math.ceil(productId_NCDAO.getnoofproductidreport() * 1.0/5));
	model.addAttribute("menu","admin");
  	model.addAttribute("noofrows",5);
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("productId_NC_Form",productId_NC_Form);
	
	return "productidNC_list";
}
}
