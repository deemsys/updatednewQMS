<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="managementreviewdetails">
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
	<tr>

        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>View Management Review </h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${managementreviewform.managementreviewdetails[0]}" var="managementreviewdetails"> </c:set>
               <tr class="row2">
			    <td valign="middle" align="left" class="input_txt" width="20%">Review Id: </td>
			    <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.review_id}
			    <br/><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Management Review Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.management_review_date}
                  <br/><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Attendee List With TITLES :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.attendee_list_with_titles}
                  <br/><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Next Management Review By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.next_management_review_by}
                  <br/><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Category :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.category}
                  <br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Assessment :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.assessment}
 			        <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Report_link :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.report_link}
                  <br/><span class="err"></span></td>
                  </tr>
                  <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Action Needed:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.action_needed}
               </td></td>
                </tr>
             
               <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%">Action Detail :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.action_detail}
                   <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Action Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.action_due_date}
                  <br/><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Responsibility :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.responsibility}
                  <br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
              
               <td valign="middle" align="left" class="input_txt">Completion Date:</td>
               <td valign="top" align="left"  colspan="3">${managementreviewdetails.completion_date}
               <br/><span class="err"></span></td>
            </tr>
            <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Continuous Improvement Project :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${managementreviewdetails.continuous_improvement_project}
                  <br/><span class="err"></span></td>
                </tr>
                
            </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
          
           
          
            </form>
            <!--  <script type="text/javascript">
function toggle3(value){
     
       var e = document.getElementById('child_table');
      // var e1=document.getElementById('employee');
if(value==0)
       {
	e.style.display="none";
       }
else
       {
	e.style.display="block";
       }
       
}
</script> -->
            