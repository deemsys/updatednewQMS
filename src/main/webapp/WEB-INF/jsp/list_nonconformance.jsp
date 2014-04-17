<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="nonconformance">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Nonconformance</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformance_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Nonconformance Report</span>
									
								</a>
							</li>
									</ul>
			
							
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Nonconformance List</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${nonConformanceForm.nonconformance[0]}" var="nonconformance"></c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="20%">Id: </td>
					<td valign="top" align="left" class="input_txt" width="70%">${nonconformance.id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Source of Nonconformance:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.source_of_nonconformance}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">External Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.external_id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Type Of Nonconformance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.type_of_nonconformance}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%"> Product Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.product_id}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Quantity Suspect :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.quantity_suspect}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Date Found :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.date_found}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Reported By:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.reported_by}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Temporary Action:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.temporary_action}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Corrective Action Required(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.corrective_action_required}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Disposition Required(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.disposition_required}
               </td>
                </tr>
                  <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Disposition:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.disposition}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Disposition Complete Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.disposition_complete_date}
               </td>
                </tr>
                  <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Name of Disposition Responsibility:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.name_of_disposition_responsibility}
               </td>
                </tr>
                  <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Cost of Nonconformance:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${nonconformance.cost_of_nonconformance}
               </td>
                </tr>
              
              
              
              

                         </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
            
            </form>
           
            