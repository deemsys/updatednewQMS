<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<script src="resources/js/popover.js"></script>
<script src="resources/js/transition.js"></script>
<form method="post" enctype="multipart/form-data" action="addemployee">
<!-- Modal Ends -->

<!-- Ajax -->
<script type="text/javascript">
$(window).load
(
		function()
		{
		$.ajax
		(
		{
			type : "POST", url: "/QMS_App/ajax_getjob",
        success: function(response)
  	      {
    		   $('#job_titles').html(response);
   		  }
		}
		);
}
		);
</script>


<script type="text/javascript">

function doAjaxPost() {
		// get the form values  
		alert("hit");
		var job_id = $('#add_job_id').val();
		var job_title=$('#add_job_title').val();
		var job_desc=$('#add_job_desc').val();
		/*   var education = $('#education').val();	 */		
		$.ajax({
			type : "POST",
			url : "/QMS_App/ajax_addjob",
			data : "job_id=" + job_id +"&job_title="+job_title+"&job_desc="+job_desc,
			success : function(response) {
				// we have the response  
				$('#job_titles').html(response);
			//document.getElementById("newjob").style.display="none";
				//  $('#education').val(''); */
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
</script>
	<!-- End Ajax -->


<script>
 $(function() {
	 $( "#datepicker" ).datepicker();
        });
 
</script>
  <script>
 $(function() {
	 $( "#datepicker1" ).datepicker();
        });
 
</script>
   <script>
 $(function() {
           $( "#datepicker2" ).datepicker();
         });
 
</script>

   <script>
 $(function() {
	 $( "#datepicker3" ).datepicker();
     
         });
 
</script>











<form method="post" action="addemployee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
  <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu=='employee'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employees'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Employee Report</span>
									
								</a>
							</li>
						
				           </ul>
				          
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Employee</h2><div id="info"></div>
            </div>
            <div class="contentbox">
           
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>ID:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="employee_id" id="inp_id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"><form:errors path="Employee.employee_id"></form:errors></span></td>
                 
                 <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Qualified By:</td>
                 <td valign="top" align="left" class="input_txt"><select	name="qualified_by" class="input_cmbbx1">
                  											<option value="">--Select--</option>
				                  									
                  										<option
															<c:if test="${Employee.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if>
															value="Education">Education</option>
														<option
															<c:if test="${Employee.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if>
															value="Experience">Experience</option>
														<option
															<c:if test="${Employee.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if>
															value="Training">Training</option>
														
															</select><span class="err"><form:errors path="Employee.qualified_by"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="name" class="input_txtbx1" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.name}" />
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Type :</td>
               <td valign="top" align="left" class="input_txt"><select	name="type_of_training" class="input_cmbbx1">
                 	<option value="">--Select--</option>
				                  									
                  										<option
															<c:if test="${Employee.type_of_training eq 'Classroom'}"><c:out value="Selected"/></c:if>
															value="Classroom">Classroom</option>
														<option
															<c:if test="${Employee.type_of_training eq 'Hands on'}"><c:out value="Selected"/></c:if>
															value="Hands on">Hands on</option>
														</select></td>
                
                </tr>
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Job Title:</td>
               	<td valign="top" align="left" class="input_txt" width="70%"><span id="job_titles"></span>&nbsp;&nbsp;
               	<a href="newjob" data-toggle="modal">Add New Job</a><br/><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
   				  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input  type="text" name="trainer" class="input_txtbx1" id="inp_title_of_contact" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.trainer}" /><br/><span class="err"><form:errors path="Employee.trainer"></form:errors></span></td>
                </tr>
                	
				<tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Working as :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  
                  <input type="checkbox" name="process_owner" onclick="toggle1()"  value="yes" id="processowner"/>&nbsp;Process Owner                 
             	  <input type="checkbox" name="document_control" onclick="toggle2()" value="yes" id="documentcontrol"/>&nbsp;Document Control<br/><br/>
                  <input type="checkbox" name="management" value="yes"  onclick="toggle3()" id="managementrep"/>&nbsp;Management Representative<br/>
                  
                  
                  
                  <span class="err"><form:errors path="Employee.name"></form:errors></span>
                  
                  </td>
                 <td valign="middle" align="left" class="input_txt" width="70%"><span class="err">*</span> Training Effectiveness Notes :</td>
                  <td><textarea class="input_txtbx1" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"></textarea><br><span class="err"><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>
                 
                </tr>
		
		
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> <span class="err">*</span>Date Hired:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="date_hired" class="input_txtbx1" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.date_hired}" /><br><span class="err"><form:errors path="Employee.date_hired"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_due_date" class="input_txtbx1" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.training_due_date}" /><br><span class="err"><form:errors path="Employee.training_due_date"></form:errors></span></td>
                
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Attachments:</td>
<%--                   <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="attachments" class="input_txtbx1" id="image" type="file" showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.attachments}" /><br><span class="err"><form:errors path="Employee.attachments"></form:errors></span></td>
 --%>                  <td valign="top" align="left" class="input_txt" width="70%"><input name="attachments" id="image" type="file" /></br><span class="err"></span></td>
                   <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Completion Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_completion_date" class="input_txtbx1" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.training_completion_date}" /><br><span class="err"><form:errors path="Employee.training_completion_date"></form:errors></span></td>
                
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Process:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process" class="input_txtbx1" id="inp_process" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.process}" /><br><span class="err"><form:errors path="Employee.process"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Process Name</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="process_name" class="input_txtbx1" id="inp_process_name" value="${Employee.process_name}" /><br><span class="err"><form:errors path="Employee.process_name"></form:errors></span></td>
                
                </tr>
                
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Document Control:</td>
                 	<td valign="top" align="left" class="input_txt"><input
															type="radio" name="doc_control" value="yes"
															class="input_txt" checked >Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="doc_control" value="no"
															class="input_txt" >No<br><span class="err"><form:errors path="Employee.doc_control"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Management Rep:</td>
                  	<td valign="top" align="left" class="input_txt"><input
															type="radio" name="management_rep" value="yes"
															class="input_txt" checked >Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="management_rep" value="no"
															class="input_txt" >No<span class="err"><form:errors path="Employee.management_rep"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Functions Needs:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="list_of_functions_needes" class="input_txtbx1" id="inp_list_of_functions_needes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.list_of_functions_needes}" /><br><span class="err"><form:errors path="Employee.list_of_functions_needes"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Review Due Date:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx1" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.training_effectiveness_review_due_date}" /><br><span class="err"><form:errors path="Employee.training_effectiveness_review_due_date"></form:errors></span></td>
                
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Documented In</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="documented_in" class="input_txtbx1" id="inp_zipcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.documented_in}" /><br><span class="err"><form:errors path="Employee.documented_in"></form:errors></span></td>
                 </tr>      
                
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add Employee" class="submit_btn1"></td>
                </tr>
              </table>
           
                
              
              <div id="newjob" class="modal hide fade" style="display: none; " >
              <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">�</button>
		<h2>Add New Job</h2>
		</div>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span><label>Job ID:</label></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="add_job_id" id="add_job_id" value="<c:out value="${job_id}"/>"/><c:out value="${job_id }"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Job Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="add_job_title" id="add_job_title" class="input_txtbx1" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.name}" /><br><span class="err"><form:errors path="Employee.name"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Job Description:</td>
               	<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="job_description" id="add_job_desc" class="input_txtbx1" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.job_title}" /><br><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
   
									  </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="button" class="submit_btn1" value="Submit" onclick="doAjaxPost()" data-dismiss="modal" /><form:errors path="Employee.date_hired"></form:errors></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"></td>
                  <td valign="top" align="left" class="input_txt" width="70%"></td>
                </tr>
                </table>
   				</div>
   				</div>
   				</div>
   				</td>
   				</tr>
   				</table>
   				</div>
   				   
</form>
<script>

$(function() {
	var date = $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd' }).val();   
        });
 

 $(function() {
	 var date = $('#datepicker1').datepicker({ dateFormat: 'yy-mm-dd' }).val(); 
        });
 

 $(function() {
	 var date = $('#datepicker2').datepicker({ dateFormat: 'yy-mm-dd' }).val(); 
         });
 
 $(function() {
	 var date = $('#datepicker3').datepicker({ dateFormat: 'yy-mm-dd' }).val(); 
     
         });
 
</script>
<script language="javascript">
function toggle1()
{
 //	var management = document.getElementById('managementrep').checked;
 	//alert(management);
 	//if(management)
 	
 		//alert("You already checked Management Representative");
 	
 	var processown = 	document.getElementById('processowner').checked;
 	var documentcon = 	document.getElementById('documentcontrol').checked;
 	if(processown && documentcon )
 		{
 		
 		document.getElementById('managementrep').disabled = true;
 		
		}
 	else if(processown)
		{
 		
		document.getElementById('managementrep').disabled = true;
		
		}
 	else if(documentcon)
 		{
 		
 		document.getElementById('managementrep').disabled = true;
 		
 		}
 	else{
 		
 		document.getElementById('managementrep').disabled = false;
 	}
}
function toggle2()
{
 	
 	var documentcon = 	document.getElementById('documentcontrol').checked;
 	var processown = 	document.getElementById('processowner').checked;
	if(processown && documentcon )
		{
		document.getElementById('managementrep').disabled = true;
		
	}
	else if(documentcon)
	{
	document.getElementById('managementrep').disabled = true;
	
	}
	else if(processown)
		{
		document.getElementById('managementrep').disabled = true;
		}
 	else
 		document.getElementById('managementrep').disabled = false;
}
function toggle3()
{
 	
 	var management = 	document.getElementById('managementrep').checked;
 
 	if(management)
 		{
 		document.getElementById('processowner').disabled = true;
 		document.getElementById('documentcontrol').disabled = true;
 		
		}
 	else
 		{
 		document.getElementById('processowner').disabled = false;
 		document.getElementById('documentcontrol').disabled = false;
 		
 		}
}


</script>


            
      <jsp:include page="footer.jsp"></jsp:include>
  