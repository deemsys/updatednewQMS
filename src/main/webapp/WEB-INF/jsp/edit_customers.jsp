<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="updatecustomer">
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
								<c:when test="${menu=='customer'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
              <h2>Add Customer</h2>
            </div>
            <div class="contentbox">
            <c:set value="${customersForm.customers[0]}" var="customers"/>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>ID:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="customer_id" value="<c:out value="${customers.customer_id}"/>"/><c:out value="${customers.customer_id }"/><br/><span class="err"></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%">Website:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="website" class="input_txtbx1" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.website}" /><br><span class="err"><form:errors path="Customers.website"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Customer Name:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="customer_name" class="input_txtbx1" id="inp_customer_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.customer_name }" /><br><span class="err"><form:errors path="Customers.customer_name"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="70%">Contactname</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="contact_name" class="input_txtbx1" id="inp_contact_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.contact_name}"  /><br><span class="err"><form:errors path="Customers.contact_name"></form:errors></span></td>
                </tr>
				<tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">Address:</td>
               		<td><textarea class="input_txtbx1" id="inp_address" name="address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 170px; height: 75px;"><c:out value="${customers.address }"/>	</textarea><br/><span class="err"><form:errors path="Customers.address"></form:errors></span></td>
               	</tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%">City:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="city" class="input_txtbx1" id="inp_city" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.city }" /><br><span class="err"><form:errors path="Customers.city"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">Title of Contact:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="title_of_contact" class="input_txtbx1" id="inp_title_of_contact" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.title_of_contact}" /><br><span class="err"><form:errors path="Customers.title_of_contact"></form:errors></span></td>
                
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">State:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="state" class="input_txtbx1" id="inp_state" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.state }" /><br><span class="err"><form:errors path="Customers.state"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%"> Telephone :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="telephone" class="input_txtbx1" id="inp_telephone" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.telephone}" /><br><span class="err"><form:errors path="Customers.telephone"></form:errors></span></td>

                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%">Country:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="country" class="input_txtbx1" id="inp_country" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.country }" /><br><span class="err"><form:errors path="Customers.country"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%"> Fax :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="fax" class="input_txtbx1" id="inp_fax" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.fax}" /><br><span class="err"><form:errors path="Customers.fax"></form:errors></span></td>

                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">ZipCode:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="zipcode" class="input_txtbx1" id="inp_zipcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.zipcode}" /><br><span class="err"><form:errors path="Customers.zipcode"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">Email:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="email_address" class="input_txtbx1" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.email_address}"/><br><span class="err"><form:errors path="Customers.email_address"></form:errors></span></td>

                </tr>
                 <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="middle" align="center"><input type="submit" value="Update Customer" class="submit_btn1"></td>
                </tr>
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
      <jsp:include page="footer.jsp"></jsp:include>
