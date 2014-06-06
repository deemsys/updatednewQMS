 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<jsp:include page="header.jsp"></jsp:include>
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:215px; margin-top:8px;">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Management Review</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Management Review</span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="managementreview_report" class="<c:choose>
								<c:when test="${menu=='review'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
							</ul>
			</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="maintenance_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>

<form method="post" action="addmanagementreview">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
         <font color="Red" size="+1"></font>
            <div class="headings altheading">
              <h2>Add Management Review</h2>
            </div>
            <div class="contentbox">
            <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2" valign="right">
               
                  <td valign="middle" align="left" class="input_txt" width="20%">&nbsp;Review Id:</td>
	                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="hidden" name="review_id" value="<c:out value="${id}"/>"/><c:out value="${id}"/><br/></td>
      
                  <td valign="middle" align="left" class="input_txt" width="20%">&nbsp;Review Date:</td>
                  <td valign="top" align="left" class="input_txt1" width="10%"><input type="text" name="management_review_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"/><br/><span class="err"><form:errors path="ManagementReview.management_review_date"></form:errors></span></td>
  				    </tr>
    					
                      <tr class="row1"  >
                  <td valign="middle" align="left" class="input_txt" width="20%"> &nbsp;Attendee List With Titles:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="attendee_list_with_titles" class="input_txtbx" id="inp_attendee_list_with_titles" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" /><br/><span class="err"><form:errors path="ManagementReview.attendee_list_with_titles"></form:errors></span></td>                
               	 <td valign="middle" align="left" class="input_txt" width="20%">Next Management Review By :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="next_management_review_by" class="input_txtbx" id="inp_next_management_review_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  /><br/><span class="err"><form:errors path="ManagementReview.next_management_review_by"></form:errors></span></td>                
		
		 </tr>
		  <tr class="row2" >
						         	<td valign="middle" align="left" class="input_txt"width="20%">Category :</td>
						          <td valign="middle" align="left" class="input_txt"width="20%">
				                  		<select name="category" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                      
						                  <option value="audits" >Audits</option>
						                  <option value="corrective and prev actions" >Corrective and Prev Actions</option>
										  <option value="cost of non conformance" >Cost of NonConformance</option>
										  <option  value="customer satisfaction" >Customer Satisfaction</option>
										  <option value="suppliers" >Suppliers</option>
										  <option value="human resources" >Human Resources</option>
										  <option value="product/service conformity" >Product/Service Conformity</option>
										  <option value="previous items" >Previous Items</option>
										  <option value="recommendations for improvement" >Recommendations for Improvement</option>
										  <option value="significant changes to the QMS" >Significant Changes to the QMS</option>	
				                   	</select>
						           		<br/><span class="err"><form:errors path="ManagementReview.category"></form:errors></span>
				                   	</td>	
				                   	 
              
						         </tr> 
           
                <tr class="row1" >
                  <td valign="middle" align="left" class="input_txt" width="20%">Assessment:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="assessment" class="input_txtbx" id="inp_assessment" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  /><br/><span class="err"><form:errors path="ManagementReview.assessment"></form:errors></span></td>                
                  <td valign="middle" align="left" class="input_txt" width="20%">&nbsp; Report Link:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="report_link" class="input_txtbx" id="inp_report_link" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" /><br/><span class="err"><form:errors path="ManagementReview.report_link"></form:errors></span></td>                
                  
                  </tr>
                <tr class="row2">
               <td valign="middle" align="left" class="input_txt" width="50%">Action Needed (Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="70%">
               <input type="radio" name="action_needed" value="Yes" onchange="toggle3(this.value);"  id="action_needed_yes" checked>Yes&nbsp;&nbsp;&nbsp;
               <input type="radio" name="action_needed" value="No" id="action_needed_no" onchange="toggle3(this.value);"  >No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               </td> </tr>
                  
                      <tr class="row1" >
                  <td valign="middle" align="left" class="input_txt" width="20%">Action Detail :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="action_detail" class="input_txtbx" id="inp_action_detail" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" /><br/><span class="err"><form:errors path="ManagementReview.action_detail"></form:errors></span></td>                
                  <td valign="middle" align="left" class="input_txt" width="20%">&nbsp; Action Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="action_due_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  /><br/><span class="err"><form:errors path="ManagementReview.action_due_date"></form:errors></span></td>                
                  
                  </tr>
           	       <tr class="row2" >
                  <td valign="middle" align="left" class="input_txt" width="20%">Responsibility:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="responsibility" class="input_txtbx" id="inp_responsibility" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" /><br/><span class="err"><form:errors path="ManagementReview.responsibility"></form:errors></span></td>                
                  <td valign="middle" align="left" class="input_txt" width="20%">Completion Date:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  /><br/><span class="err"><form:errors path="ManagementReview.completion_date"></form:errors></span></td>                
                  
                  </tr>
                  
                   <tr class ="row1" >
                   
         		   <td valign="middle" align="left" class="input_txt" width="20%">Continuous Improvement Project (Y/N):</td>
                  </td>                
                  	<td valign="top" align="left" class="input_txt" width="20%"><input
															type="radio" name="continuous_improvement_project" value="Yes"
															class="input_txt" checked >Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="continuous_improvement_project" value="No"
															class="input_txt" id="inp_continuous_improvement_project" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" /><span class="err"><form:errors path="ManagementReview.continuous_improvement_project"></form:errors></span>No
															
					</td>															
                  
                   </tr>
           
                 <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%"></td>
                 <td colspan="1" align="left">
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="submit" class="submit_btn1" name="submit" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                  <td valign="middle" align="left" class="input_txt" width="20%">
              <td valign="middle" align="left" class="input_txt" width="20%">
               </tr>
                                
                              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>

</tr>
</table>

   <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
   <script>
 $(function() {
           $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>
   <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
     
         });
 
</script>
      <jsp:include page="footer.jsp"></jsp:include>



 