package qms.controllers;

import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import qms.dao.EmployeeDAO;
import qms.dao.FileHandlingDAO;
import qms.dao.FormDAO;
import qms.dao.ProcessDAO;
import qms.model.Employee;
import qms.model.Form;
import qms.model.Maintenance;
import qms.forms.DocumentMainForm;
import qms.forms.EmployeeForm;
import qms.forms.FormForm;
import qms.forms.MaintenanceForm;

import qms.forms.ProcessForm;

@Controller
//@SessionAttributes({"audit_id","audit_process","audit_start_date","audit_due_date","auditor","audit_notes","audit_finding","audit_completion_date","auditors_initials","auditee_name"})
@SessionAttributes({"docform"})
public class FormController
{
	@Autowired
	FormDAO formDAO;
	
	@Autowired
	ProcessDAO processDAO;

	@Autowired
	EmployeeDAO employeeDAO;


	@Autowired
	FileHandlingDAO fileHandlingDAO;
	
	
	
	/*@RequestMapping(value={"/viewform"}, method = RequestMethod.GET)
	public String show_form(HttpSession session,HttpServletRequest request, ModelMap model, Principal principal )
	{
    FormForm formForm=new FormForm();
    formForm.setForm(formDAO.getform());
    model.addAttribute("formForm",formForm);
	return "view_form";
 	}*/
	
	//Getting unique id
	@RequestMapping(value={"/addform"}, method = RequestMethod.GET)
	public String add_form(HttpSession session,ModelMap model, Principal principal )
	{
		session.removeAttribute("docform");
		load_document_page_dropdowns(model);
		model.addAttribute("id", formDAO.get_formid());
		  model.addAttribute("menu","document");
        return "add_form";
 	}
	

	//Insert a record
	@RequestMapping(value={"/addform"}, method = RequestMethod.POST)
	public String insert_form(HttpSession session,HttpServletRequest request,ModelMap model, @ModelAttribute("Form") @Valid Form form, BindingResult result, Principal principal)

	{	
		int flag = 0;
		
		String form_id=request.getParameter("document_id_hidden");
		form.setForm_or_rec_id(form_id);
		String auto_number=request.getParameter("auto_number");
		System.out.println("Auto"+auto_number);
	//	form.setForm_or_rec_id(request.getParameter("document_type_id") + '-'	+ form.getForm_or_rec_id());
		/*form.setAuto_no(request.getParameter("document_type_id1") + '-' + form.getAuto_no());*/
		System.out.println("Started Inserting documents");
		session.setAttribute("docform",form);
		// Started to handle upload document
		if(result.hasErrors())
		{
			System.out.println("Error");
			load_document_page_dropdowns(model);
		    model.addAttribute("id", formDAO.get_formid());
			return "add_form";
		}
		else
		{
		byte[] buffer;
		try {
			MultipartFile file = form.getAttachments();
			String orginal_fileName = null;
			String duplicate_fileName = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			if (file != null) {
				if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					if (file.getSize() > 100000) {
						System.out.println("File Size:::" + file.getSize());
						return "/add_form";
					}
					orginal_fileName = "/usr/share/tomcat6/temp/Upload/Form/"
							+ file.getOriginalFilename();
					duplicate_fileName = orginal_fileName;
					File create_file = new File(orginal_fileName);
					int i = 1;
					while (create_file.exists()) {
						duplicate_fileName = "/usr/share/tomcat6/temp/Upload/Form/"
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

					form.setAttachment_type(file.getContentType());
					form.setAttachment_name(file.getOriginalFilename());
					form.setAttachment_referrence(duplicate_fileName);

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
			if (formDAO.insert_form(form)) {
				formDAO.insert_prefix(form.getForm_or_rec_id().substring(0,form.getForm_or_rec_id().lastIndexOf('-')));
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
			
			FormForm formForm=new FormForm();
		    formForm.setForm(formDAO.getform());
		    model.addAttribute("formForm",formForm);
             model.addAttribute("menu","document");
             model.addAttribute("id", formDAO.get_formid());
			return "view_form";
		}
		else
			return "view_form";
		}
		/*System.out.println("came");
		formDAO.insert_form(form);
		model.put("form", form);
		model.addAttribute("form",form);
		model.addAttribute("menu","form");
		  model.addAttribute("menu","document");
		return "add_form";*/
 	}
	
	//Update a record
	@RequestMapping(value={"/updateform"}, method = RequestMethod.POST)
	public String update_form(HttpSession session,@ModelAttribute("Form") @Valid Form form,BindingResult result,ModelMap model, Principal principal)
	{
		int flag = 0;
		session.setAttribute("docform",form);
		if(result.hasErrors())
		{
			
			load_document_page_dropdowns(model);
			return "edit_form";
		}
		else
		{

			byte[] buffer;
			try {
				MultipartFile file = form.getAttachments();
				String orginal_fileName = null;
				String duplicate_fileName = null;
				InputStream inputStream = null;
				OutputStream outputStream = null;
				if (file != null) {
					if (file.getSize() > 0) {
						inputStream = file.getInputStream();
						if (file.getSize() > 100000) {
							System.out.println("File Size:::" + file.getSize());
							return "/add_form";
						}
						orginal_fileName = "C:/QMS/Upload/Documents/"
								+ file.getOriginalFilename();
						duplicate_fileName = orginal_fileName;
						File create_file = new File(orginal_fileName);
						int i = 1;
						while (create_file.exists()) {
							duplicate_fileName = "C:/QMS/Upload/Documents/"
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

						form.setAttachment_type(file.getContentType());
						form.setAttachment_name(file.getOriginalFilename());
						form.setAttachment_referrence(duplicate_fileName);

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
				if (formDAO.update_form(form)) {
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
				FormForm formForm=new FormForm();
			    formForm.setForm(formDAO.getform());
			    model.addAttribute("formForm",formForm);
	             model.addAttribute("menu","document");
	             model.addAttribute("id", formDAO.get_formid());
				return "view_form";
			}
			else
			{
				FormForm formForm=new FormForm();
		    formForm.setForm(formDAO.getform());
		    model.addAttribute("formForm",formForm);
             model.addAttribute("menu","document");
             model.addAttribute("id", formDAO.get_formid());
				return "view_form";
			}
		
	}
		/*session.setAttribute("form",form);*/
		
		/*if(result.hasErrors())
		{
			System.out.println("vali");
			FormForm formForm=new FormForm();
		    formForm.setForm(formDAO.getform(form.getAuto_no()));
		    model.addAttribute("formForm",formForm);
			return "edit_form";
		}
		
		formDAO.update_form(form);
		
				
		FormForm formForm = new FormForm();
		model.addAttribute("formForm", formForm);
		model.addAttribute("success","true");
		model.addAttribute("menu","form");
		FormForm formForm=new FormForm();
	    formForm.setForm(formDAO.getform());
	    model.addAttribute("formForm",formForm);
	    model.addAttribute("menu","document");
		 
		return "view_form";*/
 	
	}
	
	//delete a record
	@RequestMapping(value={"/deleteform"}, method = RequestMethod.GET)
	public String delete_form(@RequestParam("auto_no") String auto_no,ModelMap model, Principal principal )
	{
		
		formDAO.delete_form(auto_no);
		FormForm formForm=new FormForm();
	    formForm.setForm(formDAO.getform());
	    model.addAttribute("formForm",formForm);

	    model.addAttribute("menu","document");
		return "view_form";
		
 	}
	
	
	/*@RequestMapping(value = "review_history_form", method = RequestMethod.GET)
	public String revision_history1(@RequestParam("") String document_id,HttpSession session ,ModelMap model, Principal principal) 
	{
		  System.out.println("inside history");
		load_document_page_dropdowns(model);
		DocumentMainForm documentMainForm=new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocument_byid(document_id));
		model.addAttribute("documentMainForm",documentMainForm);
		
		  model.addAttribute("menu","document");
		
		return "revisionhistoryform";
	}*/
	@RequestMapping(value={"/review_history_form"}, method = RequestMethod.GET)
	public String review_history_form(HttpSession session,@RequestParam("auto_no") String auto_no,Form form,ModelMap model)
	{
    
		//session.removeAttribute("docform");
		//load_document_page_dropdowns(model);
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform(auto_no));
		model.addAttribute("formForm",formForm);
		  model.addAttribute("menu","document");
		return "revisionhistoryform";
 	}
	@RequestMapping(value={"/edit_form"}, method = RequestMethod.GET)
	public String edit_forms(HttpSession session,@RequestParam("auto_no") String auto_no,Form form,ModelMap model)
	{
    
		session.removeAttribute("docform");
		load_document_page_dropdowns(model);
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform(auto_no));
		model.addAttribute("formForm",formForm);
		  model.addAttribute("menu","document");
		return "edit_form";
 	}

@RequestMapping(value={"/review_form"}, method = RequestMethod.GET)
	public String review_form(HttpSession session,@RequestParam("auto_no") String auto_no,Form form,ModelMap model)
	{
    
		session.removeAttribute("docform");
		load_document_page_dropdowns(model);
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform(auto_no));
		model.addAttribute("formForm",formForm);
		  model.addAttribute("menu","document");
		return "";
 	}

// Document Control list page	
	
	@RequestMapping(value = "list_form", method = RequestMethod.GET)
	public String list_document(@RequestParam("id") String auto_number,
			ModelMap model, Principal principal) 
	{
		FormForm formForm = new FormForm();

		formForm.setForm(formDAO.list_form(auto_number));
		model.addAttribute("formForm", formForm);
		model.addAttribute("menu","document");
		return "list_form";
	}


	
	//view page generation
	@RequestMapping(value={"/view_form"},method=RequestMethod.GET)
	public String viewEmployees(ModelMap model,Principal principal,Employee employee)
	{
		FormForm formForm=new FormForm();
		model.addAttribute("menu","document");
	  	model.addAttribute("noofrows",5);
	  	
	    formForm.setForm(formDAO.getlimitedformreport(1));
	    model.addAttribute("noofpages",(int) Math.ceil(formDAO.getnoofformreport() * 1.0 / 5));	 
        model.addAttribute("button","viewall");
        model.addAttribute("success","false");
        model.addAttribute("currentpage",1);
	    
	    model.addAttribute("formForm",formForm);
	    
		return "view_form";
	}
	
	

	@RequestMapping(value="/viewformreport_page", method=RequestMethod.GET)
	public String viewformreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getlimitedformreport(page));
		model.addAttribute("noofpages",(int) Math.ceil(formDAO.getnoofformreport() * 1.0 / 5));	
		model.addAttribute("formForm",formForm);
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","document");
	    model.addAttribute("button","viewall");
	    
	    return "view_form";
		
	}


	@RequestMapping(value={"/viewallformreport"}, method = RequestMethod.GET)
	public String viewallformreport(HttpServletRequest request,ModelMap model, Principal principal ) {
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform());
		model.addAttribute("formForm",formForm);

	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	      
	    model.addAttribute("menu","document");
	    model.addAttribute("success","false");
	    model.addAttribute("button","close");
	        return "view_form";

	}

	
	
	//edit a record
	
	/*@RequestMapping(value="/searchform",method=RequestMethod.GET)		
	public String searchform(HttpServletRequest request,HttpSession session,@RequestParam("form_or_rec_title") String recordtitle,@RequestParam("form_media_type") String mediatype,@RequestParam("retention_time") String retentiontime,ModelMap model)

	{
		
		System.out.println("find");
		session.setAttribute("recordtitle", recordtitle);
		session.setAttribute("mediatype", mediatype);
		session.setAttribute("retentiontime",retentiontime);

		if(recordtitle=="" && mediatype=="" && retentiontime=="")
		{
			FormForm formForm = new FormForm();
			formForm.setForm(formDAO.getform(recordtitle, mediatype, retentiontime));

			model.addAttribute("formForm",formForm);
			model.addAttribute("menu", "form");
			System.out.println("finding....");
			return "view_form";
		}
		else
		{
			System.out.println("searching.......");
			FormForm formForm = new FormForm();
			formForm.setForm(formDAO.getform(recordtitle, mediatype, retentiontime));
        model.addAttribute("formForm", formForm);
        model.addAttribute("menu","form");
        System.out.println("finding result");
		return "view_form";		
		}
		}*/
	
	public void load_document_page_dropdowns(ModelMap model)
	{
		System.out.println("load");
		
		/* * To generate process drop down*/
		 
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);

		/*
		 * Load Employee list*/
		 

		EmployeeForm employeeForm = new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.filterEmployees("A"));
		model.addAttribute("employeeForm", employeeForm);
		
		model.addAttribute("prefix",formDAO.getDocument_prefix());
	}
	
	//search a record
	 @RequestMapping(value={"/search_form"}, method = RequestMethod.GET)
		
		public String search_form(@RequestParam("process") String process,ModelMap model, Principal principal)
	{
		
		 FormForm formForm = new FormForm();
		 
		
		formForm.setForm(formDAO.search_form(process));
		
		
		model.addAttribute("formForm", formForm);
        model.addAttribute("menu","form");
        
		 model.addAttribute("formForm",formForm);
		
	    return "view_form";

	}
	 
	 //report page request passing
	 @RequestMapping(value={"/form_report"}, method = RequestMethod.GET)
		public String form_report(HttpSession session,ModelMap model, Principal principal )
		{
			
	        return "form_report";
	 	}
	 
	 //External Form report generation
	 @RequestMapping(value = "/generate_doc_form", method = RequestMethod.POST)
		public ModelAndView generateDocument_Form(HttpServletRequest request,ModelMap model, HttpServletResponse response) {
			
			String[] fields={"auto_number","location","form_or_rec_id","responsibility","form_or_rec_title","process","media_type","retention_time","form","effective_date","document_id","approver1","issuer","comments"};
			System.out.println(request.getParameter("type_of_form"));
			java.util.List<Form> form=new ArrayList<Form>();
			
			if(request.getParameter("type_of_form").equals("human_resources"))
			{
				
				form=formDAO.gethuman_resources();
				
				
			}
			else
			{
				form=formDAO.getengineering();
			
			}
			
			if(Integer.parseInt(request.getParameter("report_type"))==1)
			{
			
					System.out.println("now ok::::");
					 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("document_name")+"'");
						
					fields=request.getParameterValues("report_field[]");
				
			}
			else
				 response.setHeader("Content-Disposition","attachment;filename='Document_Report'");
			
			
			ModelAndView modelAndView=new ModelAndView("formDAO","form",form);
			
			modelAndView.addObject("fields",fields);
			
		
			return modelAndView ;
		}
	
}

