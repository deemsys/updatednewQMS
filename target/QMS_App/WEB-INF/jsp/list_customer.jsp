<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="customer">
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
								<c:when test="${menu=='customer'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
              <h2>Internal Audits List</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${customersForm.customers[0]}" var="customers"></c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="20%">Customer Id: </td>
					<td valign="top" align="left" class="input_txt" width="70%">${customers.customer_id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Customer Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${customers.customer_name}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Address :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${customers.address}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">City :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${customers.city}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%"> State :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${customers.state}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Country :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${customers.country}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%">  Zipcode :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${customers.zipcode}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Website:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${customers.website}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Contact Name:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${customers.contact_name}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Title Of Contact:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${customers.title_of_contact}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Telephone:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${customers.telephone}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Fax:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${customers.fax}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Email Address:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${customers.email_address}
               </td>
                </tr>
                
              

                         </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
            
            </form>
           
            