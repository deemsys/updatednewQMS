package qms.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import qms.dao.DocumentControlDAO;
import qms.dao.DocumentPrefixDAO;
import qms.dao.DocumentTypeDAO;
import qms.dao.FileHandlingDAO;
import qms.dao.FormLocationDAO;
import qms.dao.RevisionDocumentDAO;
import qms.model.DocumentMain;
import qms.model.Form;
import qms.model.RevisionDocument;
import qms.model.RevisionForm;
import qms.dao.ProcessDAO;
import qms.forms.DocumentPrefixForm;
import qms.forms.DocumentTypeForm;
import qms.forms.EmployeeForm;
import qms.forms.FormForm;
import qms.forms.FormLocationForm;
import qms.forms.ProcessForm;
import qms.forms.RevisionDocumentForm;
import qms.forms.RevisionFormForm;
import qms.dao.EmployeeDAO;
import qms.forms.DocumentMainForm;
import qms.model.Employee;

@Controller
@SessionAttributes({ "temp_list","documentMain" })
public class DocumentController {
	@Autowired
	DocumentControlDAO documentControlDAO;

	@Autowired
	ProcessDAO processDAO;

	@Autowired
	EmployeeDAO employeeDAO;


	@Autowired
	FileHandlingDAO fileHandlingDAO;

	@Autowired
	DocumentPrefixDAO documentPrefixDAO;

	@Autowired
	DocumentTypeDAO documentTypeDAO;
	
	@Autowired
	RevisionDocumentDAO revisionDocumentDAO;
	
	@Autowired
	FormLocationDAO formLocationDAO;
		@RequestMapping(value = { "/documententry" }, method = RequestMethod.GET)
	public String add_document1(HttpSession session, ModelMap model,
			Principal principal) {

		session.removeAttribute("documentMain");
		load_document_page_dropdowns(model);
		  model.addAttribute("menu","document");
		return "documententry";
	}

		@RequestMapping(value ={ "/adddocument"}, method = RequestMethod.GET)
		public String adddocumt(HttpSession session ,ModelMap model, Principal principal) 
		{
		
	System.out.println("insideadd");
			session.removeAttribute("documentMain");
			load_document_page_dropdowns(model);
			DocumentMainForm documentMainForm=new DocumentMainForm();
			model.addAttribute("documentMainForm",documentMainForm);
			model.addAttribute("id", documentControlDAO.get_documentid());
			
			FormLocationForm formLocationForm = new FormLocationForm();
			formLocationForm.setFormLocations(formLocationDAO.getlocation());
			model.addAttribute("formLocationForm",formLocationForm);
			
			System.out.println("id"+documentControlDAO.get_documentid());
			  model.addAttribute("menu","document");
			return "add_documents";
		
	
		}

	
	/*@RequestMapping(value = { "/documententry" }, method = RequestMethod.POST)
	public String add_document2(HttpSession session, ModelMap model,
			Principal principal) {

		session.removeAttribute("documentMain");
	//	load_document_page_dropdowns(model);
		  model.addAttribute("menu","document");
		return "documententry";
	}
*/
	
	

	//delete a record
	@RequestMapping(value = { "/deletedocument" }, method = RequestMethod.GET)
	public String delete_document(@RequestParam("doc_id") String doc_id,ModelMap model,
			Principal principal) {

		documentControlDAO.delete_document(doc_id);
		DocumentMainForm documentMainForm = new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
		model.addAttribute("documentMainForm", documentMainForm);
		  model.addAttribute("menu","document");
		return "view_documents";
		
	}
	
	
	
	//delete a record
	@RequestMapping(value={"/documentdelete"}, method = RequestMethod.GET)
	public String delete_document(ModelMap model, Principal principal )
	{
		
		DocumentMainForm documentMainForm = new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
		model.addAttribute("documentMainForm",documentMainForm);

	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	      
	    model.addAttribute("menu","document");
	    model.addAttribute("success","false");
	    model.addAttribute("button","close");
	    return "documentdelete";
		
		
 	}
	
	@RequestMapping(value={"/deletedocument"}, method = RequestMethod.POST)
	public String deleteSelecteddocument(HttpServletRequest request,ModelMap model,Principal principal) 
	{	
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		
		//formDAO.deleteParticipant(id,principal.getName());
		documentControlDAO.delete_document(id);
		}
		DocumentMainForm documentMainForm = new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
		model.addAttribute("documentMainForm",documentMainForm);
        model.addAttribute("menu","admin");
		return "documentdelete";
		
	}	
	

	/*@RequestMapping(value = "/view_revision_history", method = RequestMethod.GET)
	public String revision_history(@RequestParam("document_id") String document_id,@RequestParam("auto_number")String auto_number,HttpSession session ,ModelMap model, Principal principal) 
	{
		  System.out.println("inside history");
		load_document_page_dropdowns(model);
		RevisionDocumentForm revisionDocumentForm = new RevisionDocumentForm();
		revisionDocumentForm.setRevisionDocuments(revisionDocumentDAO.getRevision(auto_number));
		model.addAttribute("revisionDocumentForm",revisionDocumentForm);
		System.out.println(revisionDocumentForm.getRevisionDocuments().get(0).getRevision_id());
		DocumentMainForm documentMainForm=new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocument_byid(auto_number));
		model.addAttribute("documentMainForm",documentMainForm);
		
		model.addAttribute("menu","document");
		
		return "view_documents";
	}
	*/
	@RequestMapping(value={"/review_history_document"}, method = RequestMethod.GET)
	public String review_history_document(HttpSession session,@RequestParam("auto_number") String auto_number,ModelMap model)
	{
    
		
		DocumentMainForm documentMainForm=new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
		model.addAttribute("documentMainForm",documentMainForm);

	  	model.addAttribute("noofrows",5);    
	  	model.addAttribute("menu","documentMain");
	    model.addAttribute("button","close");
	      
	   
	    model.addAttribute("success","false");
	    model.addAttribute("button","close");
	    model.addAttribute("display","show");
	    
		 String number = auto_number.trim();
		    System.out.println("auto_number= "+number);
			
		    RevisionDocumentForm revisionDocumentForm = new RevisionDocumentForm();
		    revisionDocumentForm.setRevisionDocuments(revisionDocumentDAO.getRevision(number));
			 model.addAttribute("revisionDocumentForm",revisionDocumentForm);
		return "view_documents";
 	}

	
	//edit a record
	@RequestMapping(value = "/edit_document", method = RequestMethod.GET)
	public String edit_document(@RequestParam("auto_number") String auto_number,HttpSession session, ModelMap model,Principal principal) {

		session.removeAttribute("documentMain");
		load_document_page_dropdowns(model);
		System.out.println("auto number=" +auto_number);
		RevisionDocumentForm revisionDocumentForm = new RevisionDocumentForm();
		revisionDocumentForm.setRevisionDocuments(revisionDocumentDAO.getRevision(auto_number));
		model.addAttribute("revisionDocumentForm",revisionDocumentForm);
		DocumentMainForm documentMainForm=new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocument_byid(auto_number));
		
		
		DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
		documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getprefix());
		model.addAttribute("documentPrefixForm",documentPrefixForm);
		
		FormLocationForm formLocationForm = new FormLocationForm();
		formLocationForm.setFormLocations(formLocationDAO.getlocation());
		model.addAttribute("formLocationForm",formLocationForm);
		
		
		
		
		model.addAttribute("documentMainForm",documentMainForm);
		
		  model.addAttribute("menu","document");
		//documentControlDAO.getDocument_byid(auto_number);
		
		return "edit_documents";
	}
	

	//updating a record
	@RequestMapping(value = { "/update_documents" }, method = RequestMethod.POST)
	public String update_document(HttpServletRequest request,@ModelAttribute("DocumentMain") @Valid DocumentMain documentMain1,@ModelAttribute("RevisionDocument")@Valid RevisionDocument revisionDocument,BindingResult result,HttpSession session, ModelMap model,Principal principal) {

		int flag = 0;
		
		request.getAttribute("revision_id");
		System.out.println("revision_id = "+request.getAttribute("revision_id"));
		System.out.println("auto number from model = "+documentMain1.getAuto_number());
		session.setAttribute("documentMain",documentMain1);
		//System.out.println("attachment name= "+documentMain.getAttachment_name());
		//System.out.println("attachments = "+documentMain.getAttachments()+request.getParameter("attachments"));
		/*if(result.hasErrors())
		{
			
			load_document_page_dropdowns(model);
			return "edit_documents";
		}
		else
		{*/
		
		
		if(documentMain1.getMedia_type().equals("1"))
		{
			documentMain1.setLocation("Nil");
		}
		else if(documentMain1.getMedia_type().equals("2")){
			documentMain1.setLocation(documentMain1.getLocation());
		}
		 
		byte[] buffer;
			try {
				
				MultipartFile file = documentMain1.getAttachments();
				String orginal_fileName = null;
				String duplicate_fileName = null;
				InputStream inputStream = null;
				OutputStream outputStream = null;
				if (file != null) {
					if (file.getSize() > 0) {
						inputStream = file.getInputStream();
						if (file.getSize() > 100000) {
							System.out.println("File Size:::" + file.getSize());
							return "/add_documents";
						}
						orginal_fileName = "C:/projects/"+ file.getOriginalFilename();
						duplicate_fileName = orginal_fileName;
						File create_file = new File(orginal_fileName);
						int i = 1;
						while (create_file.exists()) {
							duplicate_fileName = "C:/projects/"+ file.getOriginalFilename().substring(
											0,file.getOriginalFilename().lastIndexOf(
													'.'))+ i
													+ file.getOriginalFilename().substring(
											file.getOriginalFilename().lastIndexOf('.'));
							create_file = new File(duplicate_fileName);
							i++;
						}
						outputStream = new FileOutputStream(duplicate_fileName);
						System.out.println("fileName:" + file.getOriginalFilename());

						// ------Lines to changes------//

						documentMain1.setAttachment_type(file.getContentType());
						documentMain1.setAttachment_name(file.getOriginalFilename());
						documentMain1.setAttachment_referrence(duplicate_fileName);

						// ----End Lines to changed----//

						int readBytes = 0;
						buffer = new byte[(int) file.getSize()];
						while ((readBytes = inputStream.read(buffer, 0,
								(int) file.getSize())) != -1) {
							outputStream.write(buffer, 0, readBytes);
						}
						outputStream.close();
						inputStream.close();

					}
				}
				
				if(true)
				{
			        revisionDocumentDAO.insert_revision(revisionDocument,documentMain1.getAuto_number(),documentMain1);

					documentControlDAO.update_document(documentMain1, documentMain1.getAuto_number(), principal.getName());
					
					model.addAttribute("success", "true");
					model.addAttribute("success_message", "Updated Successfully");
					flag = 1;
					System.out.println("flag=1");
				}

			} catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}

			model.addAttribute("id", "1001");
			if (flag == 1)
			{
				
				
				DocumentMainForm documentMainForm = new DocumentMainForm();
				documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
				model.addAttribute("documentMainForm", documentMainForm);
				  model.addAttribute("menu","document");
				  model.addAttribute("id", documentControlDAO.get_documentid());
			    // revisionDocumentDAO.insert_revision(revisionDocument,documentMain1.getAuto_number(),documentMain1);

				
				return "view_documents";
			
			}
			else
			{
				
			DocumentMainForm documentMainForm = new DocumentMainForm();
			documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
			model.addAttribute("documentMainForm", documentMainForm);
			model.addAttribute("menu","document");
			model.addAttribute("id",documentControlDAO.get_documentid());
			return "view_documents";
			
			}
		}
	
	//Insert a record
	@RequestMapping(value = { "/insert_documents" }, method = RequestMethod.POST)
	public String insert_document(HttpSession session,
			HttpServletRequest request, ModelMap model, Principal principal,
			@ModelAttribute("DocumentMain") @Valid DocumentMain documentMain, @Valid RevisionDocument revisionDocument,BindingResult result) throws IOException {
		
		int flag = 0;
		//documentMain.setDocument_id(request.getParameter("document_id_hidden"));
		
		String doc_id=request.getParameter("document_id_hidden");
		System.out.println("doc id="+doc_id);
		documentMain.setDocument_id(doc_id);
		String auto_number=request.getParameter("auto_number");
		System.out.println("auto-number"+auto_number);
	
		System.out.println("Started Inserting documents");
		session.setAttribute("documentMain",documentMain);
		// Started to handle upload document
		
		
		
		if(result.hasErrors())
		{
			load_document_page_dropdowns(model);
			model.addAttribute("id",documentControlDAO.get_documentid());
			return "add_documents";
		}
		else
		{
			if(documentMain.getMedia_type().equals("1"))
			{
				documentMain.setLocation("Nil");
			}
			/*else if(documentMain.getMedia_type().equals("2")){
				documentMain.setLocation(documentMain.getLocation());
			}*/
		byte[] buffer;
		try {
			MultipartFile file = documentMain.getAttachments();
			String orginal_fileName = null;
			String duplicate_fileName = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			if (file != null) {
				if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					if (file.getSize() > 100000) {
						System.out.println("File Size:::" + file.getSize());
						return "/add_documents";
					}
					orginal_fileName = "C:/projects/"+ file.getOriginalFilename();
					duplicate_fileName = orginal_fileName;
					File create_file = new File(orginal_fileName);
					int i = 1;
					while (create_file.exists()) {

						duplicate_fileName = "C:/projects/"+ file.getOriginalFilename().substring(
										0,
										file.getOriginalFilename().lastIndexOf(
												'.'))
												+ i
								+ file.getOriginalFilename().substring(
										file.getOriginalFilename().lastIndexOf(
												'.'));
						create_file = new File(duplicate_fileName);
						i++;
					}
					outputStream = new FileOutputStream(duplicate_fileName);
					System.out.println("fileName:" + file.getOriginalFilename());

					// ------Lines to changes------//

					documentMain.setAttachment_type(file.getContentType());
					documentMain.setAttachment_name(file.getOriginalFilename());
					documentMain.setAttachment_referrence(duplicate_fileName);

					// ----End Lines to changed----//

					int readBytes = 0;
					buffer = new byte[(int) file.getSize()];
					while ((readBytes = inputStream.read(buffer, 0,
							(int) file.getSize())) != -1) {
						outputStream.write(buffer, 0, readBytes);
					}
					outputStream.close();
					inputStream.close();

				}
			}
			if (documentControlDAO.insert_document(documentMain)) {
				documentControlDAO.insert_prefix(documentMain.getDocument_id().substring(0,documentMain.getDocument_id().lastIndexOf('-')));
				model.addAttribute("success", "true");
				model.addAttribute("success_message", "Inserted Successfully");
				flag = 1;
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}

		model.addAttribute("id", "1001");
		if (flag == 1)
		{
			DocumentMainForm documentMainForm = new DocumentMainForm();
			documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
			model.addAttribute("documentMainForm", documentMainForm);
			  model.addAttribute("menu","document");
			  model.addAttribute("id",documentControlDAO.get_documentid());
			 revisionDocumentDAO.insert_revision(revisionDocument,documentMain.getAuto_number());
			
			  return "view_documents";
		}
		else
			return "view_documents";
		}
	}


	//ajax get issuer post method
	@RequestMapping(value = { "/ajax_getissuer" }, method = RequestMethod.POST)
	public @ResponseBody
	String insert_external_document(HttpSession session,
			HttpServletRequest request, ModelMap model, Principal principal) {
		String resultHTML="";
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.filterEmployees());
		resultHTML="<Select name='issuer' class='input_cmbbx1' style='width:120px;'>";
		for (Employee employee : employeeDAO.filterEmployees() ) {
			resultHTML+="<option value='"+employee.getName()+"'>"+employee.getName()+"</option>";
		}
		resultHTML+="</select>";
		return resultHTML;
	}
	
	//Post method for ajax get process 
	@RequestMapping(value = { "/ajax_getprocess" }, method = RequestMethod.POST)
	public @ResponseBody
	String ajax_process_owner(HttpSession session,
			HttpServletRequest request, ModelMap model, Principal principal) {
		String resultHTML="";
	
		String process_name=request.getParameter("process");
		
		String process_owner=processDAO.getProcess_owner(process_name).get(0).getProcess_owner();
		
		
		
		resultHTML="<input type='hidden' name='approver1' id='hidden_process_owner' value='"+process_owner+"'/><label id='process_owner_lbl'>"+process_owner+"</label>";
		
		return resultHTML;
	}

	// Document Views
	@RequestMapping(value = "/viewdocuments", method = RequestMethod.GET)
	public String login(ModelMap model) {

		DocumentMainForm documentMainForm = new DocumentMainForm();
		//documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
		
		model.addAttribute("menu","document");
	  	model.addAttribute("noofrows",5);
	  	//narrativereportForm.getNarrativereport().size());       
	  	documentMainForm.setDocumentMains(documentControlDAO.getlimiteddocumentreport(1));
	    model.addAttribute("noofpages",(int) Math.ceil(documentControlDAO.getnoofdocumentreport() * 1.0 / 5));	 
        model.addAttribute("button","viewall");
        model.addAttribute("success","false");
        model.addAttribute("currentpage",1);
        model.addAttribute("documentMainForm", documentMainForm);
		return "view_documents";

	}
	
	



	@RequestMapping(value="/viewdocumentreport_page", method=RequestMethod.GET)
	public String viewdocumentreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		DocumentMainForm documentMainForm = new DocumentMainForm();
	  	documentMainForm.setDocumentMains(documentControlDAO.getlimiteddocumentreport(page));
		model.addAttribute("noofpages",(int) Math.ceil(documentControlDAO.getnoofdocumentreport() * 1.0 / 5));
	 	model.addAttribute("documentMainForm", documentMainForm);	
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","document");
	    model.addAttribute("button","viewall");
	    
	    return "view_documents";
		
	}


	@RequestMapping(value={"/viewalldocumentreport"}, method = RequestMethod.GET)
	public String viewalldocumentreport(HttpServletRequest request,ModelMap model, Principal principal ) {
		DocumentMainForm documentMainForm = new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
		model.addAttribute("documentMainForm", documentMainForm);

	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","document");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","document");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "view_documents";

	}

//download the file
	@RequestMapping(value = "/downloadMaindoc", method = RequestMethod.GET)
	public String downloadMaindoc(HttpServletResponse response,
			@RequestParam("id") String document_id, ModelMap model)
			throws IOException {

		DocumentMainForm documentMainForm = new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO
				.getDocuments(document_id));
		model.addAttribute("documentMainForm", documentMainForm);

		FileHandlingDAO.filedownload(response, documentMainForm.getDocumentMains()
						.get(0).getAttachment_referrence(), documentMainForm
						.getDocumentMains().get(0).getAttachment_name());

		return "view_documents";

	}

	//search a record
	@RequestMapping(value = "/findDocument", method = RequestMethod.GET)
	public String findDocument(
			@RequestParam("search_document_type") String search_document_type,
		//	@RequestParam("search_document_title") String search_document_title,
			@RequestParam("search_process") String search_process,
			ModelMap model) {

		DocumentMainForm documentMainForm = new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.findDocuments(search_document_type,search_process));
		model.addAttribute("documentMainForm", documentMainForm);
		return "view_documents";

	}
	
	// Document Control list page	
	
	@RequestMapping(value = "/list_documents", method = RequestMethod.GET)
	public String list_document(@RequestParam("id") String document_id,
			ModelMap model, Principal principal) 
	{
		DocumentMainForm documentMainForm = new DocumentMainForm();

		documentMainForm.setDocumentMains(documentControlDAO.list_documents(document_id));

		model.addAttribute("documentMainForm", documentMainForm);
		model.addAttribute("menu","document");
		return "list_documents";
	}


	//report page request passing
	@RequestMapping(value = "/document_report", method = RequestMethod.GET)
	public String reportDocument(ModelMap model) {
		  model.addAttribute("menu","document");
		return "report_document";

	}
	
	//report generation
	@RequestMapping(value = "/generate_doc_report", method = RequestMethod.POST)
	public ModelAndView generateDocument_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response) {
		
		String[] fields={"document_id","document_title","document_type","media_type","location","process","external","issuer","revision_level","date","approver1","approver2","approver3","status","comments"};
		System.out.println(request.getParameter("type_of_report"));
		java.util.List<DocumentMain> documentMains=new ArrayList<DocumentMain>();
		
		if(request.getParameter("type_of_report").equals("document_list_by_type"))
		{
			switch(Integer.parseInt(request.getParameter("doc_type")))
				  {
		  case 0:
			  documentMains=documentControlDAO.getDocuments_bytype("Manual");
			  break;
		  case 1:
			  documentMains=documentControlDAO.getDocuments_bytype("Procedure");
			  break;
		  case 2:
			  documentMains=documentControlDAO.getDocuments_bytype("Work Instruction");
			  break;
		  case 3:
			  documentMains=documentControlDAO.getDocuments_bytype("Standard");
			  break;
		  case 4:
			  documentMains=documentControlDAO.getDocuments_bytype("Goverment Reg");
			  break;
		  case 5:
			  documentMains=documentControlDAO.getDocuments_bytype("Specification");
			  break;
		  default:
			  break;
				  
		}		
		}
		else
		{
			documentMains=documentControlDAO.getDocuments_byExternal();
		}
		
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		
				System.out.println("now ok::::");
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("document_name")+"'");
					
				fields=request.getParameterValues("report_field[]");
			
		}
		else
			 response.setHeader("Content-Disposition","attachment;filename='Document_Report'");
		
		
		ModelAndView modelAndView=new ModelAndView("documentcontrolDAO","documentMains",documentMains);
		
		modelAndView.addObject("fields",fields);
		
	
		return modelAndView ;
	}
	
	
public void load_document_page_dropdowns(ModelMap model)
{
	System.out.println("load");
	/*
	 * To generate process drop down
	 */
	ProcessForm processForm = new ProcessForm();
	processForm.setProcesses(processDAO.getProcess());
	model.addAttribute("processForm", processForm);

	/*
	 * Load Employee list
	 */

	EmployeeForm employeeForm = new EmployeeForm();
	employeeForm.setEmployees(employeeDAO.filterEmployees());
	model.addAttribute("employeeForm", employeeForm);
	
	/*
	 * Load Employee of Doc Control
	 */
	EmployeeForm employeeForm1 = new EmployeeForm();
	employeeForm1.setEmployees(employeeDAO.getEmployees_by_doc_control());
	model.addAttribute("employeeForm1",employeeForm1);
	
	/*
	 * Load Employee for management 
	 */
	DocumentPrefixForm documentPrefixForm = new DocumentPrefixForm();
	documentPrefixForm.setDocumentPrefixs(documentPrefixDAO.getprefix());
	model.addAttribute("documentPrefixForm",documentPrefixForm);
	
	
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	documentTypeForm.setDocumentTypes(documentTypeDAO.getdocumenttype());
	model.addAttribute("documentTypeForm",documentTypeForm);
	
	
	EmployeeForm employeeForm2 = new EmployeeForm();
	employeeForm2.setEmployees(employeeDAO.getEmployees_by_management_rep());
	model.addAttribute("employeeForm2",employeeForm2);
	
	model.addAttribute("prefix",documentControlDAO.getDocument_prefix());
	
	FormLocationForm formLocationForm = new FormLocationForm();
	formLocationForm.setFormLocations(formLocationDAO.getlocation());
	model.addAttribute("formLocationForm",formLocationForm);
	
	
}
/*//Post method for ajax get process 
@RequestMapping(value = { "/ajax_getrevision" }, method = RequestMethod.POST)
public @ResponseBody String ajax_revision(@RequestParam("revision_id")String revision_id,@RequestParam("document_id")String document_id, HttpSession session,
		HttpServletRequest request, ModelMap model, Principal principal) {
	System.out.println(revision_id);
	System.out.println("document id = "+document_id);
	String resultHTML="";

	document_id=revisionDocuments.get(index).getDocument_id();
	issuer=revisionDocuments.get(index).getIssuer();
	revision_level=revisionDocuments.get(index).getRevision_level();
	date = revisionDocuments.get(index).getDate();
	approver1 = revisionDocuments.get(index).getApprover1();
	approver2=revisionDocuments.get(index).getApprover2();
	approver3 = revisionDocuments.get(index).getApprover3();
	comments=revisionDocuments.get(index).getComments();
	status =  revisionDocuments.get(index).getStatus();
	revision_no=revisionDocuments.get(index).getRevision_id();
	
	
	String document_id= revisionDocumentDAO.getRevision(revision_id,document_id).get(0).getDocument_id();
	String issuer= RevisionDocumentDAO.getRevision(revision_id,document_id).get(0).getIssuer();
	String revision_level= RevisionDocumentDAO.getRevision(revision_id,document_id).get(0).getRevision_level();
	String approver1= revisionFormDAO.getRevision(revision_id,document_id1).get(0).getApprover1();
	
	String comments= revisionFormDAO.getRevision(revision_id,document_id1).get(0).getComments();
	<input type='hidden' name='approver1' id='approver1' value='"+approver1+"'/><label id='approver1'>"+approver1+"</label>
	
	resultHTML = 
		" <tr class='row2'>"+
		" <td valign='middle' align='left' class='input_txt' width='20%'>Comments:&nbsp;&nbsp;&nbsp;</td>" +
		"<td valign='top' align='center' class='input_txt' width='70%'><input type='hidden' name='comments' id='comments' value='"+comments+"'/><label id='approver1'>"+comments+"</label></br><span class='err'></span></td>" +
		"</tr>" +
		
		" <tr class='row1'>" +
		" <td valign='middle' align='left' class='input_txt' width='20%'>Issuer:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
		"<td valign='top' align='center' class='input_txt' width='70%'><input type='hidden' name='issuer' id='issuer' value='"+issuer+"'/><label id='approver1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+issuer+"</label></br><span class='err'></span></td>" +
		"</tr>" +
		
		
		" <tr class='row2'>"+
		" <td valign='middle' align='left' class='input_txt' width='20%'>Approver1(Process&nbsp;Owner):</td>" +
		"<td valign='top' align='left' class='input_txt' width='70%'><input type='hidden' name='approver1' id='approver1' value='"+approver1+"'/><label id='approver1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+approver1+"</label></br><span class='err'></span></td>" +
		"</tr>" +
		
		" <tr class='row1'>" +
		" <td valign='middle' align='left' class='input_txt' width='20%'>Effective&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
		"<td valign='top' align='left' class='input_txt' width='70%'><input type='hidden'name='effective_date' id='effective_date' value='"+effective_date+"'/><label id='effective_date'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+effective_date+"</label></br><span class='err'></span></td>" +
		"</tr>" +
	
		
			" <tr class='row2'>" +
			" <td valign='middle' align='left' class='input_txt' width='20%'>Form/Rec&nbsp;Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
			"<td valign='top' align='left' class='input_txt' width='70%'><input type='hidden'name='document_id' id='document_id' value='"+document_id+"'/><label id='document_id'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+document_id+"</label></br><span class='err'></span></td>" +
			"</tr>" +
			
		
			
			
			
			
			
			
			"";
			
	
	
	
	return resultHTML;
}*/

@RequestMapping(value = { "/ajax_getrevisiondoc" }, method = RequestMethod.POST)
public @ResponseBody String ajax_revisionsdoc(@RequestParam("auto_number")String auto_number, HttpSession session,
		HttpServletRequest request, ModelMap model, Principal principal) {
	System.out.println(auto_number);
String number = auto_number.trim();
	//String resultHTML="";
	List<RevisionDocument> revisionDocuments = new ArrayList<RevisionDocument>();
	revisionDocuments = revisionDocumentDAO.getRevision(number);
	System.out.println(revisionDocuments.size());
	 String revision_no="",document_id="",issuer="",revision_level="",date="",approver1="",approver2="",approver3="",comments="",status="";
    
    String resultHTML="<tr>";
    int list = revisionDocuments.size();
   
    	for (int index=0;list>=1; index++,list--)
    	{
    		document_id=revisionDocuments.get(index).getDocument_id();
    		issuer=revisionDocuments.get(index).getIssuer();
    		revision_level=revisionDocuments.get(index).getRevision_level();
    		date = revisionDocuments.get(index).getDate();
    		approver1 = revisionDocuments.get(index).getApprover1();
    		approver2=revisionDocuments.get(index).getApprover2();
    		approver3 = revisionDocuments.get(index).getApprover3();
    		comments=revisionDocuments.get(index).getComments();
    		status =  revisionDocuments.get(index).getStatus();
    		revision_no=revisionDocuments.get(index).getRevision_id();
    		resultHTML=  resultHTML +
    		"<td><input type='hidden'name='document_id' id='document_id' value='"+document_id+"'/>"+document_id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
    		"<td><input type='hidden'name='issuer' id='issuer' value='"+issuer+"'/>"+issuer+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
    		"<td><input type='hidden'name='revision_level' id='revision_level' value='"+revision_level+"'/>"+revision_level+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
    		"<td><input type='hidden'name='date' id='date' value='"+date+"'/>"+date+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
       		"<td><input type='hidden' name='approver1' id='approver1' value='"+approver1+"'/>"+approver1+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
    		"<td ><input type='hidden' name='approver2' id='approver2' value='"+approver2+"'/>"+approver2+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
    		"<td><input type='hidden'name='approver3' id='approver3' value='"+approver3+"'/>"+approver3+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
       		"<td ><input type='hidden' name='comments' id='comments' value='"+comments+"'/>"+comments+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
       		"<td><input type='hidden'name='status' id='status' value='"+status+"'/>"+status+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
    		"<td ><input type='hidden'name='revision_id' id='revision_id' value='"+revision_no+"'/>"+revision_no+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
    				"</tr><tr>";
    		
    	}
    
	return resultHTML;
}	

}
