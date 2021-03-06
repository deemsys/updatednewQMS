<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
 
 

<form method="post" action="feedback_report">
 <div id="right_content">
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
 <tr>
 <td>
         <div>
  <ul class="horizmenu">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Customers</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewcustomers" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Customers</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addfeedback" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewfeedback" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="feedback_report" class="<c:choose>
								<c:when test="${menu=='customer'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Feedback Report</span>
									
								</a>
							</li>
				             
				            </ul>
  </div>
  </td>
  </tr>
  <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Customer Feedback Report</h2>
            </div>
            <div class="contentbox">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <tr class="row2">
               <td valign="middle" align="left" class="input_txt" width="30%"> Type of Feedback :<!-- </td> -->
                  <!-- <td valign="top" align="left" class="input_txt" width="70%"> -->
                  <select name="type_of_feedback" class="input_cmbbx1">
                  <option value="Complaint"<c:if test="${feedback=='Complaint'}"><c:out value="selected"/></c:if>>Complaint</option>
                  <option value="Suggestion"<c:if test="${feedback=='Suggestion'}"><c:out value="selected"/></c:if>>Suggestion</option>
                  
                  </select>
                  <td></td>
                  </td>
                  <td></td><td></td>
                   </tr>
                  <tr class="row1">
                  <td valign="top" width="30%"><span class="err">*</span>From Date:
                  <input type="text" name="from_date" class="input_txtbx1" id="datepicker"  value="${fromdate}" /></br><span class="err"></span></td>
                   <td width="30%"><span class="err">*</span>To Date:
                  <input type="text" name="to_date" class="input_txtbx1" id="datepicker1" value="${todate}" /></br><span class="err"></span></td>
                  <td  valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Generate" class="submit_btn1" id="button" ></td>                
</tr>
</table>
 <table cellpadding="0" cellspacing="0" border="0" width="100%" id="feedbacktable" styel="display:none" >

							<tr class="title">
								
         						<td valign="top" align="left" width="15%">Date of Feedback</td>
					         	<td valign="top" align="left" width="15%">Type of Feedback</td>
					         	<td valign="top" align="left" width="20%">Feedback recorded by</td>
								<td valign="top" align="left" width="20%">Feedback details</td>
          						<td valign="top" align="left" width="15%">Attachments</td>
          						<td valign="top" align="left" width="20%">Actions</td>
          						
        					</tr>
        					
        					<c:forEach items="${customerFeedbackForm.customerFeedbacks}" var="customerFeedbacks" varStatus="status">
        							
        								<tr class="row2" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								  
        						<td valign="top" align="left"  width="10%">${customerFeedbacks.date_of_feedback}</td>
											<td valign="top" align="left" width="15%">${customerFeedbacks.type_of_feedback}</td>
											<td valign="top" align="left" width="10%">${customerFeedbacks.feedback_recorded_by}</td>
											<td valign="top" align="left" width="10%">${customerFeedbacks.feedback_details }
											<td valign="top" align="left" width="15%"><a href="download_attachment?fid=<c:out value="${customerFeedbacks.feedback_id}"/>">Download</a></td></td>
									    	<td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editfeedback?fid=${customerFeedbacks.feedback_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletefeedbackr?fid=${customerFeedbacks.feedback_id}"/>" onclick="return confirmation()">Remove</a>
											
											</td>
											</tr>
											
        					</c:forEach>
        					                
        					
<tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="right"  colspan="3"><a href="./feedbackexport?type=${type}">Export</a></td>
                </tr>
</table> 

</div>
</div>
</td>
</tr>
</table>
</form>
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
