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

import qms.dao.DocumentTypeDAO;
import qms.forms.DocumentPrefixForm;
import qms.forms.DocumentTypeForm;
import qms.model.DocumentType;

@Controller
@SessionAttributes({"documenttype"})
public class DocumentTypeController {
	
	
	@Autowired
	DocumentTypeDAO documentTypeDAO ;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
@RequestMapping(value = { "/add_documenttype" }, method = RequestMethod.GET)
	
	public String addFormPrefix(HttpSession session,ModelMap model, Principal principal) {
		session.removeAttribute("documenttype");
		model.addAttribute("menu","admin");
		return "add_documenttype";
	}

//Insert a record
@RequestMapping(value = "/add_documenttype", method = RequestMethod.POST)
public String postDocumenttype(HttpSession session,@ModelAttribute("DocumentType") @Valid DocumentType documentType,BindingResult result, ModelMap model) {

	session.setAttribute("documentType",documentType);
		if (result.hasErrors())
		{
			DocumentTypeForm documentTypeForm = new DocumentTypeForm();
			documentTypeForm.setDocumentTypes(documentTypeDAO.getdocumenttype());
			model.addAttribute("documentTypeForm",documentTypeForm);
			System.out.println("error");
			model.addAttribute("Success","true");
	        return "add_documenttype";
		}
	
		//formprefixDAO.insert_PrefixForm(formPrefix);
		documentTypeDAO.insert_DocumentType(documentType);
		DocumentTypeForm documentTypeForm = new DocumentTypeForm();
		documentTypeForm.setDocumentTypes(documentTypeDAO.getdocumenttype());
		model.addAttribute("documentTypeForm",documentTypeForm);
		model.addAttribute("menu","admin");
	return "documenttype_list";
}

//Edit a record
@RequestMapping(value = "/edit_documenttype", method = RequestMethod.GET)
public String editdocumenttype_get(@RequestParam("id") String id,DocumentType documentType,ModelMap model) {

	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	documentTypeForm.setDocumentTypes(documentTypeDAO.getDocumentTypes(id));
	model.addAttribute("documentTypeForm",documentTypeForm);
	model.addAttribute("menu","admin");
    return "edit_documenttype";
}


//Update a record
@RequestMapping(value = "/update_documenttype", method = RequestMethod.POST)
public String update_documenttype(ModelMap model,@ModelAttribute("DocumentType") @Valid DocumentType documentType,BindingResult result) throws IOException {

	if (result.hasErrors())
	{
		
		DocumentTypeForm documentTypeForm = new DocumentTypeForm();
		documentTypeForm.setDocumentTypes(documentTypeDAO.getDocumentTypes(documentType.getId()));
		System.out.println("error");
		model.addAttribute("documentTypeForm",documentTypeForm);
        return "edit_documenttype";
	}
	
	
	documentTypeDAO.update_documenttype(documentType);
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	documentTypeForm.setDocumentTypes(documentTypeDAO.getdocumenttype());
	model.addAttribute("documentTypeForm",documentTypeForm);
	model.addAttribute("menu","documenttype");
	System.out.println("updated successfully");
    return "documenttype_list";
}



//delete a record
@RequestMapping(value = "/delete_documenttype", method = RequestMethod.GET)
public String deletedocumenttype(@RequestParam("id") String id,DocumentType documentType,ModelMap model) {

	
	//formprefixDAO.delete_formprefix(id);
	documentTypeDAO.delete_documenttype(id);
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	documentTypeForm.setDocumentTypes(documentTypeDAO.getdocumenttype());
	model.addAttribute("documentTypeForm",documentTypeForm);
	model.addAttribute("menu","admin");
    return "documenttype_list";
	
}



@RequestMapping(value="/documenttype_list", method=RequestMethod.GET)
public String Documenttypelist(HttpServletRequest request,ModelMap model, Principal principal) {
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	model.addAttribute("menu","admin");
  	model.addAttribute("noofrows",5);
	
	documentTypeForm.setDocumentTypes(documentTypeDAO.getlimiteddocumenttypereport(1));
	model.addAttribute("noofpages",(int) Math.ceil(documentTypeDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("documentTypeForm",documentTypeForm);
	
	return "documenttype_list";
}
@RequestMapping(value="/viewdocumenttypereport_page", method=RequestMethod.GET)
public String viewdocumenttypereport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	documentTypeForm.setDocumentTypes(documentTypeDAO.getlimiteddocumenttypereport(page));
	model.addAttribute("noofpages",(int) Math.ceil(documentTypeDAO.getnoofdocumenttypereport() * 1.0 / 5));
	model.addAttribute("documentTypeForm",documentTypeForm);	
  	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
    model.addAttribute("menu","admin");
    model.addAttribute("button","viewall");
    
    return "documenttype_list";
	
}


@RequestMapping(value={"/viewalldocumenttypereport"}, method = RequestMethod.GET)
public String viewalldocumenttypereport(HttpServletRequest request,ModelMap model, Principal principal ) {
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	//formFormPrefix.setFormPrefixs(formprefixDAO.getprefix());
	documentTypeForm.setDocumentTypes(documentTypeDAO.getdocumenttype());
	model.addAttribute("documentTypeForm",documentTypeForm);

  	model.addAttribute("noofrows",5);    
   //narrativereportForm.getNarrativereport().size()
    model.addAttribute("menu","admin");
    model.addAttribute("button","close");
      
    	model.addAttribute("menu","admin");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
        return "documenttype_list";

}


}
