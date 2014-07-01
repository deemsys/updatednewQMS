<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

 <script>
 $(function() {
           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>
   <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
     
         });
 
</script>

<div id="right_content">
<form action="update_nonconformance" method="POST" name="update" id="update">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
     <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
  </div>
     </td>
     </tr>
     
      <tr>
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	              <h2>Non Conformance Details</h2>
	            </div>
            <div class="contentbox">
            <c:set value="${nonConformanceForm.nonconformance[0]}" var="nonconformance"></c:set>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">

  				

                        		<tr class="row1">
				                  <td valign="middle" align="left" class="input_txt"> Non-Conformance(ID) </td>
				                  <td valign="top" align="left" class="input_txt">
				                 
				                 <input type="hidden" name="id" value="<c:out value="${nonconformance.id}"/>"/><c:out value="${nonconformance.id}"/>
				                   	<br><font color="Red" size="+1"></font>
				                  </td>
				                  
				                	<td valign="middle" align="left" class="input_txt" id="external_label" style="display:none;"> External ID </td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" value="<c:out value="${nonconformance.external_id}"/>"  class="input_txtbx1" style="display:none;" id="external_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="external_id" /><br></td>
				                </tr>
				                

								 <tr class="row2">
						         	<td valign="middle" align="left" class="input_txt"> Source of NC </td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="source_of_nonconformance" class="input_cmbbx1" id="source_of_nonconformance" onclick="showDiv()">
						                    <option <c:if test="${nonconformance.source_of_nonconformance eq 'Internal Audit'}"><c:out value="Selected"/></c:if> value="Internal Audit" >Internal Audit</option>
											<option <c:if test="${nonconformance.source_of_nonconformance eq 'Customer Audit'}"><c:out value="Selected"/></c:if> value="Customer Audit">Customer Audit</option>
											<option  <c:if test="${nonconformance.source_of_nonconformance eq 'Third Party Audit'}"><c:out value="Selected"/></c:if> value="Third Party Audit">Third Party Audit</option>
											<option <c:if test="${nonconformance.source_of_nonconformance eq 'Incoming Inspection'}"><c:out value="Selected"/></c:if> value="Incoming Inspection">Incoming Inspection</option>
				                   			<option <c:if test="${nonconformance.source_of_nonconformance eq 'Customer Complaint'}"><c:out value="Selected"/></c:if> value="Customer Complaint">Customer Complaint</option>
				                   	<c:forEach items="${conformance_SourceForm.conformance_Sources}" var="sources" varStatus="status">
        				       <option value="${sources.source_of_nc}"<c:if test="${sources.source_of_nc == nonconformance.source_of_nonconformance}"><c:out value="selected"/></c:if>>${sources.source_of_nc}</option>
			                  </c:forEach>
				                   		</select>
				                   		<br><span style="color:red;"><form:errors path="Nonconformance.source_of_nonconformance"></form:errors></td>
						         	
					            	<td valign="middle" align="left" class="input_txt"> Product ID </td>
					                      	<td valign="top" align="left" class="input_txt">
					                      	<select name="product_id" class="input_cmbbx1">
				                  										<option value="">--Select--</option>
																		 <c:forEach items="${productId_NC_Form.productIDNCs}" var="products" varStatus="status">
        				      												 <option value="${products.productid_nc}"<c:if test="${products.productid_nc == nonconformance.product_id}"><c:out value="selected"/></c:if>>${products.productid_nc}</option>
			                 											 </c:forEach>
																	</select><br><span class="err"><form:errors path="Nonconformance.product_id"></form:errors></span></td>
				           
					                  </tr>
								 
								<tr class="row1">
				                  	<td valign="middle" align="left" class="input_txt"> Type of NC </td>
				                  	<td valign="top" align="left" class="input_txt">
				                  		<select name="type_of_nonconformance" class="input_cmbbx1" id="type_of_nonconformance" onchange="doAjaxPost();">
						                    <option <c:if test="${nonconformance.type_of_nonconformance eq 'Product Quality'}"><c:out value="Selected"/></c:if> value="Product Quality" >Product Quality</option>
											<option <c:if test="${nonconformance.type_of_nonconformance eq 'Service Quality'}"><c:out value="Selected"/></c:if>  value="Service Quality">Service Quality</option>
											<option  <c:if test="${nonconformance.type_of_nonconformance eq 'Late Delivery'}"><c:out value="Selected"/></c:if>  value="Late Delivery">Late Delivery</option>
											<option <c:if test="${nonconformance.type_of_nonconformance eq 'Early Delivery'}"><c:out value="Selected"/></c:if> value="Early Delivery">Early Delivery</option>
				                	<c:forEach items="${type_of_NC_Form.type_of_NCs}" var="types" varStatus="status">
        				       <option value="${types.type_of_nc}"<c:if test="${types.type_of_nc == nonconformance.type_of_nonconformance}"><c:out value="selected"/></c:if>>${types.type_of_nc}</option>
			                  </c:forEach>
				                   		</select><span style="color:red;"><form:errors path="Nonconformance.type_of_nonconformance"></form:errors>
				                   	</td>
				                 	<td valign="middle" align="left" class="input_txt"> Quantity Suspect </td>
				                    <td valign="top" align="left" class="input_txt">
				                    <input type="text" value="${nonconformance.quantity_suspect}" class="input_txtbx1" id="quantity" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="quantity_suspect" /><br>
				                    <span id="quantitysuspect" style="color:red;"></span>
				                    <span style="color:red;"><form:errors path="Nonconformance.quantity_suspect"></form:errors></span>
				                    </td>
				    	</tr>
						
				                <tr class="row2">
									<td valign="top" align="left" class="input_txt"> Nature Of NC </td>
				                  	<td valign="top" align="left" class="input_txt">
				               
				                <textarea class="input_txtbx1" id="natureofnc"  name="nature_of_nonconformance" value="${nonconformance.nature_of_nonconformance}" style="width:20%; height: 50px;" >${nonconformance.nature_of_nonconformance}</textarea>
								<br>
								<span id="nature" style="color:red;"></span>
								<span style="color:red;"><form:errors path="Nonconformance.nature_of_nonconformance"></form:errors></span></td>
				                	
			                  <td valign="top" align="left" class="input_txt"> Disposition Required(Y/N) </td>
			        		        
			        		        <td valign="middle" align="left" class="input_txt" width="70%">
                	                            <input type="radio" name="disposition_required" value="Yes" onchange="toggle3(this.value);"  id="disposition_required_yes"<c:if test="${nonconformance.disposition_required=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
                	                            <input type="radio" name="disposition_required" value="No" id="disposition_required_no" onchange="toggle3(this.value);"  <c:if test="${nonconformance.disposition_required=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span></td>
                	           </tr>
								 <tr class="row1">
				                 	<td valign="middle" align="left" class="input_txt"> Date Found </td>
				                  	<td valign="middle" align="left" class="input_txt">
				                  	<input type="text" value="${nonconformance.date_found}" class="input_txtbx1" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="date_found" /><br>
				                  	<span id="datepicker2" style="color:red;"></span>
				                  <span style="color:red;"><form:errors path="Nonconformance.date_found"></form:errors></span></td>
				  
				                
                	          
				                  	<td valign="top" align="left" class="input_txt"> Disposition </td>
				                  	<td valign="top" align="left" class="input_txt" width="30%">
						                    						<table><tr>
						                    						<td style="vertical-align:top;"><select name="disposition1" id="disid1" class="input_cmbbx1" onchange="show1();">
				                  										<option value="">--Select--</option>
				                  										<option <c:if test="${nonconformance.disposition1 eq 'Repair'}"><c:out value="Selected"/></c:if>="" value="Repair">Repair</option>
				                  										<option <c:if test="${nonconformance.disposition1 eq 'Discard'}"><c:out value="Selected"/></c:if>="" value="Discard">Discard</option>
																		<option <c:if test="${nonconformance.disposition1 eq 'Keep as is'}"><c:out value="Selected"/></c:if>="" value="Keep as is">Keep as is</option>
						                    						</select><span style="color:red;"><form:errors path="Nonconformance.disposition1"></form:errors>
						                    							</td><td align="right">
						                    						
						                    				<input type="text" name="quality1" id="quality1" style="display:none; width:40px;" onchange="showbutton1();"  />
						                    					</td><td align="left"><input type="button" class="number_btn1" name="No's" id="button1" value="No's" style="display:none;">
						                    					</td></tr>
						                    					<tr><td colspan="3"><span id="quality1err" style="color:red;"></span></td></tr>
						                    					<tr>
						                    						<td style="vertical-align:top;"><select name="disposition2" id="disid2" class="input_cmbbx1" onchange="show2();">
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
						                    						</select><span style="color:red;"><form:errors path="Nonconformance.disposition2"></form:errors></td>
						                    						<td align="right"><input type="text" name="quality2" id="quality2" style="display:none; width:40px;" onchange="showbutton2();" /></td>
						                    						<td align="left"><input type="button" class="number_btn1" id="button2" name="No's" value="No's" style="display:none;"></td>
						                    						</tr><tr><td colspan="3"><span id="quality2err" style="color:red;"></span></td></tr><tr>
						                    						<td style="vertical-align:top;"><select name="disposition3" id="disid3"class="input_cmbbx1" onchange="show3();">
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
						                    						</select><span style="color:red;"><form:errors path="Nonconformance.disposition3"></form:errors>
						                    					</td>
						                    					<td  align="right"><input type="text" name="quality3" id="quality3" style="display:none; width:40px;" onchange="showbutton3();" />
						                    					</td><td  align="left"><input type="button" id="button3" class="number_btn1" name="No's" value="No's" onchange="showbutton3();" style="display:none;">
						                    						</td>
						                    						</tr><tr><td colspan="3"><span id="quality3err" style="color:red;"></span></td></tr></table>
						                    						
						                    						
																		</td>
																	</tr>
						                    					        
								<tr class="row2">
				                	<td valign="top" align="left" class="input_txt"> Reported By </td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="hidden" name="group_person" id="group_person" value="${nonconformance.reported_by}"/>
				                  	<select name="reported_by" class="input_cmbbx1" id="reported_by">
																			 <option value="">--Select--</option>
																			 <c:forEach items="${reportedByNCForm.reportedByNCs}" var="reportedByNCs" varStatus="status">
        				       <option value="${reportedByNCs.group_person}" <c:if test="${reportedByNCs.group_person == nonconformance.reported_by}"><c:out value="selected"/></c:if>>${reportedByNCs.group_person}</option>
			                  </c:forEach>
			                 </select>
																			 <span class="err"><form:errors path="Nonconformance.reported_by"></form:errors></span></td>
				                  	<td valign="top" align="left" class="input_txt"> Disposition Complete Date:</td>
			                        <td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.disposition_complete_date}" class="input_txtbx1" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="disposition_complete_date" /><br><span class="err"><form:errors path="Nonconformance.disposition_complete_date"></form:errors></span></td>
				      
			          
				       	</tr>
						                 
   						  		<tr class="row1">
			   						<td valign="middle" align="left" class="input_txt"> Temporary Action </td>
               						<td valign="top" align="left"><textarea class="input_txtbx1" id="tempaction"  name="temporary_action"  style="width:75%; height: 89px;" >${nonconformance.temporary_action}</textarea><br/>
               														<span id="temp" style="color:red;"></span>
               														 <span style="color:red;"><form:errors path="Nonconformance.temporary_action"></form:errors></span></td>
         </td>
         							<td valign="top" align="left" class="input_txt"> Disposition Responsibility </td>
			                        <td valign="top" align="left" class="input_txt">
																			  <select name="name_of_disposition_responsibility" id="name_of_disposition_responsibility" class="input_cmbbx1" style="width:200px;">
              																
																			 <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="dispositionname" varStatus="status">
        				       												<option value="${dispositionname.name}"<c:if test="${dispositionname.name == nonconformance.name_of_disposition_responsibility}"><c:out value="selected"/></c:if>>${dispositionname.name}</option>
			                  												</c:forEach>
			                 												</select><br/>
			                 												<span id="temp" style="color:red;"></span>
			                 												<span style="color:red;"><form:errors path="Nonconformance.name_of_disposition_responsibility"></form:errors>
				        		
		  					
		  					<tr class="row2">
                  				   	<td valign="middle" align="left" class="input_txt"> Corrective Action Required(Y/N) </td>
                  				 
                  				                   <td valign="middle" align="left" class="input_txt" width="70%">
                			 					<input type="radio" name="corrective_action_required" value="Yes" onchange="toggle3(this.value);"  id="corrective_action_required_yes" <c:if test="${nonconformance.corrective_action_required=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
                			 					<input type="radio" name="corrective_action_required" value="No" id="corrective_action_required_no" onchange="toggle3(this.value);"  <c:if test="${nonconformance.corrective_action_required=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span></td>
                			 
                			 
			    	                <td valign="top" align="left" class="input_txt"> Cost of NC </td>
			   	                 	<td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.cost_of_nonconformance}" class="input_txtbx1" id="costofnc" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="cost_of_nonconformance" /><br/>
			   	                 	<span id="cost" style="color:red;"></span>
			   	                 <span style="color:red;"><form:errors path="Nonconformance.cost_of_nonconformance"></form:errors></span></td>
				          </tr>
     
                <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn1" value="Update" onclick="update.submit();return validation();"></td>
            </tr>
    </table>
    
   </div>
   </td>
   </tr>
   </table>
   </form>
    </div>
            

<script>
   function doAjaxPost() {
	 //alert("hi");
	document.getElementById('type_of_nonconformance').style.display="block";
	 document.getElementById("reported_by").style.display="inline";
	var filer_value = $('#type_of_nonconformance').val();
	var group_person=$('#group_person').val();
	//alert(group_person);
	//alert("hello");
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_gettypenc",
		data : "type_of_nonconformance=" + filer_value+"&group_person="+group_person,
		success : function(response) {
	//	alert("response"+response);
		$('#reported_by').html(response);
			},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
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
 $(window).load(function()
		 {
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

	var numbers = /^[-+]?[0-9]+$/;
	var val = document.getElementById("quality2").value;
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
	var numbers = /^[-+]?[0-9]+$/;
	var val = document.getElementById("quality3").value;
if(val!="" && val.match(numbers))
	{
	document.getElementById("button3").style.display = 'block';
	} 
else
	{
	document.getElementById("button3").style.display = 'none';
	}

	}
	
});
</script>
  
<script>
 $(window).load(function(){
	 
	  $("#quality1").keyup(function() {
			
			 $("#quality1err").html(''); 
			/* var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/; */
			var intRegex = /^\d+$/;
			if(intRegex.test($(this).val())||$(this).val()=='') 
			{
				var $in = $(this).val();		 
			}
			else if($(this).val()!='')
				{
				
				$("#quality1err").html(' enter a number!!!!');
				}
		}).keydown(function() {
		    oldValue = $(this).val();
		})
 $("#quality2").keyup(function() {
			
			 $("#quality2err").html(''); 
			/* var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/; */
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
			/* var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/; */
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
      
 <script language="JavaScript">
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
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}

$(function() {
	 var format="yy-mm-dd";
           $( "#datepicker" ).datepicker();
           
         });
 
 $(function() {
           $( "#datepicker1" ).datepicker();
         });
</script> 
<script>
	
	window.onload = function(){
		show1();show2();show3();doAjaxPost();
	}
		</script>
		
<script>
function validation()
{
	//update.submit();
	
   	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
   	var datefound = document.getElementById('datepicker').value;
	var complete = document.getElementById('datepicker1').value;
	var quantity = document.getElementById('quantity').value;
	var costnc = document.getElementById('costofnc').value;
	var action = document.getElementById('tempaction').value;
	var naturenc = document.getElementById('natureofnc').value;
	
	

 	 if(!datefound.match(date))
	 {

	 document.getElementById("datepicker2").innerHTML="MM/DD/YYYY";
	 return false;
	}
  	if(!complete.match(date))
	 {

	 document.getElementById("completedate").innerHTML="MM/DD/YYYY";
	 return false;
	} 

  	 if(quantity.charAt(0) ==" ")
	 {
		 
		 document.getElementById("quantitysuspect").innerHTML="Required Field Should not be space";
		 return false;
	 }
	 else if(quantity.match(validate1))
	 {
		 document.getElementById("quantitysuspect").innerHTML="";
 	 }
	 else
		 {
		   document.getElementById("quantitysuspect").innerHTML="Required Field Should not be Empty";
		   	return false;
		 }

  	 alert("before cost");
 	 if(costnc.charAt(0) ==" ")
	 {
		 alert("cost");
		 document.getElementById("cost").innerHTML="Required Field Should not be space";
		 return false;
	 }
	 else if(costnc.match(validate1))
	 {
		 document.getElementById("cost").innerHTML="";
 	 }
	 else
		 {
		   document.getElementById("cost").innerHTML="Required Field Should not be Empty";
		   	return false;
		 }

 	 
	 if(naturenc.charAt(0) ==" ")
	 {
		 alert("space");
		 document.getElementById("nature").innerHTML="Required Field Should not be space";
	 }
		 else if(naturenc.match(validate1))
		 {
			 if((naturenc.length < 5) || (comments.length > 500) )
				 {
				 document.getElementById("nature").innerHTML="Should b/w 5 to 500 chars";
				 return false;
				 }
			 else{
			     document.getElementById("nature").innerHTML="";
			     }
	   	 }
	 	else{
				 document.getElementById("nature").innerHTML="Required Field Should not be Empty";
				 return false;
			    }

	
if(action.charAt(0) ==" ")
{
	alert("action"+action);
	 
	 document.getElementById("temp").innerHTML="Required Field Should not be space";
}
	 else if(action.match(validate1))
	 {
		 if((action.length < 5) || (comments.length > 500) )
			 {
			 document.getElementById("temp").innerHTML="Should b/w 5 to 500 chars";
			 return false;
			 }
		 else{
		     document.getElementById("temp").innerHTML="";
		     }
  	 }
	else{
			 document.getElementById("temp").innerHTML="Required Field Should not be Empty";
			 return false;
		    }

}
</script>

<jsp:include page="footer.jsp"></jsp:include>