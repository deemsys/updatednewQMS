<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="employee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu=='employee'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
              <h2>Internal Audits List</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${employeeForm.employees[0]}" var="employees21"></c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="20%">Employee Id: </td>
					<td valign="top" align="left" class="input_txt" width="70%">${employees21.employee_id}<br/><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees21.name}<br/><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Job Title :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees21.job_title}<br/><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Date Hired :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees21.date_hired}<br/><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <%--  <td valign="top" align="left" class="input_txt" width="70%">${employees21.attachments}<br/><span class="err"></span></td>
                 --%>
                 <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%">Upload File:</td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">${employees21.attachment_name}
            
           <td valign="middle" id="softcopy_file_label" style="display:none;" align="right" class="input_txt" width="20%"><span class="err">*</span></td>
               <td valign="top" id="softcopy_file_upload" style="display:none;" align="left" class="input_txt" width="25%"><div ><br/><span class="err"></span></div></td>
     
     
                 </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Process :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees21.process}<br/><span class="err"></span></td>
                  
                  
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Process Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees21.process_name}<br/><span class="err"></span></td>
                  
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Document Control:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.doc_control}<br/><span class="err"></span></td>
               
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Management Rep:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.management_rep}<br/><span class="err"></span></td>
               
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> List of Functions Needes:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.list_of_functions_needes}<br/><span class="err"></span></td>
               
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Documented In:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.documented_in}<br/><span class="err"></span></td>
              
                </tr> 
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Qualified By:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.qualified_by}<br/><span class="err"></span></td>
               
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Type Of Training:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.type_of_training}<br/><span class="err"></span></td>
               
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Trainer:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.trainer}<br/><span class="err"></span></td>
               
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Training Due Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.training_due_date}<br/><span class="err"></span></td>
               
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Training Completion Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.training_completion_date}<br/><span class="err"></span></td>
               
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Training Effectiveness Review Due Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.training_effectiveness_review_due_date}<br/><span class="err"></span></td>
               
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Training Effectiveness Notes:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees21.training_effectiveness_notes}<br/><span class="err"></span></td>
                </tr>

                         </table>
                         
            </div>
            </td>
            </tr>
            </table>
            </div>
            
            </form>
           
            