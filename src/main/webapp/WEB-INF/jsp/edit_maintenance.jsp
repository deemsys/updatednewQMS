<%@page import="qms.model.Maintenance"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
 <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 

 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 

 $(function() {
	 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<form method="post" action="update_maintenance">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Maintenance</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Maintenance</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_report" class="<c:choose>
								<c:when test="${menu=='maintenance'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
								</a>
							</li>
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Maintenance & Calibration Details</h2>
            </div>  
            <div class="contentbox">
       <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:15px;">
       <div>
        <table cellpadding="0" cellspacing="0" border="0" width="100%" >
         <c:set value="${maintenanceForm.maintenance[0]}" var="Maintenance"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="equipment_id" class="input_txtbx" id="equipment_id" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipment_id}" />${Maintenance.equipment_id}
                  <!--  <span id="equipment_id1" style="color:red"></span> -->
                  <span class="err"><form:errors path="Maintenance.equipment_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Equipment Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_name" class="input_txtbx" id="equipment_name" onInput="return validatename(id);"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipment_name}" />
                    <span id="equipment_name1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.equipment_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Equipment Model :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_model" class="input_txtbx" id="equipment_model" onInput="return validatename2(id);"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipment_model}" />
                    <span id="equipment_model1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.equipment_model"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Serial Number :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="serial_number" class="input_txtbx" id="serial_number" onInput="return validatename3(id);"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.serial_number}" />
                   <span id="serial_number1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.serial_number"></form:errors></span></td>
                </tr>
                </table>
						         </td>
						         <td align="left" valign="top">
						         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Date Acquired :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_acquired" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.date_acquired}" />
                    <span id="datepicker11" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.date_acquired"></form:errors></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Equipment Status :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="equipment_status" id="equipment_status"class="input_cmbbx1">				  
                  <option value="">--Select--</option>
             	<option <c:if test="${Maintenance.equipment_status eq 'Active'}"><c:out value="Selected"/></c:if> value="Active" >Active</option>
                <option <c:if test="${Maintenance.equipment_status eq 'Not Active'}"><c:out value="Selected"/></c:if> value="Not Active" >Not Active</option>
                 
                   </select>
                   
                  <br/>
                   <span id="equipment_status1" style="color:red"></span>
                  <span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Frequency of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <%--  <%
                  String values= (String) request.getAttribute("frequency");
                   System.out.println("type of maintenance = "+request.getAttribute("frequency"));
                   String[] list_of_values = values.split(",");
                   int leng = list_of_values.length;
                   for(int i=0; i < leng;i++)
                   {
                	   if(i == 0)
                	   {
                		   String weekly = list_of_values[i];
                		   System.out.println("1 "+weekly);
                	   }
                	   if(i == 1)
                	   {
                		   String monthly = list_of_values[i];
                		   System.out.println("2 "+monthly);
                	   }
                	   if(i == 3)
                	   {
                		   String quarterly = list_of_values[i];
                	   }
                	   if(i == 4)
                	   {
                		   String semiannually = list_of_values[i];
                	   }
                	   if(i == 5)
                	   {
                		   String annually = list_of_values[i];
                	   }
                   }
                   %> --%>
                   <select name="frequency_maintenance" id="frequency_maintenance"class="input_cmbbx1" multiple>
                   <c:set var="theString" value="${Maintenance.frequency_maintenance}"/>

					
   					<option  <c:if test="${fn:contains(theString, 'Weekly')}"><c:out value="Selected"/></c:if>  value="Weekly" >Weekly</option>
               		<option  <c:if test="${fn:contains(theString, 'Monthly')}"><c:out value="Selected"/></c:if> value="Monthly" >Monthly</option>
                    <option <c:if test="${fn:contains(theString, 'Quarterly')}"><c:out value="Selected"/></c:if> value="Quarterly" >Quarterly</option>
               		<option <c:if test="${fn:contains(theString, 'Semi-Annually')}"><c:out value="Selected"/></c:if> value="Semi-Annually" >Semi-Annually</option>
                    <option <c:if test="${fn:contains(theString, 'Annually')}"><c:out value="Selected"/></c:if> value="Annually" >Annually</option>
                  
                  </select>
                  
                  <br/>
                   <span id="frequency_maintenance1" style="color:red"></span>
                  <span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="30%">Calibration(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="70%">
               <input type="radio" name="calibration" value="Yes" onchange="toggle3(this.value);"  id="calibration_yes"  <c:if test="${Maintenance.calibration=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
               <input type="radio" name="calibration" value="No" id="calibration_no" onchange="toggle3(this.value);" <c:if test="${Maintenance.calibration=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               </td>
               </table>
             </td>
              </tr>
            
            
        </table>
        </div>
         <div>
                     <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">

        
    
    <tr>
   <td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <%-- <tr class="row2">
         
                  <td valign="middle" align="left" class="input_txt" width="30%">Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipmentid" class="input_txtbx" id="equipmentid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipmentid}" /><span class="err"></span></td>
                </tr>  --%>
               <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Type of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="type_of_maintenance" class="input_cmbbx1">
                 
                  <option <c:if test="${Maintenance.type_of_maintenance eq 'Preventive'}"><c:out value="Selected"/></c:if> value="Preventive" >Preventive</option>
                  <option <c:if test="${Maintenance.type_of_maintenance eq 'Corrective'}"><c:out value="Selected"/></c:if> value="Corrective" >Corrective</option>
                  <option <c:if test="${Maintenance.type_of_maintenance eq 'Predictive'}"><c:out value="Selected"/></c:if> value="Predictive" >Predictive</option>

               </select>
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Maintenance Frequency :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  
                  <input type="checkbox" name="weekly" value="weekly" id="weekly" onclick="toggleAjax()" <c:if test="${Maintenance.weekly=='weekly'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Weekly  <br/>               
             	  <input type="checkbox" name="monthly" value="monthly" id="monthly" onclick="toggleAjax()" <c:if test="${Maintenance.monthly=='monthly'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Monthly<br/>
                  <input type="checkbox" name="quarterly" value="quarterly" id="quarterly" onclick="toggleAjax()" <c:if test="${Maintenance.quarterly=='quarterly'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Quarterly<br/>
                  <input type="checkbox" name="semiannually" value="semi-annually" id="semiannually" onclick="toggleAjax()" <c:if test="${Maintenance.semiannually=='semi-annually'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Semi-Annually<br/>
                  <input type="checkbox" name="annually" value="annually" id="annually" onclick="toggleAjax()" <c:if test="${Maintenance.annually=='annually'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Annually<br/>
                   <span id="frequencyofmaintenance1" style="color:red"></span>
                <%--   <input type="text" name="maintenance_frequency" class="input_txtbx" id="maintenance_frequency" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.maintenance_frequency}" /><span class="err"><form:errors path="Maintenance.maintenance_frequency"></form:errors></span></td> --%>
                </tr>
                 <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%">Reference :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  
                  <%-- <input type="text" name="reference" class="input_txtbx" id="reference" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.reference}" /> --%>
                   <div id="reference1"></div><br>
                  <div id="reference2"></div><br>
                  <div id="reference3"></div><br>
                  <div id="reference4"></div><br>
                  <div id="reference5"></div>
                 <%--  <span class="err"><form:errors path="Maintenance.reference"></form:errors></span></td>
                --%> </tr>
                <tr class="row2">
              
               <td valign="top" align="left" class="input_txt">Instructions:</td>
               <td valign="top" align="left"  colspan="3">
               <div id="instruction"></div>
               <textarea class="input_txtbx1" id="instructions" name="instructions"  style="width:70%; height: 49px;" >${Maintenance.instructions}</textarea><br/>
               <span id="instructions1" style="color:red"></span> 
               <span class="err"><form:errors path="Maintenance.instructions"></form:errors></span></td>
            </tr>
        </table>
        </td> 
           <td>
           <table>
           
           
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="due_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.due_date}" />
                   <span id="datepicker22" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.completion_date}" />
                   <span id="datepicker33" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Completed By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                    <select name="completed_by" id="completed_by"  class="input_cmbbx1" style="width:200px;">
							 
			                <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="calibrationname" varStatus="status">
        				       <option value="${calibrationname.name}"<c:if test="${calibrationname.name == Maintenance.completed_by}"><c:out value="selected"/></c:if>>${calibrationname.name}</option>
			                  </c:forEach>
			                 </select><br>
			                 <span id="completed_by1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.completed_by"></form:errors></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt" width="30%">Notes:</td>
               <td valign="top" align="left"  colspan="3" width="70%"><textarea class="input_txtbx1"  name="notes"  id="notes" style="width:80%; height: 49px;" >${Maintenance.notes}</textarea><br/>
               <span id="notes1" style="color:red"></span>
               <span class="err"><form:errors path="Maintenance.notes"></form:errors></span></td>
            </tr>
            <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                
                   <td valign="top" align="left"><input type="submit" value="Submit" onclick="return validation();"class="submit_btn1"></td>
                </tr>
          
           </table>
           </td>
           </tr>
    
           </table>
            
            
           
         </div>  
            </div>
             </td>
            </tr>
            </table></div>
            </form>
              
           
 <script>
   function toggleAjax() {
	 
	   var weekly_main = document.getElementById('weekly').checked;
	   var monthly_main = document.getElementById('monthly').checked;
	   var quarterly_main = document.getElementById('quarterly').checked;
	   var semiannually_main = document.getElementById('semiannually').checked;
	   var annually_main = document.getElementById('annually').checked;
	   var weekly ='',monthly='', quarterly='',semiannually='',annually='';
	   		if(weekly_main)
		   {
			 weekly = $('#weekly').val();
		   }
		   if(monthly_main)
		   {
			 monthly = $('#monthly').val();
		   }
		   if(quarterly_main)
			{
	               quarterly = $('#quarterly').val();
			}
	        if(semiannually_main)
	        {
				 semiannually = $('#semiannually').val();
	        }
		    if(annually_main)
			{
				 annually = $('#annually').val();
	        }
	            	 
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getAttach",
		data : "weekly="+weekly+"&monthly="+monthly+"&quarterly="+quarterly+"&semiannually="+semiannually+"&annually="+annually,
		success : function(response) {
		//	alert("response"+response);
		var two_drop=response.split("<split>");
		
		
    	 var size = two_drop.length-1;
    	//alert("size = "+size);
    	for(var i=0; i<= size; i++)
    		{
    		//alert("for loop");
    		if(i == 0)
    			{ 
    		//	alert("if loop 0");
    			$('#reference1').html(two_drop[i]).value=response;
    			
    			}
    		
    		if(i = 1){
    	//		alert("if loop1");
    		$('#reference2').html(two_drop[i]).value=response;
    		}
    		 if(i = 2){
    	//		alert("if loop2");
    			$('#reference3').html(two_drop[i]).value=response;
    		}
			if(i = 3){
		//		alert("if loop3");
    			$('#reference4').html(two_drop[i]).value=response;
    		}
			if(i = 4){
		//		alert("if loop4");
    			$('#reference5').html(two_drop[i]).value=response;
    		} 
			if(i = 5)
				{
				
				}
    		} 
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
 
   
   
   function instructionAjax() {
		 
		
		var filer_value = $('#weekly').val();
		
		$.ajax({
			type : "POST",
			url : "/QMS_App/ajax_getinstruction",
			data : "weekly=" + filer_value,
			success : function(response) {
	              
	             // alert("response= "+response);
	              
		       $('#instruction').html(response);
	      	    			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}   
  
 
</script> 
<script>
$(function() {
	$("#equipment_id").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#equipment_name").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#equipment_model").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

$(function() {
	$("#serial_number").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

$(function() {
	$("#instructions").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

$(function() {
	$("#notes").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
</script>
    <script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById(id).value = textInput;
} 

function validatename2(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Z0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}  
function validatename3(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}  
</script>
<script type="text/javascript">
function validation()
{

	
	

	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	
	var error="";

	var equipment_name =  document.getElementById('equipment_name').value;
	
	var equipment_model = document.getElementById('equipment_model').value;
	
	var serial_number = document.getElementById('serial_number').value;
	
	var datepicker1 = document.getElementById('datepicker1').value;
	
	var datepicker2 = document.getElementById('datepicker2').value;
	
	var datepicker3 = document.getElementById('datepicker3').value;
	
	var equipment_status = document.getElementById('equipment_status').value;
	
	var frequency_maintenance = document.getElementById('frequency_maintenance').value;
	
	 var weekly = document.getElementById('weekly').checked;
	
	   var monthly = document.getElementById('monthly').checked;
	  
	   var quarterly = document.getElementById('quarterly').checked;
	   
	   var semiannually = document.getElementById('semiannually').checked;
	  
	   var annually = document.getElementById('annually').checked;
	 
	   var instructions=  document.getElementById('instructions').value;
	 
	  var completed_by = document.getElementById('completed_by').value;
	 
	  var notes = document.getElementById('notes').value;
	
	if(equipment_name == "")
	{
	document.getElementById("equipment_name1").innerHTML="Required Field Should not be Empty";
	error="true";
	}
	else if(equipment_name.charAt(0) == " ")
	{
	document.getElementById("equipment_name1").innerHTML="Initial Spaces not Alloweds";
	error="true";
	}
	else if((equipment_name.length < 4) || (equipment_name.length > 32))
	{
	document.getElementById("equipment_name1").innerHTML="Required Field Should be length of 4 to 32";
	error="true";
	}
	else{
	document.getElementById("equipment_name1").innerHTML="";
	}

	
	
	
	if(equipment_model == "")
	{
	document.getElementById("equipment_model1").innerHTML="Required Field Should not be Empty";
	error="true";
	}
	else if(equipment_model.charAt(0) == " ")
	{
	document.getElementById("equipment_model1").innerHTML="Initial Spaces not Alloweds";
	error="true";
	}
	else if((equipment_model.length < 4) || (equipment_model.length > 32))
	{
	document.getElementById("equipment_model1").innerHTML="Required Field Should be length of 4 to 32";
	error="true";
	}
	else{
	document.getElementById("equipment_model1").innerHTML="";
	}


	
	
	if(serial_number == "")
	{
	document.getElementById("serial_number1").innerHTML="Required Field Should not be Empty";
	error="true";
	}
	else if(serial_number.charAt(0) == " ")
	{
	document.getElementById("serial_number1").innerHTML="Initial Spaces not Alloweds";
	error="true";
	}
	else if((serial_number.length < 4)|| (serial_number.length > 32))
	{
	document.getElementById("serial_number1").innerHTML="Required Field Should be length of 4 to 32";
	error="true";
	}
	else{
	document.getElementById("serial_number1").innerHTML="";
	}
	
	
	 if(datepicker1 == "")
	 {
	 document.getElementById("datepicker11").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker1.match(date))
	 {
	 document.getElementById("datepicker11").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker11").innerHTML="Invalid Date";
	 error="true";
	 }
	 
	 if(equipment_status == "")
		 {
		 document.getElementById("equipment_status1").innerHTML="Required Field Should not be Empty";
		 error="true";
		 }
	 else
		 {
		 document.getElementById("equipment_status1").innerHTML="";
		 }
	 
	 
	 if(frequency_maintenance == "")
	 {
	 document.getElementById("frequency_maintenance1").innerHTML="Select Atleast one. For more option hold ctrl and select";
	 error="true";
	 }
	else
	 {
	 document.getElementById("frequency_maintenance1").innerHTML="";
	 }
	 
	 if((weekly) || (monthly) ||(quarterly)||(semiannually) || (annually))
		 {
		 document.getElementById("frequencyofmaintenance1").innerHTML="";
		 }
	 else{
		 document.getElementById("frequencyofmaintenance1").innerHTML="Please Check atleast one";
		 error="true";
		 
	 }
	 
	 if(instructions == "")
		{
		 
		document.getElementById("instructions1").innerHTML="";
		
		}
	 else if(instructions.charAt(0) == " ")
		{
		document.getElementById("instructions1").innerHTML="Initial Spaces not Alloweds";
		error="true";
		}
	  else if((instructions.length < 5) || (instructions.length > 400 ))
			 {
			 document.getElementById("instructions1").innerHTML="Should b/w 5 to 400 chars";
			 error="true";
			 }
		 else{
		     document.getElementById("instructions1").innerHTML="";
		     }
	 	
	
	 
	 
	 
if(datepicker2 == "")
	 {
	 document.getElementById("datepicker22").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker2.match(date))
	 {
	 document.getElementById("datepicker22").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker22").innerHTML="Invalid Date";
	 error="true";
	 }
	 
	 
	 if(datepicker3 == "")
	 {
	 document.getElementById("datepicker33").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker3.match(date))
	 {
	 document.getElementById("datepicker33").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker33").innerHTML="Invalid Date";
	 error="true";
	 } 
	 
	 
	 if(completed_by == "")
	 {
	 document.getElementById("completed_by1").innerHTML="Please Select";
	 error="true";
	 }
	else
	 {
	 document.getElementById("completed_by1").innerHTML="";
	 }
	 
	 
	 if(notes == "")
		{
		 
		document.getElementById("notes1").innerHTML="Required Field Should not Empty";
		error="true";
		}
	 else if(notes.charAt(0) == " ")
		{
		document.getElementById("notes1").innerHTML="Initial Spaces not Alloweds";
		error="true";
		}
		else if((notes.length < 5) || (notes.length > 400 ))
			 {
			 document.getElementById("notes1").innerHTML="Should b/w 5 to 400 chars";
			 error="true";
			 }
		 else{
		     document.getElementById("notes1").innerHTML="";
		     }
	 	
		
	 if(error=="true")
		 {
		 return false;
		 }
}


</script>  
<script>
	
	window.onload = function(){
		instructionAjax();toggleAjax();
	}
		</script>            
 <jsp:include page="footer.jsp"></jsp:include>
          