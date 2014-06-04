<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="qms.model.ManagementReview"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<form method="post" action="updatemanagementreview">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
    	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Management Review</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
                  <td valign="middle" align="left" class="input_txt" width="70%">
                  <select name="category" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                      
						                  <option <c:if test="${managementReviewdetails.category eq 'audits'}"><c:out value="Selected"/></c:if> value="audits" >audits</option>
						                  <option <c:if test="${managementReviewdetails.category eq 'corrective and prev actions'}"><c:out value="Selected"/></c:if> value="corrective and prev actions" >corrective and prev actions</option>
										  <option <c:if test="${managementReviewdetails.category eq 'cost of non conformance'}"><c:out value="Selected"/></c:if> value="cost of non conformance" >cost of non conformance</option>
										  <option <c:if test="${managementReviewdetails.category eq 'customer satisfaction'}"><c:out value="Selected"/></c:if> value="customer satisfaction" >customer satisfaction</option>
										  <option <c:if test="${managementReviewdetails.category eq 'suppliers'}"><c:out value="Selected"/></c:if> value="suppliers" >suppliers</option>
										  <option <c:if test="${managementReviewdetails.category eq 'human resources'}"><c:out value="Selected"/></c:if> value="human resources" >human resources</option>
										  <option <c:if test="${managementReviewdetails.category eq 'product/service conformity'}"><c:out value="Selected"/></c:if> value="product/service conformity" >product/service conformity</option>
										  <option <c:if test="${managementReviewdetails.category eq 'previous items'}"><c:out value="Selected"/></c:if> value="previous items" >previous items</option>
										  <option <c:if test="${managementReviewdetails.category eq 'recommendations for improvement'}"><c:out value="Selected"/></c:if> value="recommendations for improvement" >recommendations for improvement</option>
										  <option <c:if test="${managementReviewdetails.category eq 'significant cchanges to the QMS'}"><c:out value="Selected"/></c:if> value="significant changes to the QMS" >significant changes to the QMS</option>	
				                   	</select>
						           		<br/><span class="err"><form:errors path="ManagementReview.category"></form:errors></span>
				                   	</td>	
                  
                  
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
                   <input type="radio" name="action_needed" value="Yes"  id="action_needed_yes" <c:if test="${managementReviewdetails.action_needed=='Yes'}"><c:out value="checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
                   <input type="radio" name="action_needed" value="No" id="action_needed_no" <c:if test="${managementReviewdetails.action_needed=='No'}"><c:out value="checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
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
