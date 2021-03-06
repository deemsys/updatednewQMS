package qms.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
import qms.forms.MaintenanceForm;
import qms.model.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
@SessionAttributes({"maintenances"})
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
	
	public String search_maintenance(@RequestParam("equipment_id") String equipment_id,@RequestParam("equipment_name") String equipment_name,@RequestParam("date_acquired") String date_acquired,ModelMap model, Principal principal)
{
	System.out.println(equipment_id);
    if(equipment_id.equals("")&&equipment_name.equals("")&&date_acquired.equals(""))
	{
    	MaintenanceForm maintenanceForm=new MaintenanceForm();
    	maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name,date_acquired));
    	
    	model.addAttribute("maintenanceForm",maintenanceForm);
	}
	else
	{
		MaintenanceForm maintenanceForm=new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name,date_acquired));
		
		model.addAttribute("maintenanceForm",maintenanceForm);
			}
  
	//return "view_maintenance";
return "maintenance_list";
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
		model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		return "maintenance_list";
	}
	
	//maintenance report list page
	@RequestMapping(value="/maintenance_list", method=RequestMethod.GET)
	public String maintenancelist(HttpServletRequest request,ModelMap model, Principal principal) {
		MaintenanceForm maintenanceForm= new MaintenanceForm(); 
		model.addAttribute("menu","maintenance");
	  	model.addAttribute("noofrows",5);
		
		
		maintenanceForm.setMaintenance(maintenanceDAO.getlimitedmaintenancereport(1));
		model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.getnoofmaintenancereport() * 1.0 / 5));	 
        model.addAttribute("button","viewall");
        model.addAttribute("success","false");
        model.addAttribute("currentpage",1);
		model.addAttribute("maintenanceForm",maintenanceForm);
		
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
		model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
	    return "maintenance_list";
	}
	
	//Report generation
	@RequestMapping(value = "/maintenances_report", method = RequestMethod.POST)
		public ModelAndView generateMaintenance_Report(HttpServletRequest request,ModelMap model) {
		//System.out.println("generateAudit_Report");
	String[] fields={"equipment_id","equipment_name","equipment_model","serial_number","date_acquired","equipment_status","frequency_maintenance","calibration","type_of_maintenance","maintenance_frequency","reference","instructions","due_date","completion_date","completed_by","notes"};	
		String title = "internal_audit";
		int no_of_days=0;
		java.util.List<Maintenance> maintenance=new ArrayList<Maintenance>();
		 switch(Integer.parseInt(request.getParameter("maintenance_report_type")))
				  {
					  case 0:
						
			  maintenance=maintenanceDAO.getMaintenance_bytype("maintain_for_30",no_of_days);
			  title="Due Maintenance for next 30 days";
			  break;
		  case 1:
			
			  //no_of_days=request.getParameter("no_of_days");
			  maintenance=maintenanceDAO.getMaintenance_bytype("upcoming_calibration",no_of_days);
			  no_of_days=Integer.parseInt(request.getParameter("no_of_days"));
				
			  title="Upcoming Calibration for next xx days";
			  break;
		  case 2:
			 
			  maintenance=maintenanceDAO.getMaintenance_bytype("maintenance_past_due",no_of_days);
			  title="Past Due Maintenance";
			  break;
		  case 3:
			  System.out.println("case4");
			  maintenance=maintenanceDAO.getMaintenance_bytype("calibration_past_due",no_of_days);
			  title="Past Due Calibration";
			  break;
			  default:
			  break;
				  
		}		
		 System.out.println(title);
	if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		if(request.getParameterValues("report_field[]")!=null)
			
			for (@SuppressWarnings("unused") String field : request.getParameterValues("report_field[]")) 
			{
				title=request.getParameter("report_title");
				System.out.println(title);
						
				//fields=request.getParameterValues("report_type");
				ModelAndView modelAndView=new ModelAndView("maintenanceDAO","maintenance",maintenance);

				modelAndView.addObject("fields",request.getParameterValues("report_field[]"));
				modelAndView.addObject("title",title);
				return modelAndView ;
			}
		}
		
		
	ModelAndView modelAndView=new ModelAndView("maintenanceDAO","maintenance",maintenance);

		modelAndView.addObject("fields",fields);
		modelAndView.addObject("title",title);
		 
		return modelAndView ;
		
	}

	//report page request passing
	@RequestMapping(value = { "/maintenance_report" }, method = RequestMethod.GET)
	public String view_maintenance_report(Maintenance maintenance,ModelMap model) {

		model.addAttribute("report_table","no");
		model.addAttribute("menu","maintenance");
	    return "maintenance_report";
	}
	
	//Report generation
	@RequestMapping(value = "/maintanence_report", method = RequestMethod.POST)
	public String getReport(HttpServletRequest request,ModelMap model) {

		String[] fields={"equipment_id","equipment_name","equipment_model","serial_number","date_acquired","equipment_status","frequency_maintenance","calibration","type_of_maintenance","maintenance_frequency","reference","instructions","due_date","completion_date","completed_by","notes"};
		String type=request.getParameter("type_of_report");
	
		
		
		
		
		//String no_of_days=request.getParameter("number_of_days");
		
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		int no_of_days = 0;
		maintenanceForm.setMaintenance(maintenanceDAO.getMaintenance_bytype(type, no_of_days));
		model.addAttribute("maintenanceForm",maintenanceForm);
		
		model.addAttribute("report_table","yes");
		model.addAttribute("menu","maintenance");
	    return "maintenance_report";
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
}