<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="qms.model.SupplierPerformance"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<STYLE type="text/css">
  P#mypar {font-style:calibri;
  line-height:18px;}
  
  </STYLE>
 </head>
 <body>
<form method="post" action="add_supplierperformance">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
         <div>
  <ul class="horizmenu">
						
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Supplier</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Supplier</span>
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='supplier'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Report Supplier</span>
									
								</a>
							</li>
				            
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add SupplierPerformance</h2>
              
            </div>
            <div class="contentbox">
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
   				 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>ID:</td>
                <%--   <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="supplier_id" id="inp_id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"><form:errors path="supplierperformance.supplier_id"></form:errors></span></td>
            	 --%><td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="supplier_id" value="<c:out value="${id}"/>"/><c:out value="${id}"/><br/><span class="err"></span><form:errors path="supplierperformance.supplier_id"></form:errors></td>
                
            	 <td valign="middle" align="right" class="input_txt" width="30%">Website:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="website" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.website}" /><br/><span class="err"><form:errors path="supplierperformance.website"></form:errors></span></td>
                </tr>
            
             
                  <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="supplier_name" class="input_txtbx" id="inp_supplier_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.supplier_name}" /><br/><span class="err"><form:errors path="supplierperformance.supplier_name"></form:errors></span></td>
           		  <td valign="middle" align="right" class="input_txt" width="70%">Certified</td>
				<td valign="top" align="left" class="input_txt"><select	name="certified_to" class="input_cmbbx1">
															<option value="">--Select--</option>			
                  										<option
															<c:if test="${supplierperformance.certified_to eq 'ISO 9001'}"><c:out value="Selected"/></c:if>
															value="ISO 9001">ISO 9001</option>
														<option
															<c:if test="${supplierperformance.certified_to eq 'ISO 9002'}"><c:out value="Selected"/></c:if>
															value="ISO 9002">ISO 9002</option>
															</select></td>
                                  
      
                </tr>
		        <tr class="row2">
				  <td valign="middle" align="right" class="input_txt" width="30%">Category :</td>
				<td valign="top" align="left" class="input_txt"><select	name="category" class="input_cmbbx1">
					<option value="">--Select--</option>
				                  									
                  										<option
															<c:if test="${supplierperformance.category eq 'Critical'}"><c:out value="Selected"/></c:if>
															value="Critical">Critical</option>
														<option
															<c:if test="${supplierperformance.category eq 'Non Critical'}"><c:out value="Selected"/></c:if>
															value="Non Critical">Non Critical</option>
															</select></td>
                                  
                  <td valign="middle" align="right" class="input_txt" width="30%">ContactName</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="contact_name" class="input_txtbx" id="inp_contact_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.contact_name}" /><br/><span class="err"><form:errors path="supplierperformance.contact_name"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Address :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="address" class="input_txtbx" id="inp_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.address}" /><br/><span class="err"><form:errors path="supplierperformance.address"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%"> Title :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="contact_title" class="input_txtbx" id="inp_contact_title" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.contact_title}" /><br/><span class="err"><form:errors path="supplierperformance.contact_title"></form:errors></span></td>

                </tr>
				<tr class="row2">
				  <td valign="middle" align="right" class="input_txt" width="30%"> City :</td>
				  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="city" class="input_txtbx" id="inp_city" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.city}" /><br/><span class="err"><form:errors path="supplierperformance.city"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%"> Phone :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="phone" class="input_txtbx" id="inp_phone" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.phone}" /><br/><span class="err"><form:errors path="supplierperformance.phone"></form:errors></span></td>

                </tr>
              	<tr class="row1">
              	<td valign="middle" align="right" class="input_txt" width="30%"> State :</td>
              	<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="state" class="input_txtbx" id="inp_state" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.state}" /><br/><span class="err"><form:errors path="supplierperformance.state"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%"> Fax :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="fax" class="input_txtbx" id="inp_fax" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.fax}" /><br/><span class="err"><form:errors path="supplierperformance.fax"></form:errors></span></td>

              	</tr>
                <tr class="row2">
				<td valign="middle" align="right" class="input_txt" width="30%">PostalCode</td>
				<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="postalcode" class="input_txtbx" id="inp_postalcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.postalcode}" /><br/><span class="err"><form:errors path="supplierperformance.postalcode"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%"> Email:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="email_address" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.email_address}" /><br/><span class="err"><form:errors path="supplierperformance.email_address"></form:errors></span></td>

                </tr>
				<tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%">Country:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="country" class="input_txtbx" id="inp_country" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.country}" /><br/><span class="err"><form:errors path="supplierperformance.country"></form:errors></span></td>
                </tr>
               
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add Supplier" class="submit_btn1"></td>
                </tr>
              </table>

</div>
</div>
</td>
</tr>
</table>
</div>

  </form>
</body>
</html>
      <jsp:include page="footer.jsp"></jsp:include>
