package qms.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import qms.dao.MaintenanceDAO;
import qms.forms.DocumentMainForm;
import qms.forms.DocumentTypeForm;
import qms.forms.MaintenanceForm;
import qms.forms.ProcessForm;
import qms.model.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
@SessionAttributes({"maintenances","equipid","equipname","id","name"})
public class MaintenanceController {
	@Autowired
	MaintenanceDAO maintenanceDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = { "/add_maintenance" }, method = RequestMethod.GET)
	
	public String addMaintenance(HttpSession session,ModelMap model, Principal principal) {
		session.removeAttribute("maintenances");
		model.addAttribute("menu","maintenance");
		return "add_maintenance";
	}
	
	
	

	//search for record in view 
	@RequestMapping(value={"/search_maintenance"}, method = RequestMethod.GET)
	
	public String search_maintenance(@RequestParam("equipment_id") String equipment_id,@RequestParam("equipment_name") String equipment_name,ModelMap model,HttpSession session, Principal principal)
{
	System.out.println(equipment_id);
	session.setAttribute("equipid",equipment_id);
	session.setAttribute("equipname",equipment_name);
	
	
    
    	MaintenanceForm maintenanceForm=new MaintenanceForm();
    	maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name));
    	
    	model.addAttribute("maintenanceForm",maintenanceForm);
		
	//return "view_maintenance";
return "maintenance_list";
}
	
	//Search operation for admin setup
	@RequestMapping(value = "/search_maintenances", method = RequestMethod.GET)
	public String search_maintenances(@RequestParam("equipment_id") String equipment_id,@RequestParam("equipment_name") String equipment_name,ModelMap model, Principal principal,HttpSession session)
	{
		System.out.println("equip id====" +equipment_id);
		System.out.println("equip name==="+equipment_name);
		session.setAttribute("equipid",equipment_id);
		session.setAttribute("equipname",equipment_name);
		
			MaintenanceForm maintenanceForm=new MaintenanceForm();
	    	maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name));
	    	
	    	model.addAttribute("maintenanceForm",maintenanceForm);
	    	
		return "maintenancedelete";
		}
			

	
	
	//Insert a record
	@RequestMapping(value = "/add_maintenance", method = RequestMethod.POST)
	public String postMaintenance(HttpSession session,@ModelAttribute("Maintenance") @Valid Maintenance maintenance,BindingResult result, ModelMap model) {

		session.setAttribute("maintenances",maintenance);
			if (result.hasErrors())
			{
				MaintenanceForm maintenanceForm= new MaintenanceForm();
				maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
				model.addAttribute("maintenanceForm",maintenanceForm);
				model.addAttribute("Success","true");
		        return "add_maintenance";
			}
		
		maintenanceDAO.insert_maintenance(maintenance);
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
	//	model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		model.addAttribute("success","true");
		return "maintenance_list";
	}
	
	//maintenance report list page
	@RequestMapping(value="/maintenance_list", method=RequestMethod.GET)
	public String maintenancelist(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal) {
		session.removeAttribute("equipid");
		session.removeAttribute("equipname");
		
		MaintenanceForm maintenanceForm= new MaintenanceForm(); 
		model.addAttribute("menu","maintenance");
	  	model.addAttribute("noofrows",5);
		
		
		maintenanceForm.setMaintenance(maintenanceDAO.getlimitedmaintenancereport(1));
		model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.getnoofmaintenancereport() * 1.0 / 5));	 
        model.addAttribute("button","viewall");
        model.addAttribute("success","false");
        model.addAttribute("currentpage",1);
		//model.addAttribute("maintenanceForm",maintenanceForm);
		
		return "maintenance_list";
	}
	
	


	@RequestMapping(value="/viewmaintenancereport_page", method=RequestMethod.GET)
	public String viewmaintenancereport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getlimitedmaintenancereport(page));
		model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.getnoofmaintenancereport() * 1.0 / 5));
		model.addAttribute("maintenanceForm",maintenanceForm);	
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","viewall");
	    
	    return "maintenance_list";
		
	}


	@RequestMapping(value={"/viewallmaintenancereport"}, method = RequestMethod.GET)
	public String viewallmaintenancereport(HttpServletRequest request,ModelMap model, Principal principal ) {
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		model.addAttribute("maintenanceForm",maintenanceForm);

	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","maintenance");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "maintenance_list";

	}



	//view records
	@RequestMapping(value="/view_maintenance", method=RequestMethod.GET)
	public String viewmaintenance(HttpServletRequest request,@RequestParam("equipment_id") String equipment_id,ModelMap model,Maintenance maintenance)
	{
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance(equipment_id));
		model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		return "view_maintenance";
	}
	
	//Edit a record
	@RequestMapping(value = "/edit_maintenance", method = RequestMethod.GET)
	public String editmaintenance_get(@RequestParam("equipment_id") String equipment_id,Maintenance maintenance,ModelMap model) {

		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance(equipment_id));
		model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
	    return "edit_maintenance";
	}
	
	//Update a record
	@RequestMapping(value = "/update_maintenance", method = RequestMethod.POST)
	public String update_maintenance(ModelMap model,@ModelAttribute("Maintenance") @Valid Maintenance maintenance,BindingResult result) throws IOException {

		if (result.hasErrors())
		{
			
			MaintenanceForm maintenanceForm= new MaintenanceForm();
			maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance(maintenance.getEquipment_id()));
			model.addAttribute("maintenanceForm",maintenanceForm);
            return "edit_maintenance";
		}
		
		
		maintenanceDAO.update_maintenance(maintenance);
	    MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		//model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		model.addAttribute("success","update");
	    return "maintenance_list";
	}
	
	
	//This is used for downloading Excel Sheet
	@RequestMapping(value ={ "/maintenancereport" }, method = RequestMethod.GET)
	  public ModelAndView getExcel_view() {
	java.util.List<Maintenance> maintenances=new ArrayList<Maintenance>();
	
	maintenances=maintenanceDAO.getmaintenance();
	
	return new ModelAndView("maintenanceDAO","maintenances",maintenances);
	
	}
	//report page request passing
	@RequestMapping(value = "/maintenance_report", method = RequestMethod.GET)
	public String reportnonconformance(ModelMap model) {
		  model.addAttribute("menu","maintenance");
		return "report_maintenance";

	}
	
	//Nonconformance Report Generation
	@RequestMapping(value = "/generate_maintenance_report", method = RequestMethod.POST)
	public ModelAndView generatemaintenance_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response)
	{
		int no_of_days=0;
		String[] fields={"equipment_id","equipment_name","equipment_model","serial_number","date_acquired","equipment_status","frequency_maintenance","calibration","type_of_maintenance","maintenance_frequency","reference","instructions","due_date","completion_date","completed_by","notes"};
		System.out.println(request.getParameter("type_of_report"));
		java.util.List<Maintenance> maintenances=new ArrayList<Maintenance>();
			switch(Integer.parseInt(request.getParameter("doc_type")))
				  {
		  case 0:
			  maintenances=maintenanceDAO.getMaintenance_bytype("maintain_for_30", no_of_days);
			  break;
		  case 1:
			  no_of_days = Integer.parseInt(request.getParameter("no_of_days"));
			  
			  maintenances=maintenanceDAO.getMaintenance_bytype("upcoming_calibration",no_of_days);
			  break;
		  case 2:
			 
			  maintenances=maintenanceDAO.getMaintenance_bytype("maintenance_past_due",no_of_days);
			  break;
		  case 3:
				 
			  maintenances=maintenanceDAO.getMaintenance_bytype("calibration_past_due",no_of_days);
			  break;
		  default:
			  break;
				  
				
		}
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		
				System.out.println("now ok");
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("name_of_disposition_responsibility")+"'");
					
				fields=request.getParameterValues("report_field[]");
			
		}
		else
			
		response.setHeader("Content-Disposition","attachment;filename='Maintenance_Report'");
		
		
		ModelAndView modelAndView=new ModelAndView("maintenanceDAO","maintenances",maintenances);
		
		modelAndView.addObject("fields",fields);
		
		System.out.println("now ok::::");
		return modelAndView ;
	}

	
	//delete a record
	@RequestMapping(value = "/delete_maintenance", method = RequestMethod.GET)
	public String deletemaintenance(@RequestParam("equipment_id") String equipment_id,Maintenance maintenance,ModelMap model) {

		maintenanceDAO.delete_maintenance(equipment_id);
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		return "/maintenance_list";
	}
	

	//delete a record for admin setup
	@RequestMapping(value = { "/maintenancedelete" }, method = RequestMethod.GET)
	public String delete_maintenance(ModelMap model, Principal principal, HttpSession session) {
	
		session.removeAttribute("equipid");
		session.removeAttribute("equipname");
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		//model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","admin");
		return "maintenancedelete";
		
	}
	
	@RequestMapping(value={"/deletemaintenance"}, method = RequestMethod.POST)
	public String deleteSelectedmaintenance(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
	{	

	
		//session.removeAttribute("equipid");
		//session.removeAttribute("equipname");

		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		
		//formDAO.deleteParticipant(id,principal.getName());
		maintenanceDAO.delete_maintenance(id);
		}
		MaintenanceForm maintenanceForm = new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
	//	model.addAttribute("maintenanceForm",maintenanceForm);
        
		model.addAttribute("menu","admin");
		return "maintenancedelete";
		
	}
	
	
	
}