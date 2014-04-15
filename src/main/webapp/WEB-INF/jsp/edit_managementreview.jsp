<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="updatemanagementreview">
  <div id="right_content">
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
    <c:if test="${status=='true'}">
    <tr>
    
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
			<div class="status success">
	            <p class="closestatus"><a title="Close" href="">x</a></p>
	            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
	       	</div>                          
		</td>
		
      </tr></c:if>
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>UPDATE REVIEW</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
      
             <c:set value="${managementreviewForm.managementreviewdetails[0]}" var="managementReviewdetails"></c:set>
             <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Review ID :</td>
				                  <td valign="middle" align="left" class="input_txt" width="70%">
                                  <input type="hidden" name="review_id" value="<c:out value="${managementReviewdetails.review_id}"/>"/><c:out value="${managementReviewdetails.review_id}"/>
				                  	<font color="Red" size="+1"></font>
				                  </td>
				                   
                 <td valign="middle" align="right" class="input_txt" width="30%"> Management Review Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="management_review_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.management_review_date}"></c:out>'> <span class="err"><form:errors path="ManagementReview.management_review_date"></form:errors></span></td>
                </tr>
                
                  <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Attendee List With Titles :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%">
                  <textarea class="input_txtbx1" name="attendee_list_with_titles" id="id_attendee_list_with_titles" ><c:out value="${managementReviewdetails.attendee_list_with_titles}"></c:out></textarea>                  
                  
                  <br/><span class="err"><form:errors path="ManagementReview.attendee_list_with_titles"></form:errors></span></td>
                 
                 <td valign="middle" align="right" class="input_txt" width="30%"> Next Management Review By :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="next_management_review_by" class="input_txtbx" id="id_next_management_Review_By" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.next_management_review_by}"></c:out>'> <span class="err"><form:errors path="ManagementReview.next_management_review_by"></form:errors></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Category :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="category" class="input_txtbx" id="id_category" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.category}"></c:out>'><span class="err"><form:errors path="ManagementReview.category"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">
             	  <td valign="middle" align="left" class="input_txt" width="70%"> </tr>
                   <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Assessment :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="assessment" class="input_txtbx" id="id_assessment" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.assessment}"></c:out>'> <span class="err"><form:errors path="ManagementReview.assessment"></form:errors></span></td>
                  
                 <td valign="middle" align="right" class="input_txt" width="30%"> Report Link :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="report_link" class="input_txtbx" id="id_report_link" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.report_link}"></c:out>'> <span class="err"><form:errors path="ManagementReview.report_link"></form:errors></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Action Needed :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%">
                   <input type="radio" name="action_needed" value="Yes" onchange="toggle3(this.value);"  id="action_needed_yes" >Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="action_needed" value="No" id="action_needed_no" onchange="toggle3(this.value);"  checked>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               </tr>
                   <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Action Detail :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="action_detail" class="input_txtbx" id="id_action_detail" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.action_detail}"></c:out>'> <span class="err"><form:errors path="ManagementReview.action_detail"></form:errors></span></td>
                
                 <td valign="middle" align="right" class="input_txt" width="30%"> Action Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="action_due_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.action_due_date}"></c:out>'><span class="err"><form:errors path="ManagementReview.action_due_date"></form:errors></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Responsibility :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="responsibility" class="input_txtbx" id="id_responsibility" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.responsibility}"></c:out>'> <span class="err"><form:errors path="ManagementReview.responsibility"></form:errors></span></td>
                
                 <td valign="middle" align="right" class="input_txt" width="30%"> Completion Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.completion_date}"></c:out>'> <span class="err"><form:errors path="ManagementReview.completion_date"></form:errors></span></td>
                  </tr>
                   <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Continuous Improvement Project :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="continuous_improvement_project" class="input_txtbx" id="id_continuous_improvenement_project" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.continuous_improvement_project}"></c:out>'> <span class="err"><form:errors path="ManagementReview.continuous_improvement_project"></form:errors></span></td>
                  </tr>
              <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"></td>
                 <td colspan="1" align="right">
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="submit" class="submit_btn1" name="submit" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                 <td valign="middle" align="right" class="input_txt" width="30%">
             	 <td valign="middle" align="left" class="input_txt" width="70%">
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
