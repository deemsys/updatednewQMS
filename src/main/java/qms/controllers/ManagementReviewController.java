package qms.controllers;
import java.security.Principal;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import qms.dao.ManagementReviewDAO;
import qms.forms.ManagementReviewForm;
import qms.model.ManagementReview;

@Controller
@SessionAttributes({"managementreview"})
public class ManagementReviewController
{
	
	@Autowired
	ManagementReviewDAO managementreviewDAO;
	
//Getting Unique Id
@RequestMapping(value={"/addmanagementreview"}, method = RequestMethod.GET)
	
	public String add_managementreview(ModelMap model, Principal principal)  {
	model.addAttribute("id", managementreviewDAO.getMax_reviewid());
	return "add_managementreview";

}



//Insert a record
@RequestMapping(value="/addmanagementreview", method = RequestMethod.POST)
public String insert_managementreview(HttpSession session,@ModelAttribute("ManagementReview") @Valid ManagementReview managementReview, BindingResult result,ModelMap model, Principal principal)
{

	
	session.setAttribute("managementreview",managementReview);
	if(result.hasErrors())
	{
		System.out.println("Errors found");
		model.addAttribute("id", managementreviewDAO.getMax_reviewid());
		return "add_managementreview";
	}
	else
	{
	
	if(!managementreviewDAO.insert_managementreview(managementReview))
	{

		System.out.println("inserted");
		session.removeAttribute("managementreview");
	}
	}
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
	model.addAttribute("managementreviewform", managementreviewform);


	return "view_managementreview";
}


//view a record page
@RequestMapping(value="/view_review", method=RequestMethod.GET)
public String viewmaintenance(HttpServletRequest request,@RequestParam("review_id") String review_id ,ModelMap model,ManagementReview managementreview)
{
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
	model.addAttribute("managementreviewform", managementreviewform);
	model.addAttribute("menu","managementreview");
	return "view_review";
}
  //Edit a record 
@RequestMapping(value = "/edit_managementreview", method = RequestMethod.GET)
public String edit_review(@RequestParam("review_id") String review_id,ModelMap model,Principal principal) {
	ManagementReviewForm managementreviewForm= new ManagementReviewForm();
	managementreviewForm.setManagementreviewdetails(managementreviewDAO.edit_managementreview(review_id));
	model.addAttribute("managementreviewForm", managementreviewForm);
    return "edit_managementreview";
}



// For view review

@RequestMapping(value = "/viewmanagementreview", method = RequestMethod.GET)
public String view_review(ModelMap model, Principal principal) {
		ManagementReviewForm managementreviewform= new ManagementReviewForm();
	/*managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());*/	
	model.addAttribute("menu","managementreview");
	model.addAttribute("noofrows",5);     
	managementreviewform.setManagementreviewdetails(managementreviewDAO.getlimitedmanagementreport(1));
	    model.addAttribute("noofpages",(int) Math.ceil(managementreviewDAO.getnoofmanagementreport() * 1.0 / 5));	 
	        model.addAttribute("button","viewall");
	        model.addAttribute("success","false");
	        model.addAttribute("currentpage",1);

	        model.addAttribute("managementreviewform", managementreviewform);

	return "view_managementreview";
}



@RequestMapping(value="/viewmanagementreport_page", method=RequestMethod.GET)
public String viewmanagementreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.getlimitedmanagementreport(page));
 	model.addAttribute("noofpages",(int) Math.ceil(managementreviewDAO.getnoofmanagementreport() * 1.0 / 5));
 	model.addAttribute("managementreviewform",managementreviewform);	
  	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
    model.addAttribute("menu","managementreview");
    model.addAttribute("button","viewall");
    
    return "view_managementreview";
    
	
}


@RequestMapping(value={"/", "/viewallmanagementreport"}, method = RequestMethod.GET)
public String viewallmanagementreport(HttpServletRequest request,ModelMap model, Principal principal ) {
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
	model.addAttribute("managementreviewform", managementreviewform);

  	model.addAttribute("noofrows",5);    
   //narrativereportForm.getNarrativereport().size()
    model.addAttribute("menu","managementreview");
    model.addAttribute("button","close");
      
    	model.addAttribute("menu","managementreview");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
        return "view_managementreview";

}



//Updating a record 
@RequestMapping(value = "/updatemanagementreview", method = RequestMethod.POST)
public String update_review(HttpSession session,@ModelAttribute("ManagementReview") @Valid ManagementReview managementreview,BindingResult result,ModelMap model,Principal principal) {
	
	System.out.println(managementreview.review_id);
	session.setAttribute("managementreview",managementreview);

	
	if(result.hasErrors())
	{
		ManagementReviewForm managementreviewForm= new ManagementReviewForm();
		managementreviewForm.setManagementreviewdetails(managementreviewDAO.edit_managementreview(managementreview.review_id));
		model.addAttribute("managementreviewForm", managementreviewForm);
		return "edit_managementreview";

	}
	else
	{
		
	    	
	if(!managementreviewDAO.update_managementreview(managementreview))
	{
		System.out.println("success");
		session.invalidate();	

	}
	}
	
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
	model.addAttribute("managementreviewform", managementreviewform);


	return "view_managementreview";
}

// Delete a record 
	@RequestMapping(value="/delete_managementreview", method = RequestMethod.GET)
	public String delete_review(@RequestParam("review_id") String review_id,ModelMap model, Principal principal )
	{
   		managementreviewDAO.delete_managementreview(review_id);
		ManagementReviewForm managementreviewform= new ManagementReviewForm();
		managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
		model.addAttribute("managementreviewform", managementreviewform);
		model.addAttribute("menu","review");
		return "view_managementreview";
 	}
	
	//Management Review Report generation
	@RequestMapping(value = "/management_review_report", method = RequestMethod.POST)
	public ModelAndView generatereview_Report(HttpServletRequest request,ModelMap model) 
	{	
			String[] fields={"review_id","management_review_date","attendee_list_with_titles",
			"next_management_review_by","category","assessment","report_link","action_needed",
			"action_detail","action_due_date","responsibility","completion_date","continuous_improvement_project"};	
			String title = null;
			java.util.List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();
		
		 switch(Integer.parseInt(request.getParameter("management_report_type")))
				  {
					  case 0:
						  managementreviewdetails=managementreviewDAO.getmanagement_bytype("management_review_minutes");
						  title="management_review_minutes";
						  break;
					  case 1:
						  managementreviewdetails=managementreviewDAO.getmanagement_bytype("upcoming_management_review_memo");
						  title="upcoming_management_review_memo";
						  break;
					  case 2:
						  managementreviewdetails=managementreviewDAO.getmanagement_bytype("action_list_beween_dates");
						  title="action_list_beween_dates";
						  break;
					  case 3:
						  managementreviewdetails=managementreviewDAO.getmanagement_bytype("past_due_action_list");
						  title="past_due_action_list";
						  break;
						  
					  case 4:
						  managementreviewdetails=managementreviewDAO.getmanagement_bytype("list_of_continuous_improv_projects");
						  title="list_of_continuous_improv_projects";
						  break;
					  default:
						  break;
				  
		}		
		
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
			if(request.getParameterValues("report_field[]")!=null)
			for (@SuppressWarnings("unused") String field : request.getParameterValues("report_field[]")) 
			{
				
				fields=request.getParameterValues("report_type");
				
				ModelAndView modelAndView=new ModelAndView("ManagementReviewDAO","managementreview",managementreviewdetails);
				modelAndView.addObject("fields",request.getParameterValues("report_field[]"));
				title= request.getParameter("report_title");
				modelAndView.addObject("title",title);
				return modelAndView ;
			}
		}
		
		
		ModelAndView modelAndView=new ModelAndView("ManagementReviewDAO","managementreview",managementreviewdetails);
		modelAndView.addObject("fields",fields);
		modelAndView.addObject("title",title);
		 
		return modelAndView ;
		
	}
	
	//for REPORT  
	@RequestMapping(value = { "/managementreview_report" }, method = RequestMethod.POST)
	public String managementreviews_report(HttpServletRequest request,ModelMap model, Principal principal) 
	{
		String type=request.getParameter("type_of_report");
		
		ManagementReviewForm managementreviewForm = new ManagementReviewForm();
		model.addAttribute("managementreviewForm", managementreviewForm);
		model.addAttribute("type",type);		
		model.addAttribute("report_table","yes");
		model.addAttribute("menu","review");
		return "managementreview_report";
	}
	
	//report page request passing
	@RequestMapping(value = { "/managementreview_report" }, method = RequestMethod.GET)
	public String get_managementreview_report(ModelMap model, Principal principal) 
	{
		
		model.addAttribute("report_table","no");
		model.addAttribute("menu","review");
		return "managementreview_report";
	}
	
   

	//search for record in view 

@RequestMapping(value={"/search_review"}, method = RequestMethod.GET)
public String searchmanagementreviews(@RequestParam("review_id") String review_id,@RequestParam("category") String category,@RequestParam("management_review_date") String management_review_date,ModelMap model, Principal principal)
{
	System.out.println(review_id);
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.search_managementreviews(review_id,category,management_review_date));
	model.addAttribute("managementreviewform", managementreviewform);
	return "view_managementreview";

}
	
}
