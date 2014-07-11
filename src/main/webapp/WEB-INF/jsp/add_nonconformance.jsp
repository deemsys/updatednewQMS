<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" ></script>  
<!-- <script src="resources/js/jquery.min.js"></script> -->
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
									<span>Reports</span>
									
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
							<td valign="top" align="left" class="input_txt" width="25%">Non-Conformance (NC)ID:</td>
							<td valign="top" align="left" class="input_txt" width="25%">
							<input type="hidden" name="id" class="input_txtbx" value="<c:out value="${id }"/>" /><c:out value="${id}" /> <br/><font color="Red" size="+1"></font></td>
							<td valign="top" align="left" class="input_txt" id="external_label" style="display:none;"> External ID </td>
							<td valign="top" align="left" class="input_txt">
							<input type="text" class="input_txtbx" id="external_id" onInput="return validatealphanumeric()"; onmouseover="showTooltip('tooltip_id','inp_id3');"onmouseout="hideTooltip('tooltip_id');" name="external_id" style="display: none;"/>
										<font color="Red" size="+1"></font></td>
				 </tr>
				   <tr class="row2">
		         
							<td valign="top" align="left" class="input_txt">Source of NC: </td>
						    <td valign="top" align="left" class="input_txt">
				            <select name="source_of_nonconformance" class="input_txtbx" id="source_of_nonconformance">
				             	<option value="">--Select--</option>
				             	<option	<c:if test="${nonconformance.source_of_nonconformance eq 'Internal Audit'}"><c:out value="Selected"/></c:if> value="Internal Audit">Internal Audit</option>
								<option 
								<c:if test="${nonconformance.source_of_nonconformance eq 'Customer Audit'}"><c:out value="Selected"/></c:if> value="Customer Audit">Customer Audit</option>
								<option <c:if test="${nonconformance.source_of_nonconformance eq 'Third Party Audit'}"><c:out value="Selected"/></c:if> value="Third Party Audit">Third Party Audit</option>
								<option <c:if test="${nonconformance.source_of_nonconformance eq 'Incoming Inspection'}"><c:out value="Selected"/></c:if> value="Incoming Inspection">Incoming Inspection</option>
								<option <c:if test="${nonconformance.source_of_nonconformance eq 'Customer Complaint'}"><c:out value="Selected"/></c:if> value="Customer Complaint">Customer Complaint</option>
								<c:forEach items="${conformance_SourceForm.conformance_Sources}" var="sources" varStatus="status">
        				       <option value="${sources.source_of_nc}">${sources.source_of_nc}</option>
			                  </c:forEach></select></br>
			                  <span style="color: red;" id="sourcencerr"><form:errors path="Nonconformance.source_of_nonconformance"></form:errors></span>
			                  
			                  
						           									
						           					                   	
																		<br/>
																		<font color="Red" size="+1"></font>
																		</td>
																<td valign="top" align="left" class="input_txt"> Product ID: </td>
					                      	<td valign="top" align="left" class="input_txt">
					                      	<select name="product_id" class="input_txtbx" id="product_id">
				                  										<option value="">--Select--</option>
																		 <c:forEach items="${productId_NC_Form.productIDNCs}" var="products" varStatus="status">
        				      												 <option value="${products.productid_nc}"<c:if test="${products.productid_nc == nonconformance.product_id}"><c:out value="selected"/></c:if>>${products.productid_nc}</option>
			                 											 </c:forEach>
																	</select><br><span class="err" style="color: red;" id="producterr"><form:errors path="Nonconformance.product_id"></form:errors></span></td>
				           
																	</tr>
																	
																	<tr class="row1">
																		<td valign="top" align="left" class="input_txt">Type Of NC: </td>
						          										<td valign="top" align="left" class="input_txt">
				                  									<select name="type_of_nonconformance" class="input_txtbx" id="type_of_nonconformance" onchange="doAjaxPost();" >
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
																	</select><br/> <span style="color: red;" id="typencerr"><form:errors
																					path="Nonconformance.type_of_nonconformance"></form:errors>
																		</span>
																	
																	</td>

																		<td valign="top" align="left" class="input_txt">Quantity Suspect: </td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx"
																			id="quantity"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="quantity_suspect"
																			value="${nonconformance.quantity_suspect}" onInput="return validatename(id);"/><br/>
																			<span id="quantitysuspect" style="color: red;"></span>
																		</font> <span style="color: red;"><form:errors	path="Nonconformance.quantity_suspect"></form:errors>
																		</span>
																		</td>
																	</tr>
																	
																	

																	<tr class="row2">
																		<td valign="top" align="left" class="input_txt">Nature of NC: </td>
																		<td valign="top" align="left" class="input_txt">
																		<textarea class="input_txtbx" id="natureofnc"  name="nature_of_nonconformance" value="${nonconformance.nature_of_nonconformance}" onInput="return validatename(id);" style= "height: 55px;" ></textarea>
																			<br/><span id="nature" style="color: red;"></span>
																		<font color="Red" size="+1"></font> <span style="color: red;"><form:errors path="Nonconformance.nature_of_nonconformance"></form:errors>
																		</span>
																		</td>
																	
																		<td valign="top" align="left" class="input_txt">Disposition Required?(Y/N): </td>
																		
																	
																		    <td valign="top" align="left" class="input_txt">
																		    <input type="radio" name="disposition_required"  value="Yes" class="input_txt" checked="true">Yes&nbsp;&nbsp;&nbsp;
																		    <input type="radio" name="disposition_required" value="No" class="input_txt">No
                	          												<td valign="top" align="left" class="input_txt" width="20%"> 
																	</tr>
																	
																	<tr class="row1">
						                    							<td valign="top" align="left" class="input_txt">Date Found: </td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx" id="datepicker"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="date_found" value="${nonconformance.date_found}" /><br/>
																		<span style="color: red;" id="datepicker2"></span>
																		<span style="color: red;"><form:errors path="Nonconformance.date_found"></form:errors>
																		</span>
																		</td>
																		<td valign="top" align="left" class="input_txt" width="30%">Disposition: </td>
						                    						<td valign="top" align="left" class="input_txt" width="30%">
						                    						<table><tr>
						                    						<td style="vertical-align:top;"><select name="disposition1" id="disid1" class="input_txtbx" onchange="show1();" >
				                  										<option value="">--Select--</option>
				                  										<option <c:if test="${nonconformance.disposition1 eq 'Repair'}"><c:out value="Selected"/></c:if>="" value="Repair">Repair</option>
				                  										<option <c:if test="${nonconformance.disposition1 eq 'Discard'}"><c:out value="Selected"/></c:if>="" value="Discard">Discard</option>
																		<option <c:if test="${nonconformance.disposition1 eq 'Keep as is'}"><c:out value="Selected"/></c:if>="" value="Keep as is">Keep as is</option>
						                    						</select>
						                    						<br/>
						                    						<span style="color: red;"><form:errors path="Nonconformance.disposition1"></form:errors></span>
						                    							</td>
						                    							<td align="left">
						                    						
						                    				<input type="text" name="quality1" id="quality1" class="input_txtbx" style="display:none; width:40px;" onkeypress="return validate(event);" onchange="showbutton1();" />
						                    				</td>
						                    					<td align="left">
						                    					<label class="number_btn1"  id="button1"   style="display:none;" >No's</label>
						                    					</td></tr>
						                    					<tr><td colspan="3"><span style="color: red;" id="qua1"><form:errors path="Nonconformance.quality1"></form:errors></span></td></tr>
						                    					<tr><td colspan="3"><span id="quality1err" style="color: red;"></span></td></tr>
						                    					<tr>
						                    						<td style="vertical-align:top;"><select name="disposition2" id="disid2" class="input_txtbx" onchange="show2();">
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
						                    						</td>
						                    						<td align="left"><input type="text" name="quality2" id="quality2" class="input_txtbx" style="display:none; width:40px;" onkeypress="return validate(event)"; onchange="showbutton2();" />
						                    						<span style="color: red;"><form:errors path="Nonconformance.quality2"></form:errors></span></td>
						                    						<td align="left">
						                    						<label class="number_btn1"  id="button2"   style="display:none;">No's</label>
						                    						</tr>
						                    						<tr><td colspan="3"><span style="color: red;" id="qua2"><form:errors path="Nonconformance.disposition2"></form:errors></span></td></tr>
						                    						<tr><td colspan="3"><span id="quality2err" style="color: red;"></span></td></tr><tr>
						                    						<td style="vertical-align:top;"><select name="disposition3" id="disid3"class="input_txtbx" onchange="show3();">
				                  										<option value="">--Select--</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition3 eq 'Repair'}"><c:out value="Selected"/></c:if>
																		value="Repair">Repair</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition3 eq 'Discard'}"><c:out value="Selected"/></c:if>
																		value="Discard">Discard</option>
																		<option
				                  										<c:if test="${nonconformance.disposition3 eq 'Keep as is'}"><c:out value="Selected"/></c:if>
																		value="Keep as is">Keep as is</option>
						                    						</select><br/>
						                    						<span style="color: red;"><form:errors path="Nonconformance.disposition3"></form:errors></span>
						                    					</td>
						                    					<td  align="left"><input type="text" name="quality3" id="quality3" style="display:none; width:40px;" onchange="showbutton3();" onkeypress="return validate(event)"; />
						                    				 
						                    					</td>
						                    					<td  align="left">
						                    					<label class="number_btn1"  id="button3"   style="display:none;">No's</label>
						                    						</td>
						                    						</tr>
						                    						<tr><td colspan="3"><span style="color: red;" id="qua3"><form:errors path="Nonconformance.quality3"></form:errors></span></td></tr>
						                    						<tr><td colspan="3"><span id="quality3err" style="color: red;"></span></td></tr></table>
						                    						</td>
																	</tr>
																	
																	<tr class="row2">
																		<td valign="top" align="left" class="input_txt">Reported By: </td>
																		<td valign="top" align="left" class="input_txt">
																			<div id="reported_by">
<%-- 																			<select name="reported_by" class="input_txtbx" id="reported_by"> </select></div>
			                												<span style="color: red;"><form:errors path="Nonconformance.reported_by"></form:errors>
																		</span> --%>
																			<input type="hidden" name="group_person" id="group_person" value="${nonconformance.reported_by}" />
				                  											<select name="reported_by" class="input_txtbx" id="reported_by">
																			 <option value="">--Select--</option>
																			 <c:forEach items="${reportedByNCForm.reportedByNCs}" var="reportedByNCs" varStatus="status">
        				       													<option value="${reportedByNCs.group_person}" <c:if test="${reportedByNCs.group_person == nonconformance.reported_by}"><c:out value="selected"/></c:if>>${reportedByNCs.group_person}</option>
			                  												</c:forEach>
			                 												</select>
																			 <br/><span class="err" style="color: red;"><form:errors path="Nonconformance.reported_by"></form:errors></span></td>
				                  	
																		<td valign="top" align="left" class="input_txt">Disposition Complete Date:</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx" id="datepicker1"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="disposition_complete_date"
																			value="${nonconformance.disposition_complete_date}" /><br/>
																		 <span style="color: red;" id="completedate"><form:errors path="Nonconformance.disposition_complete_date"></form:errors>
																		</span>
																		</td>
																	</tr>

															
																	<tr class="row1">
								
																	<td valign="top" align="left" class="input_txt"> Temporary Action: </td>
               														<td valign="top" align="left"><textarea class="input_txtbx" id="tempaction"  name="temporary_action" onInput="return validatename(id);" style="height: 55px;" >${nonconformance.temporary_action}</textarea><br/>
               														<span id="temp" style="color: red;"></span>
               														 <span style="color: red;"><form:errors path="Nonconformance.temporary_action"></form:errors></span></td>
         
															
															
																		<td valign="top" align="left" class="input_txt">Disposition Responsibility: </td>
																		<td valign="top" align="left" class="input_txt">
																			  <select name="name_of_disposition_responsibility" id="name_of_disposition_responsibility" class="input_txtbx">
              																<option value="">--Select--</option>
																			 <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="dispositionname" varStatus="status">
        				       												<option value="${dispositionname.name}"<c:if test="${dispositionname.name == nonconformance.name_of_disposition_responsibility}"><c:out value="selected"/></c:if>>${dispositionname.name}</option>
			                  												</c:forEach>
			                 												</select><br/>
			                 												<span id="responsibilityerror" style="color: red;"></span>
			                 												<form:errors path="Nonconformance.name_of_disposition_responsibility"></form:errors>
				        		
																	</tr>
																	
																	<tr class="row2">
																 	<td valign="top" align="left" class="input_txt"> Corrective Action Required(Y/N):</td>
																	<td valign="top" align="left" class="input_txt">
																	<input type="radio" name="corrective_action_required"  value="Yes" class="input_txt" checked="true">Yes&nbsp;&nbsp;&nbsp;
																	<input type="radio" name="corrective_action_required" value="No" class="input_txt">No
                	          											</td>
																	
																		<td valign="top" align="left" class="input_txt">Cost of NC: </td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx" id="costofnc"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="cost_of_nonconformance"
																			value="${nonconformance.cost_of_nonconformance}" onkeypress="return validate(event)"; /><br/>
																		<span id="cost" style="color: red;"></span>
																		 <span style="color: red;"><form:errors path="Nonconformance.cost_of_nonconformance"></form:errors>
																		</span>
																		</td>
																	</tr>
															
												
																				 <tr class="row1">
               <td></td><td></td>
               </tr>
                 <tr class="row1">
                  <td><br>
                  <td valign="top" align="center"><input type="submit" class="submit_btn1" value="submit" onclick="return validation();"></td>
                </tr>
												
														<!-- <td><input type="submit" class="submit_btn1" value="submit" onclick="return validation();"></td> -->
														
														 <!-- <td><input type="reset" class="submit_btn1" value="reset"></td>
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
														
														
														
<!-- 	<script>
   function doAjaxPost() {
	 //alert("hi");
	document.getElementById('type_of_nonconformance').style.display="block";
	 document.getElementById("reported_by").style.display="inline";
	var filer_value = $('#type_of_nonconformance').val();
	//alert("hello");
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getaddtypenc",
		data : "type_of_nonconformance=" + filer_value,
		success : function(response) {
		/* alert("response"+response); */
		$('#reported_by').html(response);
			},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
 </script>
  -->
 <script>
/*  $(window).load(function()
		 { */
   function doAjaxPost() {
	 
	document.getElementById('type_of_nonconformance').style.display="block";
	 document.getElementById("reported_by").style.display="inline";
	var filer_value = $('#type_of_nonconformance').val();
	var group_person=$('#group_person').val();
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_gettypenc",
		data : "type_of_nonconformance=" + filer_value+"&group_person="+group_person,
		success : function(response) {
	
		$('#reported_by').html(response);
			},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}

</script> 

<script>
function showDiv() {

        	
        	var element1 = document.getElementById('disposition').value;
        	var element2 = document.getElementById('quality1').value;
            if (element1 == '') {
            	document.getElementById('quality1').style.display="none";
            	}
            	else
            	{
            	document.getElementById('quality1').style.display="block";
            	}
                
            }
           
</script>

<script>
function validation()
{
	//update.submit();
	var error="";
   	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
   	var datefound = document.getElementById('datepicker').value;
	var complete = document.getElementById('datepicker1').value;
	var quantity = document.getElementById('quantity').value;
	var costnc = document.getElementById('costofnc').value;
	var action = document.getElementById('tempaction').value;
	var naturenc = document.getElementById('natureofnc').value;
	var quality1 = document.getElementById('quality1').value;
	var quality2 = document.getElementById('quality2').value;
	var quality3 = document.getElementById('quality3').value;
	var spl =  /^[A-Za-z0-9]*$/;
	var typenc = document.getElementById('type_of_nonconformance').value;
	var sourcenc = document.getElementById('source_of_nonconformance').value;
	var product = document.getElementById('product_id').value;
	var responsibility = document.getElementById('name_of_disposition_responsibility').value;
 	
	if(datefound == "")
	 {
	 document.getElementById("datepicker2").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datefound.match(date))
	 {
	 document.getElementById("datepicker2").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker2").innerHTML="Invalid Date";
	 error="true";
	 }


	if(complete == "")
	 {
	 document.getElementById("completedate").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(complete.match(date))
	 {
	 document.getElementById("completedate").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("completedate").innerHTML="Invalid Date";
	 error="true";
	 }
  	if(typenc =="")
	 {

		 document.getElementById("typencerr").innerHTML="Required Field Should not be Blank";
		 error="true";
	 } 
  	else
  		{
		document.getElementById("typencerr").innerHTML="";
  		}
		if(sourcenc =="")
		 {
		
			 document.getElementById("sourcencerr").innerHTML="Required Field Should not be Blank";
			 error="true";
		 }
		else{
			document.getElementById("sourcencerr").innerHTML="";
		}
			if(product =="")
			 {
			
				 document.getElementById("producterr").innerHTML="Required Field Should not be Blank";
				 error="true";
			 }
			else
				{
				document.getElementById("producterr").innerHTML="";
				}

  	
  	if(quantity =="")
	 {
	
		 document.getElementById("quantitysuspect").innerHTML="Required Field Should not be Blank";
		 error="true";
	 } 
		
  	else if(document.getElementById("quantity").value.length<4 || document.getElementById("quantity").value.length>=32)
	    {
	    	
	    	document.getElementById("quantitysuspect").innerHTML="Should be of length 4 to 32";
	    	 error="true";
	    } 
	
	
	    else if(document.getElementById("quantity").value.substring(0,1)==" ")
		{
		document.getElementById("quantitysuspect").innerHTML="Initial space not allowed";
		 error="true";
		}
	    else
	    	{
	    	document.getElementById("quantitysuspect").innerHTML="";
	    	}
	
	 	if(costnc =="")
		 {
		
			 document.getElementById("cost").innerHTML="Required Field Should not be Blank";
			 error="true";
		 } 
			
	 	else if(document.getElementById("costofnc").value.length<4 || document.getElementById("costofnc").value.length>=32)
		    {
		    	
		    	document.getElementById("cost").innerHTML="Should be of length 4 to 32";
		    	 error="true";
		    } 
		
		
	 	else if(document.getElementById("costofnc").value.substring(0,1)==" ")
			{
			document.getElementById("cost").innerHTML="Initial space not allowed";
			 error="true";
			}
	 	else
	 		{
	 		document.getElementById("cost").innerHTML="";
	 		}
		 	
		
		 	if(naturenc =="")
			 {
			
				 document.getElementById("nature").innerHTML="Required Field Should not be Blank";
				 error="true";
			 } 
				
		 	else if(document.getElementById("natureofnc").value.length<4 || document.getElementById("natureofnc").value.length>=32)
			    {
			    	
			    	document.getElementById("nature").innerHTML="Should be of length 4 to 32";
			    	 error="true";
			    } 
		 	else{
		 		document.getElementById("nature").innerHTML="";	
		 	}
		 	
 	
			 	if(action =="")
				 {
				
					 document.getElementById("temp").innerHTML="Required Field Should not be Blank";
					 error="true";
				 } 
					
					else if(document.getElementById("tempaction").value.length<4 || document.getElementById("tempaction").value.length>=32)
				    {
				    	
				    	document.getElementById("temp").innerHTML="Should be of length 4 to 32";
				    	 error="true";
				    } 
				
				
					else if(document.getElementById("tempaction").value.substring(0,1)==" ")
					{
					document.getElementById("temp").innerHTML="Initial space not allowed";
					 error="true";
					}
					else
						{
						document.getElementById("temp").innerHTML="";
						}
			 	
			 	if(responsibility =="")
				 {
				
					 document.getElementById("responsibilityerror").innerHTML="Required Field Should not be Blank";
					 error="true";
				 } 
					
					else if(document.getElementById("name_of_disposition_responsibility").value.length<4 || document.getElementById("name_of_disposition_responsibility").value.length>=32)
				    {
				    	
				    	document.getElementById("responsibilityerror").innerHTML="Should be of length 4 to 32";
				    	 error="true";
				    } 
				
				
					else if(document.getElementById("name_of_disposition_responsibility").value.substring(0,1)==" ")
					{
					document.getElementById("responsibilityerror").innerHTML="Initial space not allowed";
					 error="true";
					}
					else
						{
						document.getElementById("responsibilityerror").innerHTML="";
						}		
				 	
				 	if(quality1 =="")
					 {
					
						 document.getElementById("qua1").innerHTML="Required Field Should not be Blank";
						 error="true";
					 } 
						
					    
						else if(document.getElementById("quality1").value.substring(0,1)==" ")
						{
						document.getElementById("qua1").innerHTML="Initial space not allowed";
						 error="true";
						}
						else
							{
							document.getElementById("qua1").innerHTML="";}
							
						 if(quality2 =="")
						 {
						
							 document.getElementById("qua2").innerHTML="Required Field Should not be Blank";
							 error="true";
						 } 
						 else
							 {
								document.getElementById("qua2").innerHTML="";
							 }
							 
						 	if(quality3 =="")
							 {
							
								 document.getElementById("qua3").innerHTML="Required Field Should not be Blank";
								 return false;
							 } 
						 	else{
						 	document.getElementById("qua3").innerHTML="";
								}	

								  if(error == "true")
									{
									return false;
									}
}
</script>

<script>
  $(function() {
	$("#quantity").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

</script>
<script>
  $(function() {
	$("#costofnc").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

</script>
<script>
  $(function() {
	$("#natureofnc").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

</script>
<script>
  $(function() {
	$("#tempaction").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

</script>

<script>
function validatename(id)
{
	var textInput = document.getElementById(id).value;
	textInput = textInput.replace(/[^A-Za-z ]/g, "");
	document.getElementById(id).value = textInput;
}
</script>
<script>
/* // Numbers only validation for disposition field */
       function validate(event) {
          
           var regex = new RegExp("^[0-9]+$");
           var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
           if (!regex.test(key)) {
             // document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
               event.preventDefault();
               return false;
           }
       }
</script>
<script>
// alphanumeric validation for product id field
function validatealphanumeric(){

	var textInput = document.getElementById("external_id").value;
    textInput = textInput.replace(/[^A-Z0-9]/g, "");
    document.getElementById("external_id").value = textInput;
}
</script>
<script>
function validate(event) {
	   
    var regex = new RegExp("^[0-9.]+$");
    var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
      // document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
        event.preventDefault();
        return false;
    }
}  

</script>

    


<script type="text/javascript">     
$(document).ready(function() {     
$('#source_of_nonconformance').change(function(){     
	//if(($('#source_of_nonconformance').val() == 'Customer Audit') && ($('#source_of_nonconformance').val() == 'Third Party Audit') && ($('#source_of_nonconformance').val() == 'Customer Complaint'))
	if($('#source_of_nonconformance').val() === 'Customer Audit')     
   {     
   $('#external_id').show();  
   $('#external_label').show();
   }     
else if($('#source_of_nonconformance').val() === 'Third Party Audit')
	{
	$('#external_id').show();  
	$('#external_label').show();
	}
else if($('#source_of_nonconformance').val() === 'Customer Complaint')
{
$('#external_id').show();  
$('#external_label').show();
}
else    
   {     
   $('#external_id').hide();
   $('#external_label').hide();
   }     
});     
});     
</script>     

<script>
 $(function() {
	 var format="yy-mm-dd";
           $( "#datepicker" ).datepicker();
         });
 
 $(function() {
	 var format="yy-mm-dd";
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
	document.getElementById('button1').style.display='none';
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
	document.getElementById('button2').style.display='none';
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
	document.getElementById('button3').style.display='none';
	}	
</script>
<script>
function showbutton1()
{
	var val = document.getElementById("quality1").value;
	var numbers = /^[-+]?[0-9]+$/; 
	if(val!="" && val.match(numbers))
		{
			document.getElementById("button1").style.display = 'block';
		}
	else
		{
			document.getElementById("button1").style.display='none';
		}
}

function showbutton2()
{
	var val = document.getElementById("quality2").value;
	var numbers = /^[-+]?[0-9]+$/; 
if(val!="" && val.match(numbers))
	{
	document.getElementById("button2").style.display = 'block';
	}
else
	{
	document.getElementById("button2").style.display='none';
	}
	}
function showbutton3()
{
	var val = document.getElementById("quality3").value;
	var numbers = /^[-+]?[0-9]+$/; 
if(val!="" && val.match(numbers))
	{
	document.getElementById("button3").style.display = 'block';
	}
else
	{
	document.getElementById("button3").style.display='none';
	}
	}
</script>
<script>
 $(window).load(function(){
	 
	  $("#quality1").keyup(function() {
			
			 $("#quality1err").html(''); 
			var intRegex = /^\d+$/;
			if(intRegex.test($(this).val())||$(this).val()=='') 
			{
				var $in = $(this).val();		 
			}
			else if($(this).val()!='')
				{
				
				$("#quality1err").html('enter a number!!!!');
				}
		}).keydown(function() {
		    oldValue = $(this).val();
		})
 $("#quality2").keyup(function() {
			
			 $("#quality2err").html(''); 
			
			var intRegex = /^\d+$/;
			if(intRegex.test($(this).val())||$(this).val()=='') 
			{
				var $in = $(this).val();		 
			}
			else if($(this).val()!='')
				{
				
				$("#quality2err").html(' enter a number!!!!');
				}
		}).keydown(function() {
		    oldValue = $(this).val();
		})
 $("#quality3").keyup(function() {
			
			 $("#quality3err").html(''); 
			var intRegex = /^\d+$/;
			if(intRegex.test($(this).val())||$(this).val()=='') 
			{
				var $in = $(this).val();		 
			}
			else if($(this).val()!='')
				{
				
				$("#quality3err").html('enter a number!!!!');
				}
		}).keydown(function() {
		    oldValue = $(this).val();
		})

});

</script>

 <jsp:include page="footer.jsp"></jsp:include>

 