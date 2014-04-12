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
              <c:set value="${employeeForm.employees[0]}" var="employees"></c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="20%">Employee Id: </td>
					<td valign="top" align="left" class="input_txt" width="70%">${employees.employee_id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees.name}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Job Title :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees.job_title}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Date Hired :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees.date_hired}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%"> Attachments :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees.attachments}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Process :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees.process}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Process Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${employees.process_name}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Document Control:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.doc_control}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Management Rep:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.management_rep}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> List of Functions Needes:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.list_of_functions_needes}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Documented In:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.documented_in}
               </td>
                </tr> 
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Qualified By:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.qualified_by}
               </td>
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Type Of Training:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.type_of_training}
               </td>
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Trainer:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.trainer}
               </td>
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Training Due Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.training_due_date}
               </td>
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Training Completion Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.training_completion_date}
               </td>
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Training Effectiveness Review Due Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.training_effectiveness_review_due_date}
               </td>
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Training Effectiveness Notes:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${employees.training_effectiveness_notes}
               </td>
                </tr>

                         </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
            
            </form>
           
            