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

<form method="post" action="updateemployee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu=='employee'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employees'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
              <h2>Add Employee</h2>
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
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="attachments" class="input_txtbx1" id="inp_attachments" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.attachments}" /><br><span class="err"><form:errors path="Employee.attachments"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Completion Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="training_completion_date" class="input_txtbx1" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_completion_date }" /><br><span class="err"><form:errors path="Employee.training_completion_date"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Process:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process" class="input_txtbx1" id="inp_process" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.process}" /><br><span class="err"><form:errors path="Employee.process"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Process Name</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_name" class="input_txtbx1" id="inp_process_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.process_name}" /><br><span class="err"><form:errors path="Employee.process_name"></form:errors></span></td>
                
                </tr>
                
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Document Control:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="doc_control" class="input_txtbx1" id="inp_doc_control" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.doc_control}" /><br><span class="err"><form:errors path="Employee.doc_control"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Management Rep:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="management_rep" class="input_txtbx1" id="inp_management_rep" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.management_rep}" /><br><span class="err"><form:errors path="Employee.management_rep"></form:errors></span></td>
                
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
      <jsp:include page="footer.jsp"></jsp:include>
 