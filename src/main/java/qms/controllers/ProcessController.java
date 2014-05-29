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
import qms.model.Process;
import qms.dao.ProcessDAO;
import qms.forms.EmployeeForm;
import qms.forms.FormFormPrefix;
import qms.forms.ProcessForm;
import qms.model.FormPrefix;


@Controller
@SessionAttributes({"controlprocess"})
public class ProcessController
{
	@Autowired
	ProcessDAO processDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = { "/add_process" }, method = RequestMethod.GET)
		
		public String addProcess(HttpSession session,ModelMap model, Principal principal) {
			session.removeAttribute("controlprocess");
			model.addAttribute("menu","admin");
			return "add_process";
		}

	//Insert a record
	@RequestMapping(value = "/add_process", method = RequestMethod.POST)
	public String postProcess(HttpSession session,@ModelAttribute("Process") @Valid Process process,BindingResult result, ModelMap model) {

		session.setAttribute("process",process);
			if (result.hasErrors())
			{
				ProcessForm processForm = new ProcessForm();
				processForm.setProcesses(processDAO.getProcess());
				model.addAttribute("processForm",processForm);
				model.addAttribute("Success","true");
		        return "add_process";
			}
		
			processDAO.insert_Process(process);
			ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.getProcess());
			model.addAttribute("processForm",processForm);
			model.addAttribute("menu","admin");
		return "process_list";
	}

	
	@RequestMapping(value="/process_list", method=RequestMethod.GET)
	public String Processlist(HttpServletRequest request,ModelMap model, Principal principal) {
		
		ProcessForm processForm = new ProcessForm();
		model.addAttribute("menu","admin");
	  	model.addAttribute("noofrows",5);
	  	processForm.setProcesses(processDAO.getlimitedprocessreport(1));
		model.addAttribute("noofpages",(int) Math.ceil(processDAO.getnoofprocessreport() * 1.0 / 5));	 
		   
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
		model.addAttribute("processForm",processForm);
		
		return "process_list";
	}
	@RequestMapping(value="/viewprocessreport_page", method=RequestMethod.GET)
	public String viewprocessreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getlimitedprocessreport(page));
		model.addAttribute("noofpages",(int) Math.ceil(processDAO.getnoofprocessreport() * 1.0 / 5));
		model.addAttribute("processForm",processForm);	
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","admin");
	    model.addAttribute("button","viewall");
	    
	    return "process_list";
		
	}


	@RequestMapping(value={"/viewallprocessreport"}, method = RequestMethod.GET)
	public String viewallprocessreport(HttpServletRequest request,ModelMap model, Principal principal ) {
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm",processForm);
	  	model.addAttribute("noofrows",5);    
	    model.addAttribute("menu","admin");
	    model.addAttribute("button","close");
	    model.addAttribute("success","false");
	    return "process_list";

	}
	
	//Edit a record
	@RequestMapping(value = "/edit_process", method = RequestMethod.GET)
	public String EditProcess_get(@RequestParam("process_id") String process_id,Process processes,ModelMap model) {

		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.processes(process_id));
		model.addAttribute("processForm",processForm);
		model.addAttribute("menu","admin");
	    return "edit_process";
	}
	
	//Update a record
	@RequestMapping(value = "/update_process", method = RequestMethod.POST)
	public String Update_Process(ModelMap model,@ModelAttribute("Process") @Valid Process process,BindingResult result) throws IOException {

		if (result.hasErrors())
		{
			
			ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.processes(process.getProcess_id()));
			model.addAttribute("processForm",processForm);
	        return "edit_process";
		}
		
		processDAO.update_Process(process);
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm",processForm);
		model.addAttribute("menu","admin");
	    return "process_list";
	}
	//delete a record
	@RequestMapping(value={"/delete_process"}, method = RequestMethod.GET)
	public String delete_process(@RequestParam("process_id") String employee_id,ModelMap model, Principal principal )
	{
    
		processDAO.delete_process(employee_id);
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm",processForm);
		model.addAttribute("menu","admin");
		return "process_list";
 	}
	
	
}
