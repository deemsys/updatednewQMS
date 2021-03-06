package qms.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;

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
import qms.dao.FileHandlingDAO;
import qms.model.DocumentMain;
import qms.model.ManagementReview;
import qms.dao.ProcessDAO;
import qms.forms.EmployeeForm;
import qms.forms.InternalAuditsForm;
import qms.forms.ManagementReviewForm;
import qms.forms.ProcessForm;
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
	

	@RequestMapping(value = "/view_revision_history", method = RequestMethod.GET)
	public String revision_history(@RequestParam("doc_id") String document_id,HttpSession session ,ModelMap model, Principal principal) 
	{
		  System.out.println("inside history");
		load_document_page_dropdowns(model);
		DocumentMainForm documentMainForm=new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocument_byid(document_id));
		model.addAttribute("documentMainForm",documentMainForm);
		
		  model.addAttribute("menu","document");
		
		return "revisionhistory";
	}
	
	
	
	
	//edit a record
	@RequestMapping(value = "/edit_document", method = RequestMethod.GET)
	public String edit_document(@RequestParam("doc_id") String document_id,HttpSession session, ModelMap model,Principal principal) {

		session.removeAttribute("documentMain");
		load_document_page_dropdowns(model);
		DocumentMainForm documentMainForm=new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocument_byid(document_id));
		model.addAttribute("documentMainForm",documentMainForm);
		
		  model.addAttribute("menu","document");
		//documentControlDAO.getDocument_byid(document_id);
		
		return "edit_documents";
	}
	
	//updating a record
	@RequestMapping(value = { "/update_documents" }, method = RequestMethod.POST)
	public String update_document(@ModelAttribute("DocumentMain") @Valid DocumentMain documentMain,BindingResult result,HttpSession session, ModelMap model,Principal principal) {

		int flag = 0;
		session.setAttribute("documentMain",documentMain);
		if(result.hasErrors())
		{
			
			load_document_page_dropdowns(model);
			return "edit_documents";
		}
		else
		{

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
							return "/add_document";
						}
						orginal_fileName = "D:/Projects/Upload/DocumentControl/"
								+ file.getOriginalFilename();
						duplicate_fileName = orginal_fileName;
						File create_file = new File(orginal_fileName);
						int i = 1;
						while (create_file.exists()) {
							duplicate_fileName = "D:/Projects/Upload/DocumentControl/"
									+ file.getOriginalFilename().substring(
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
						System.out
								.println("fileName:" + file.getOriginalFilename());

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
				if (documentControlDAO.update_document(documentMain)) {
					model.addAttribute("success", "true");
					model.addAttribute("success_message", "Updated Successfully");
					flag = 1;
				}

			} catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}

			model.addAttribute("id", "1001");
			if (flag == 1)
			{
				;
				DocumentMainForm documentMainForm = new DocumentMainForm();
				documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
				model.addAttribute("documentMainForm", documentMainForm);
				  model.addAttribute("menu","document");
				return "view_documents";
			
			}
			else
				return "add_documents";
			}
			
		}
	
	//Insert a record
	@RequestMapping(value = { "/insert_documents" }, method = RequestMethod.POST)
	public String insert_document(HttpSession session,
			HttpServletRequest request, ModelMap model, Principal principal,
			@ModelAttribute("DocumentMain") @Valid DocumentMain documentMain, BindingResult result) throws IOException {
		int flag = 0;
		documentMain.setDocument_id(request.getParameter("document_id_hidden"));
		
		// + '-'	+ documentMain.getDocument_id());
	
		System.out.println("Started Inserting documents");
		session.setAttribute("documentMain",documentMain);
		// Started to handle upload document
		
		
		
		if(result.hasErrors())
		{
			load_document_page_dropdowns(model);
			return "add_documents";
		}
		else
		{
			if(documentMain.getMedia_type().equals("1"))
			{
				documentMain.setLocation("Nil");
			}
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
						return "/add_document";
					}
					orginal_fileName = "/usr/share/tomcat6/temp/Upload/Document"
							+ file.getOriginalFilename();
					duplicate_fileName = orginal_fileName;
					File create_file = new File(orginal_fileName);
					int i = 1;
					while (create_file.exists()) {
						duplicate_fileName = "/usr/share/tomcat6/temp/Upload/Document"
								+ file.getOriginalFilename().substring(
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
					System.out
							.println("fileName:" + file.getOriginalFilename());

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
			return "view_documents";
		}
		else
			return "add_documents";
		}
	}


	//ajax get issuer post method
	@RequestMapping(value = { "/ajax_getissuer" }, method = RequestMethod.POST)
	public @ResponseBody
	String insert_external_document(HttpSession session,
			HttpServletRequest request, ModelMap model, Principal principal) {
		String resultHTML="";
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.filterEmployees(request.getParameter("filter_val")));
		resultHTML="<Select name='issuer' class='input_cmbbx1' style='width:120px;'>";
		for (Employee employee : employeeDAO.filterEmployees(request.getParameter("filter_val")) ) {
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

		fileHandlingDAO
				.filedownload(response, documentMainForm.getDocumentMains()
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
		documentMainForm.setDocumentMains(documentControlDAO.findDocuments(
				search_document_type,search_process));
		model.addAttribute("documentMainForm", documentMainForm);
		return "view_documents";

	}
	
	// Document Control list page	
	
	@RequestMapping(value = "list_document", method = RequestMethod.GET)
	public String list_document(@RequestParam("id") String document_id,
			ModelMap model, Principal principal) 
	{
		DocumentMainForm documentMainForm = new DocumentMainForm();

		documentMainForm.setDocumentMains(documentControlDAO.list_documents(document_id));

		model.addAttribute("documentMainForm", documentMainForm);
		model.addAttribute("menu","document");
		return "list_document";
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
	employeeForm.setEmployees(employeeDAO.filterEmployees("A"));
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
	
	EmployeeForm employeeForm2 = new EmployeeForm();
	employeeForm2.setEmployees(employeeDAO.getEmployees_by_management_rep());
	model.addAttribute("employeeForm2",employeeForm2);
	
	model.addAttribute("prefix",documentControlDAO.getDocument_prefix());
	
	
}
}