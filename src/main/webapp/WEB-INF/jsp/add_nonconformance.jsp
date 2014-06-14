<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<script src="resources/js/popover.js"></script>
<script src="resources/js/transition.js"></script>
<div id="right_content">
	<form action="add_nonconformance" method="POST" name="update"
		id="update">

		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<tr>
				<td>
					<div>
						<ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Nonconformance</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformance_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Nonconformance Report</span>
									
								</a>
							</li>
						</ul>
					</div></td>
			</tr>
			<tr>
				<!--  <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
		<div class="status success" style="display: none;">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
      <tr> -->
				<td valign="top" align="left">
						<div class="headings altheading">
							<h2>Non Conformance Details</h2>
						</div>
			<div class="contentbox">
			  <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
						
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr class="row1">
							<td valign="middle" align="left" class="input_txt"width="50%">Non-Conformance (NC)ID</td>
							<td valign="top" align="left" class="input_txt"width="50%">
									<input type="hidden" name="id" class="input_txtbx1" value="<c:out value="${id }"/>" /><c:out value="${id}" /> <br/><font color="Red" size="+1"></font></td>
							<td valign="middle" align="left" class="input_txt"width="50%"> External ID </td>
							<td valign="top" align="left" class="input_txt" width="50%">
							<input type="text" class="input_txtbx1" id="inp_external_id" onmouseover="showTooltip('tooltip_id','inp_id3');"onmouseout="hideTooltip('tooltip_id');" name="external_id" value="${nonconformance.external_id}" />
										<font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.external_id"></form:errors></span></td>
		           </tr>
				   <tr class="row2">
								<td valign="top" align="left" class="input_txt"width="50%">Source of NC </td>
						          										<td valign="top" align="left" class="input_txt"width="50%">
				                  									<select name="source_of_nonconformance" class="input_cmbbx1">
				                  										<option value="">--Select--</option>
				                  										
				                  										<option
				                  										<c:if test="${nonconformance.source_of_nonconformance eq 'Internal Audit'}"><c:out value="Selected"/></c:if>
																		value="Internal Audit">Internal Audit</option>
																						                  										<option
				                  										<c:if test="${nonconformance.source_of_nonconformance eq 'Customer Audit'}"><c:out value="Selected"/></c:if>
																		value="Customer Audit">Customer Audit</option>
																						                  										<option
				                  										<c:if test="${nonconformance.source_of_nonconformance eq 'Third Party Audit'}"><c:out value="Selected"/></c:if>
																		value="Third Party Audit">Third Party Audit</option>
																						                  										<option
				                  										<c:if test="${nonconformance.source_of_nonconformance eq 'Incoming Inspection'}"><c:out value="Selected"/></c:if>
																		value="Incoming Inspection">Incoming Inspection</option>
																						                  										<option
				                  										<c:if test="${nonconformance.source_of_nonconformance eq 'Customer Complaint'}"><c:out value="Selected"/></c:if>
																		value="Customer Complaint">Customer Complaint</option>
																		 <c:forEach items="${conformance_SourceForm.conformance_Sources}" var="sources" varStatus="status">
        				       <option value="${sources.source_of_nc}">${sources.source_of_nc}</option>
			                  </c:forEach>
																		</select><span class="err"><form:errors
																					path="Nonconformance.source_of_nonconformance"></form:errors>
																		</span>
						           									
						           					                   	
																		<br/>
																		<font color="Red" size="+1"></font>
																		</td>
																		<td valign="middle" align="left" class="input_txt"width="50%">Product ID </td>
																		<td valign="top" align="left" class="input_txt"width="50%">
																		
																		<select name="product_id" class="input_cmbbx1">
				                  										<option value="">--Select--</option>
																		 <c:forEach items="${productId_NC_Form.productIDNCs}" var="products" varStatus="status">
        				      												 <option value="${products.productid_nc}">${products.productid_nc}</option>
			                 											 </c:forEach>
																	</select>
																		<br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.product_id"></form:errors>
																		</span>
																		</td>

																	</tr>
																	
																	<tr class="row1">
																		<td valign="top" align="left" class="input_txt"width="50%">Type Of NC </td>
						          										<td valign="top" align="left" class="input_txt"width="50%">
				                  									<select name="type_of_nonconformance" class="input_cmbbx1">
				                  										<option value="">--Select--</option>
						                    							<option
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Product Quality'}"><c:out value="Selected"/></c:if>
																		value="Product Quality">Product Quality</option>
																		<option
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Service Quality'}"><c:out value="Selected"/></c:if>
																		value="Service Quality">Service Quality</option>
																		<option
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Late Delivery'}"><c:out value="Selected"/></c:if>
																		value="Late Delivery">Late Delivery</option>
																		<option
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Early Delivery'}"><c:out value="Selected"/></c:if>
																		value="Early Delivery">Early Delivery</option>
															 <c:forEach items="${type_of_NC_Form.type_of_NCs}" var="types" varStatus="status">
        				       <option value="${types.type_of_nc}">${types.type_of_nc}</option>
			                  </c:forEach>
																	</select><span class="err"><form:errors
																					path="Nonconformance.type_of_nonconformance"></form:errors>
																		</span>
																	
																	</td>

																		<td valign="middle" align="left" class="input_txt"width="50%">Quantity Suspect </td>
																		<td valign="top" align="left" class="input_txt"width="50%"><input
																			type="text" class="input_txtbx1"
																			id="inp_quantity_suspect"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="quantity_suspect"
																			value="${nonconformance.quantity_suspect}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.quantity_suspect"></form:errors>
																		</span>
																		</td>
																	</tr>
																	
																	

																	<tr class="row2">
																		<td valign="top" align="left" class="input_txt"width="50%">Nature of NC </td>
																		<td valign="top" align="left" class="input_txt"width="50%">
																		<textarea class="input_txtbx1" id="temporary_action"  name="nature_of_nonconformance" value=""  style="width:75%; height: 89px;" ></textarea>
																			<br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.nature_of_nonconformance"></form:errors>
																		</span>
																		</td>
																	
																		<td valign="middle" align="left" class="input_txt"width="50%">Disposition Required?(Y/N) </td>
																		
																	
																		    <td valign="middle" align="left" class="input_txt"width="50%">
																		    <input type="radio" name="disposition_required"  value="Yes" class="input_txt" checked="true">Yes&nbsp;&nbsp;&nbsp;
																		    <input type="radio" name="disposition_required" value="No" class="input_txt">No
                	          <td valign="middle" align="left" class="input_txt" width="20%"> 
																	</tr>
																	
																	<tr class="row1">
																		

																	
																	
						          										<td valign="middle" align="left" class="input_txt">
				                  									
						                    						</td>
						                    						</tr>
						                    						<tr class="row1">
						                    						
																		<td valign="top" align="left" class="input_txt"width="50%">Date Found </td>
																		<td valign="top" align="left" class="input_txt"width="50%"><input
																			type="text" class="input_txtbx1" id="datepicker"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="date_found" value="${nonconformance.date_found}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.date_found"></form:errors>
																		</span>
																		</td>
																		<td valign="top" align="left" class="input_txt"width="50%">Disposition </td>
						                    						<td>
						                    						<select name="disposition1"id="disid1" class="input_cmbbx1"onchange="show1();">
				                  										<option value="">--Select--</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition1 eq 'Repair'}"><c:out value="Selected"/></c:if>
																		value="Repair">Repair</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition1 eq 'Discard'}"><c:out value="Selected"/></c:if>
																		value="Discard">Discard</option>
																		<option
				                  										<c:if test="${nonconformance.disposition1 eq 'Keep as is'}"><c:out value="Selected"/></c:if>
																		value="Keep as is">Keep as is</option>
						                    						</select>
						                    						<input type="text" name="quality1" id="quality1" style="display:none;"/>
						                    						<br>
						                    						<select name="disposition2" id="disid2" class="input_cmbbx1" onchange="show2();">
				                  										<option value="">--Select--</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition2 eq 'Repair'}"><c:out value="Selected"/></c:if>
																		value="Repair">Repair</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition2 eq 'Discard'}"><c:out value="Selected"/></c:if>
																		value="Discard">Discard</option>
																		<option
				                  										<c:if test="${nonconformance.disposition2 eq 'Keep as is'}"><c:out value="Selected"/></c:if>
																		value="Keep as is">Keep as is</option>
						                    						</select>
						                    						<input type="text" name="quality2" id="quality2" style="display:none;"/>
						                    						<br>
						                    						<select name="disposition3" id="disid3"class="input_cmbbx1" onchange="show3();">
				                  										<option value="">--Select--</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition2 eq 'Repair'}"><c:out value="Selected"/></c:if>
																		value="Repair">Repair</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition3 eq 'Discard'}"><c:out value="Selected"/></c:if>
																		value="Discard">Discard</option>
																		<option
				                  										<c:if test="${nonconformance.disposition3 eq 'Keep as is'}"><c:out value="Selected"/></c:if>
																		value="Keep as is">Keep as is</option>
						                    						</select>
						                    						<input type="text" name="quality3" id="quality3" style="display:none;"/>
						                    						
						                    						<span class="err"><form:errors
																					path="Nonconformance.disposition"></form:errors>
																		</span>
						           									
																		</td>
																	</tr>
																	
																	<tr class="row2">
																		<td valign="top" align="left" class="input_txt"width="50%">Reported By </td>
																		<td valign="top" align="left" class="input_txt"width="50%"><input
																			type="text" class="input_txtbx1" id="inp_reported_by"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="reported_by"
																			value="${nonconformance.reported_by}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.reported_by"></form:errors>
																		</span>
																		</td>
																		
																		<td valign="top" align="left" class="input_txt"width="50%">Disposition Complete Date:</td>
																		<td valign="top" align="left" class="input_txt"width="50%"><input
																			type="text" class="input_txtbx1" id="datepicker1"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="disposition_complete_date"
																			value="${nonconformance.disposition_complete_date}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.disposition_complete_date"></form:errors>
																		</span>
																		</td>
																	</tr>

															
																	<tr class="row1">
								
																	<td valign="top" align="left" class="input_txt"width="50%"> Temporary Action </td>
               														<td valign="top" align="left"width="50%"><textarea class="input_txtbx1" id="temporary_action"  name="temporary_action"  style="width:75%; height: 89px;" >${nonconformance.temporary_action}</textarea><br/><span class="err"></span></td>
         
															
															
																		<td valign="middle" align="left" class="input_txt"width="50%">Disposition Responsibility </td>
																		<td valign="middle" align="left" class="input_txt"width="50%"><input
																			type="text" class="input_txtbx1" id="inp_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="name_of_disposition_responsibility"
																			value="${nonconformance.name_of_disposition_responsibility}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.name_of_disposition_responsibility"></form:errors>
																		</span>
																		</td>
																	</tr>
																	
																	<tr class="row2">
																 	<td valign="middle" align="left" class="input_txt"width="50%"> Corrective Action Required(Y/N)</td>
																	<td valign="middle" align="left" class="input_txt"width="50%">
																	<input type="radio" name="corrective_action_required"  value="Yes" class="input_txt" checked="true">Yes&nbsp;&nbsp;&nbsp;
																	<input type="radio" name="corrective_action_required" value="No" class="input_txt">No
                	          											</td>
																	
																		<td valign="top" align="left" class="input_txt"width="50%">Cost of NC </td>
																		<td valign="top" align="left" class="input_txt"width="50%"><input
																			type="text" class="input_txtbx1" id="inp_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="cost_of_nonconformance"
																			value="${nonconformance.cost_of_nonconformance}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.cost_of_nonconformance"></form:errors>
																		</span>
																		</td>
																	</tr>
															
																												
		 													<tr class="row1">
														<td></td>
														
															
															<td><input type="submit" class="submit_btn1" value="submit" onclick="update.submit()"></td>
														
														 <td><input type="reset" class="submit_btn1" value="reset"></td>
														
														<!-- 
														<td><input type="submit" class="submit_btn2" value="Cancel" onclick="document.history.back()"></td>
														   -->
														
														</tr>
														</table>
														</div>
														</div>
														</td>
														</tr>
														</table>
														</form>
														</div>
														
														
														
														
									
					 <script>
 $(function() {
	 var format="yy-mm-dd";
           $( "#datepicker" ).datepicker();
           
         });
 
 $(function() {
           $( "#datepicker1" ).datepicker();
         });
 

 function resetForm(){
	   document.getElementById("nonConformanceForm").reset();
	 }
 
 
 function toggle2(value){
  // alert("yes");
    var e = document.getElementById('corrective_div');
   
if(value==0)
    {
	e.style.display="none";
	
    }
else
    {
	e.style.display="block";
	
    }
    
}
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
function show1()
{
	var val = document.getElementById('disid1').value;
	
	if(val !="")
		{
		document.getElementById('quality1').style.display='block';
		}
	else
	document.getElementById('quality1').style.display='none';
	}
	
function show2()
{
	var val = document.getElementById('disid2').value;
	
	if(val !="")
		{
		document.getElementById('quality2').style.display='block';
		}
	else
	document.getElementById('quality2').style.display='none';
	}	
	
function show3()
{
	var val = document.getElementById('disid3').value;
	
	if(val !="")
		{
		document.getElementById('quality3').style.display='block';
		}
	else
	document.getElementById('quality3').style.display='none';
	}	
</script> <jsp:include page="footer.jsp"></jsp:include>

