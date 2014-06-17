package qms.controllers;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import qms.dao.Type_of_NC_DAO;
import qms.forms.Non_Conformance_SourceForm;
import qms.forms.Type_of_NC_Form;
import qms.model.Non_Conformance_Source;
import qms.model.Type_of_NC;

@Controller
@SessionAttributes({"typenc"})
public class Type_of_NC_Controller {

	@Autowired
	Type_of_NC_DAO typeNCDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
@RequestMapping(value = { "/addtypenc" }, method = RequestMethod.GET)
	
	public String addTypeNC(HttpSession session,ModelMap model, Principal principal) {
		//session.removeAttribute("formlocation");
		model.addAttribute("menu","admin");
		return "add_typenc";
	}
//Insert a record
@RequestMapping(value = "/addtypenc", method = RequestMethod.POST)
public String postType(HttpSession session,@ModelAttribute("Type_of_NC") @Valid Type_of_NC type_of_NC,BindingResult result, ModelMap model) {

	session.setAttribute("type_of_NC",type_of_NC);
		if (result.hasErrors())
		{
			Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
			type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
			model.addAttribute("type_of_NC_Form",type_of_NC_Form);
			model.addAttribute("Success","true");
	        return "add_typenc";
		}
		typeNCDAO.insert_Type(type_of_NC);
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getlimitedtype(1));
		model.addAttribute("noofpages",(int) Math.ceil(typeNCDAO.getnooftypereport() * 1.0/5));
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
		model.addAttribute("menu","admin");
		model.addAttribute("success","true");
	return "typeNC_list";
}
@RequestMapping(value="/typeNC_list", method=RequestMethod.GET)
public String Typelist(HttpServletRequest request,ModelMap model, Principal principal) {
	
	
	model.addAttribute("menu","admin");
	Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
	type_of_NC_Form.setType_of_NCs(typeNCDAO.getlimitedtype(1));
	model.addAttribute("noofpages",(int) Math.ceil(typeNCDAO.getnooftypereport() * 1.0/5));
	model.addAttribute("menu","admin");
  	model.addAttribute("noofrows",5);
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("type_of_NC_Form",type_of_NC_Form);
	
	return "typeNC_list";
}
@RequestMapping(value="/viewtypereport_page", method=RequestMethod.GET)
public String viewprocessreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
	type_of_NC_Form.setType_of_NCs(typeNCDAO.getlimitedtype(1));
	model.addAttribute("noofpages",(int) Math.ceil(typeNCDAO.getnooftypereport() * 1.0/5));
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
 	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
	model.addAttribute("type_of_NC_Form",type_of_NC_Form);
    model.addAttribute("menu","admin");
    model.addAttribute("button","viewall");
    return "typeNC_list";
	
}
@RequestMapping(value={"/viewalltypereport"}, method = RequestMethod.GET)
public String viewallprocessreport(HttpServletRequest request,ModelMap model, Principal principal ) {
	Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
	type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
  	model.addAttribute("noofrows",5);    
    model.addAttribute("menu","admin");
    model.addAttribute("button","close");
    model.addAttribute("success","false");
    return "typeNC_list";

}
//Edit a record
@RequestMapping(value = "/edit_typenc", method = RequestMethod.GET)
public String EditType_get(@RequestParam("auto_id") String auto_id,Type_of_NC types,ModelMap model) {

	Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
	type_of_NC_Form.setType_of_NCs(typeNCDAO.types(auto_id));
	model.addAttribute("type_of_NC_Form",type_of_NC_Form);
	model.addAttribute("menu","admin");
    return "edit_type_nc";
}
//Update a record
@RequestMapping(value = "/update_type", method = RequestMethod.POST)
public String Update_type(ModelMap model,@ModelAttribute("Type_of_NC") @Valid Type_of_NC types,BindingResult result) throws IOException {
	String autoid = Integer.toString(types.getAuto_id());
	if (result.hasErrors())
	{
		
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.types(autoid));
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
        return "edit_sourcenc";
	}
	typeNCDAO.update_Type(types);
	Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
	type_of_NC_Form.setType_of_NCs(typeNCDAO.getlimitedtype(1));
	model.addAttribute("noofpages",(int) Math.ceil(typeNCDAO.getnooftypereport() * 1.0/5));
     model.addAttribute("currentpage",1);
 	model.addAttribute("noofrows",5);   
	model.addAttribute("type_of_NC_Form",type_of_NC_Form);
    model.addAttribute("menu","admin");
    model.addAttribute("button","viewall");
	model.addAttribute("success","update");
    return "typeNC_list";
}
@RequestMapping(value={"/delete_type"}, method = RequestMethod.GET)
public String delete_type(@RequestParam("auto_id") String auto_id,ModelMap model, Principal principal )
{

	
	typeNCDAO.delete_type(auto_id);
	Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
	type_of_NC_Form.setType_of_NCs(typeNCDAO.getlimitedtype(1));
	model.addAttribute("noofpages",(int) Math.ceil(typeNCDAO.getnooftypereport() * 1.0/5));
	model.addAttribute("button","viewall");
    model.addAttribute("success","delete");
    model.addAttribute("currentpage",1);
	model.addAttribute("type_of_NC_Form",type_of_NC_Form);
	model.addAttribute("menu","admin");
	return "typeNC_list";
	}
}
