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
				<ul class="horizmenu">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Management Review</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Management Review</span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="managementreview_report" class="<c:choose>
								<c:when test="${menu=='review'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
              <table cellpadding="0" cellspacing="0" border="0" width="50%" colspan="1">
                <tr class="row2" valign="right">
               
                  <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>&nbsp;Review Id:</td>
	                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="hidden" name="review_id" value="<c:out value="${id}"/>"/><c:out value="${id}"/><br/><span class="err"></span></td>
      
                  <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>&nbsp;Review Date:</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="management_review_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.management_review_date}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.management_review_date"></form:errors></span></td>
  				    </tr>
    					
                      <tr class="row1"  >
                  <td valign="middle" align="right" class="input_txt" width="20%"> <span class="err">*</span>&nbsp;Attendee List With Titles:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="attendee_list_with_titles" class="input_txtbx" id="inp_attendee_list_with_titles" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.attendee_list_with_titles}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.attendee_list_with_titles"></form:errors></span></td>                
               	 <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>&nbsp; Next Management Review By :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="next_management_review_by" class="input_txtbx" id="inp_next_management_review_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.next_management_review_by}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.next_management_review_by"></form:errors></span></td>                
		
		 </tr>
		  <tr class="row2" >
						         	<td valign="middle" align="right" class="input_txt"><span class="err">*</span>&nbsp; Category :</td>
						          <td valign="middle" align="left" class="input_txt">
				                  		<select name="category" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                      
						                  <option <c:if test="${managementreviewdetails.category eq 'audits'}"><c:out value="Selected"/></c:if> value="audits" >audits</option>
						                  <option <c:if test="${managementreviewdetails.category eq 'corrective and prev actions'}"><c:out value="Selected"/></c:if> value="corrective and prev actions" >corrective and prev actions</option>
										  <option <c:if test="${managementreviewdetails.category eq 'cost of non conformance'}"><c:out value="Selected"/></c:if> value="cost of non conformance" >cost of non conformance</option>
										  <option <c:if test="${managementreviewdetails.category eq 'customer satisfaction'}"><c:out value="Selected"/></c:if> value="customer satisfaction" >customer satisfaction</option>
										  <option <c:if test="${managementreviewdetails.category eq 'suppliers'}"><c:out value="Selected"/></c:if> value="suppliers" >suppliers</option>
										  <option <c:if test="${managementreviewdetails.category eq 'human resources'}"><c:out value="Selected"/></c:if> value="human resources" >human resources</option>
										  <option <c:if test="${managementreviewdetails.category eq 'product/service conformity'}"><c:out value="Selected"/></c:if> value="product/service conformity" >product/service conformity</option>
										  <option <c:if test="${managementreviewdetails.category eq 'previous items'}"><c:out value="Selected"/></c:if> value="previous items" >previous items</option>
										  <option <c:if test="${managementreviewdetails.category eq 'recommendations for improvement'}"><c:out value="Selected"/></c:if> value="recommendations for improvement" >recommendations for improvement</option>
										  <option <c:if test="${managementreviewdetails.category eq 'significant cchanges to the QMS'}"><c:out value="Selected"/></c:if> value="significant changes to the QMS" >significant changes to the QMS</option>	
				                   	</select>
						           		<br/><span class="err"><form:errors path="ManagementReview.category"></form:errors></span>
				                   	</td>	
				                   	 
              
						         </tr> 
           
                <tr class="row1" >
                  <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>&nbsp; Assessment :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="assessment" class="input_txtbx" id="inp_assessment" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.action_detail}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.assessment"></form:errors></span></td>                
                  <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>&nbsp; Report Link:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="report_link" class="input_txtbx" id="inp_report_link" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.report_link}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.report_link"></form:errors></span></td>                
                  
                  </tr>
                <tr class="row2">
               <td valign="middle" align="left" class="input_txt" width="50%"><span class="err">*</span>Action Needed(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="70%">
               <input type="radio" name="action_needed" value="Yes" onchange="toggle3(this.value);"  id="action_needed_yes" >Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="action_needed" value="No" id="action_needed_no" onchange="toggle3(this.value);"  checked>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               </td> </tr>
                  
                      <tr class="row1" >
                  <td valign="middle" align="right" class="input_txt" width="20%"> <span class="err">*</span>&nbsp;Action Detail :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="action_detail" class="input_txtbx" id="inp_action_detail" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.action_detail}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.action_detail"></form:errors></span></td>                
                  <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>&nbsp; Action Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="action_due_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.action_due_date}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.action_due_date"></form:errors></span></td>                
                  
                  </tr>
           	       <tr class="row2" >
                  <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>&nbsp; Responsibility :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="responsibility" class="input_txtbx" id="inp_responsibility" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.responsibility}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.responsibility"></form:errors></span></td>                
                  <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>&nbsp; Completion Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.completion_date}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.completion_date"></form:errors></span></td>                
                  
                  </tr>
                  
                   <tr class ="row1" >
                   
         		   <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>&nbsp; Continuous Improvement Project :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="continuous_improvement_project" class="input_txtbx" id="inp_continuous_improvement_project" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementreview.continuous_improvement_project}"></c:out>' /><br/><span class="err"><form:errors path="ManagementReview.continuous_improvement_project"></form:errors></span></td>                
                   </tr>
           
                 <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="20%"></td>
                 <td colspan="1" align="right">
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="submit" class="submit_btn1" name="submit" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                  <td valign="middle" align="right" class="input_txt" width="20%">
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



 