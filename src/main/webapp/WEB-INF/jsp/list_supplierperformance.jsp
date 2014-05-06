<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="supplierperformance">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">Add Supplier</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">View Supplier</span>
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='supplier'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">Report Supplier</span>
									
								</a>
							</li>
							</ul>
			
							
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Supplier Performance List</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${supplierPerformanceForm.supplierperformance[0]}" var="supplierperformance"></c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="20%">Supplier  Id: </td>
					<td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.supplier_id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Supplier Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.supplier_name}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Category :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.category}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Address :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.address}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%"> City :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.city}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> State :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.state}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%">  Postal Code :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.postalcode}</td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Country:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.country}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Website:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.website}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Certified To:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.certified_to}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Contact Name:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.contact_name}
               </td>
                </tr> 
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Contact Title:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.contact_title}
               </td>
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Phone:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.phone}
               </td>
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Fax:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.fax}
               </td>
                </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Email Address:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${supplierperformance.email_address}
               </td>
                </tr>

                         </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
            
            </form>
           
            