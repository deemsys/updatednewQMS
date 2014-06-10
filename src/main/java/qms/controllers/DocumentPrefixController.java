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

import qms.dao.DocumentPrefixDAO;
import qms.dao.FormprefixDAO;
import qms.forms.FormFormPrefix;
import qms.forms.MaintenanceForm;
import qms.model.FormPrefix;
import qms.model.DocumentPrefix;
import qms.forms.DocumentPrefixForm;


@Controller
@SessionAttributes({"documentprefix"})
public class DocumentPrefixController {
	
	@Autowired
	DocumentPrefixDAO documentPrefixDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
@RequestMapping(value = {"/add_prefixdocument"}, method = RequestMethod.GET)
	
	public String addDocumentPrefix(HttpSession session,ModelMap model, Principal principal) {
		session.removeAttribute("documentprefix");
		model.addAttribute("menu","admin");
		return "add_prefixdocument";
	}

//Insert a record
@RequestMapping(value = "/add_documentprefix", method = RequestMethod.POST)
public String postPrefix(HttpSession session,@ModelAttribute("DocumentPrefix") @Valid DocumentPrefix documentPrefix,BindingResult result, ModelMap model) {

	session.setAttribute("documentPrefix",documentPrefix);
		if (result.hasErrors())
		{
			DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
			documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getprefix());
			model.addAttribute("documentPrefixForm",documentPrefixForm);
			//model.addAttribute("Success","insert");
	        return "add_prefixdocument";
		}
	
		documentPrefixDAO.insert_PrefixDocument(documentPrefix);
		DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
		documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getprefix());
		model.addAttribute("documentPrefixForm",documentPrefixForm);
		model.addAttribute("menu","admin");
		model.addAttribute("success","insert");
	return "documentprefix_list";
}
	
@RequestMapping(value="/documentprefix_list", method=RequestMethod.GET)
public String documentprefixlist(HttpServletRequest request,ModelMap model, Principal principal) {
	DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
	model.addAttribute("menu","admin");
  	model.addAttribute("noofrows",5);
	
	
  	documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getlimitedprefixreport(1));
	model.addAttribute("noofpages",(int) Math.ceil(documentPrefixDAO.getnoofprefixreport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("documentPrefixForm",documentPrefixForm);
	
	return "documentprefix_list";
}

@RequestMapping(value="/viewdocumentprefixreport_page", method=RequestMethod.GET)
public String viewdocumentprefixreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
	documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getlimitedprefixreport(page));
	model.addAttribute("documentPrefixForm",documentPrefixForm);
	model.addAttribute("noofpages",(int) Math.ceil(documentPrefixDAO.getnoofprefixreport() * 1.0 / 5));
	model.addAttribute("documentPrefixForm",documentPrefixForm);	
  	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
    model.addAttribute("menu","documentprefix");
    model.addAttribute("button","viewall");
    
    return "documentprefix_list";
	
}


@RequestMapping(value={"/viewalldocumentprefixreport"}, method = RequestMethod.GET)
public String viewalldocumentprefixreport(HttpServletRequest request,ModelMap model, Principal principal ) {
	DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
	documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getprefix());
	model.addAttribute("documentPrefixForm",documentPrefixForm);

  	model.addAttribute("noofrows",5);    
    model.addAttribute("menu","documentprefix");
    model.addAttribute("button","close");
      
    	model.addAttribute("menu","admin");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
        return "documentprefix_list";

}
//Edit a record
@RequestMapping(value = "/edit_documentprefix", method = RequestMethod.GET)
public String editdocumentprefix_get(@RequestParam("id") String id,FormPrefix formPrefix,ModelMap model) {

	DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
	documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getdocumentPrefixs(id));
	model.addAttribute("documentPrefixForm",documentPrefixForm);
	model.addAttribute("menu","admin");
    return "edit_documentprefix";
}


//Update a record
@RequestMapping(value = "/update_documentprefix", method = RequestMethod.POST)
public String update_documentprefix(ModelMap model,@ModelAttribute("DocumentPrefix") @Valid DocumentPrefix documentPrefix,BindingResult result) throws IOException {

	if (result.hasErrors())
	{
		
		DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
		documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getdocumentPrefixs(documentPrefix.getId()));
		model.addAttribute("documentPrefixForm",documentPrefixForm);
        return "edit_documentprefix";
	}
	
	
	documentPrefixDAO.update_documentprefix(documentPrefix);
	DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
	documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getprefix());
	model.addAttribute("documentPrefixForm",documentPrefixForm);
	model.addAttribute("menu","admin");
	model.addAttribute("success","update");
    return "documentprefix_list";
}

//delete a record
@RequestMapping(value = "/delete_documentprefix", method = RequestMethod.GET)
public String deletedocumentprefix(@RequestParam("id") String id,DocumentPrefix documentPrefix,ModelMap model) {

	
	documentPrefixDAO.delete_documentprefix(id);
	DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
	documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getprefix());
	model.addAttribute("documentPrefixForm",documentPrefixForm);
	model.addAttribute("menu","admin");
    return "documentprefix_list";
	
}


}
