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

<form method="post" enctype="multipart/form-data" action="updateemployee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="menubuttonsub blue">Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu=='employee'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="menubuttonsub blueactive">View Employees</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employees'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="menubuttonsub blue">Employee Report</span>
									
								</a>
							</li>
						</ul>
						
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Update Employee</h2>
            </div>
            <div class="contentbox">
            <c:set value="${employeeForm.employees[0]}" var="employee"/>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span><label>Employee ID:</label></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="employee_id" value="<c:out value="${employee.employee_id }"/>"/><c:out value="${employee.employee_id }"/><br/><span class="err"></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Qualified By:</td>
                  <td valign="top" align="left" class="input_txt"><select	name="qualified_by" class="input_cmbbx1">
                  					
                  										<option
															<c:if test="${employee.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if>
															value="Education">Education</option>
														<option
															<c:if test="${employee.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if>
															value="Experience">Experience</option>
														<option
															<c:if test="${employee.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if>
															value="Training">Training</option>
														
															</select><span class="err"><form:errors path="Employee.qualified_by"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="name" class="input_txtbx1" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.name }" /><br><span class="err"><form:errors path="Employee.name"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Type:</td>
                  <td valign="top" align="left" class="input_txt"><select	name="type_of_training" class="input_cmbbx1">

				                  									
                  										<option
															<c:if test="${employee.type_of_training eq 'Classroom'}"><c:out value="Selected"/></c:if>
															value="Classroom">Classroom</option>
														<option
															<c:if test="${employee.type_of_training eq 'Hands on'}"><c:out value="Selected"/></c:if>
															value="Hands on">Hands on</option>
														</select></td>
                
                </tr>
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Job Title</td>
               	<td valign="top" align="left" class="input_txt" width="70%">
               	<select class="student_txtbx_height_right_ddl" name="job_title" id="org_id">
							    <option>-- Select Job title --</option>
        				    <option value="${employee.job_title }" selected>${employee.job_title }</option>
			                <c:forEach items="${jobForm.jobs}" var="Jobs" varStatus="status">
        				          <option value="${Jobs.job_title}">${Jobs.job_title}</option>
			                  </c:forEach>
			                 </select>
               	<%-- <input type="text" name="job_title" class="input_txtbx1" id="inp_job_title" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.job_title }" /><br><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td> --%>
               <%--  
               	<td><textarea class="input_txtbx11" id="inp_job_title" name="job_title" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note">
						${employee.job_title}</textarea><br/><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
				 --%><td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="trainer" class="input_txtbx1" id="inp_trainer" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.trainer }" /><br><span class="err"><form:errors path="Employee.trainer"></form:errors></span></td>
                </tr>
                
				<tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Date Hired</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="date_hired" class="input_txtbx1" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.date_hired }" /><br><span class="err"><form:errors path="Employee.date_hired"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Due Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="training_due_date" class="input_txtbx1" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_due_date }" /><br><span class="err"><form:errors path="Employee.training_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Attachments</td>
                  
                  <td valign="top" align="left" class="input_txt" width="70%">
                   <c:out value="${employee.attachment_name}"></c:out><br>
                  <input type="file" name="attachments" class="input_txtbx1" id="id_attachments" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" ><br><span class="err"></span></td>
                   <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Working as :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  
                   <input type="checkbox" name="process_owner" value="yes" onclick="toggle1()" id="processowner"<c:if test="${employee.process_owner=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Process Owner                 
                   <input type="checkbox" name="document_control" value="yes" onclick="toggle2()" id="documentcontrol"<c:if test="${employee.document_control=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Document Control<br/><br/>
                   <input type="checkbox" name="management" value="yes" onclick="toggle3()"  id="managementrep"/<c:if test="${employee.management=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Management Representative<br/>
                  
                  
                   </tr>
                   <tr class="row1">
                   <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Completion Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="training_completion_date" class="input_txtbx1" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_completion_date }" /><br><span class="err"><form:errors path="Employee.training_completion_date"></form:errors></span>
                  </td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Process:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process" class="input_txtbx1" id="inp_process" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.process}" /><br><span class="err"><form:errors path="Employee.process"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Process Name</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_name" class="input_txtbx1" id="inp_process_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.process_name}" /><br><span class="err"><form:errors path="Employee.process_name"></form:errors></span></td>
                
                </tr>
                
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Document Control:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="radio" name="doc_control" value="yes"  class="input_txt"   <c:if test="${employee.doc_control=='yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
				  <input type="radio" name="doc_control" value="no"  class="input_txt"  <c:if test="${employee.doc_control=='no'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				
                  <span class="err"><form:errors path="Employee.doc_control"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Management Rep:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                
                   <input type="radio" name="management_rep" value="yes"  class="input_txt"   <c:if test="${employee.management_rep=='yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
				  <input type="radio" name="management_rep" value="no"  class="input_txt"  <c:if test="${employee.management_rep=='no'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				
                  <span class="err"><form:errors path="Employee.management_rep"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>List of Functions Needs:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="list_of_functions_needes" class="input_txtbx1" id="inp_list_of_functions_needes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.list_of_functions_needes}" /><br><span class="err"><form:errors path="Employee.list_of_functions_needes"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Training Effective Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx1" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_effectiveness_review_due_date }" /><br><span class="err"><form:errors path="Employee.training_effectiveness_review_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Documented In:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="documented_in" class="input_txtbx1" id="inp_documented_in" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.documented_in}" /><br><span class="err"><form:errors path="Employee.documented_in"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Training Effectiveness Notes:</td>
                 <td><textarea class="input_txtbx11" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"><c:out value="${employee.training_effectiveness_notes  }"/> </textarea><br><span class="err"><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>

                 <%--  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_notes" class="input_txtbx1" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_effectiveness_notes }" /><br><span class="err"><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>
                 --%></tr>    
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Update Employee" class="submit_btn1"></td>
                </tr>
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>

<script type="text/javascript">
function toggle2(value){
  
    var e = document.getElementById('location_label');
    var e1 = document.getElementById('file_upload_label');
    var e2=document.getElementById('location_text');
    var e3=document.getElementById('id_file');
 if(value==0)
    {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
  
    }

    
}
</script>
<script>
function change_file(){
	document.getElementById("id_file").style.display="block";
	document.getElementById("file_name").style.display="none";
	
}
</script>

 <script>
   $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker" ).datepicker();
	           
	         });
	 
	 $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker1" ).datepicker();
	         });
	 
	 $(function() {
		 var format="yy-mm-dd";
         $( "#datepicker2" ).datepicker();
       });
	 
	 $(function() {
		 var format="yy-mm-dd";
         $( "#datepicker3" ).datepicker();
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
<script>
	
	window.onload = function(){
		toggle1();toggle2();toggle3();
	}
		</script>
	 <jsp:include page="footer.jsp"></jsp:include>
 