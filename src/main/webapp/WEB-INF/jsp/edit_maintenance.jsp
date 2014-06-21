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
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_id" class="input_txtbx" id="equipment_id" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipment_id}" /><span class="err"><form:errors path="Maintenance.equipment_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Equipment Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_name" class="input_txtbx" id="equipment_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipment_name}" /><span class="err"><form:errors path="Maintenance.equipment_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Equipment Model :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_model" class="input_txtbx" id="equipment_model" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipment_model}" /><span class="err"><form:errors path="Maintenance.equipment_model"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Serial Number :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="serial_number" class="input_txtbx" id="serial_number" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.serial_number}" /><span class="err"><form:errors path="Maintenance.serial_number"></form:errors></span></td>
                </tr>
                </table>
						         </td>
						         <td align="left" valign="top">
						         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Date Acquired :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_acquired" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.date_acquired}" /><span class="err"><form:errors path="Maintenance.date_acquired"></form:errors></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Equipment Status :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="equipment_status" class="input_cmbbx1">				  
                  <option value="">--Select--</option>
             	<option <c:if test="${Maintenance.equipment_status eq 'Active'}"><c:out value="Selected"/></c:if> value="Active" >Active</option>
                <option <c:if test="${Maintenance.equipment_status eq 'Not Active'}"><c:out value="Selected"/></c:if> value="Not Active" >Not Active</option>
                 
                   </select>
                  <br/><span class="err"></span></td>
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
                   <select name="frequency_maintenance" class="input_cmbbx1" multiple>
                   <c:set var="theString" value="${Maintenance.frequency_maintenance}"/>

					
   					<option  <c:if test="${fn:contains(theString, 'Weekly')}"><c:out value="Selected"/></c:if>  value="Weekly" >Weekly</option>
               		<option  <c:if test="${fn:contains(theString, 'Monthly')}"><c:out value="Selected"/></c:if> value="Monthly" >Monthly</option>
                    <option <c:if test="${fn:contains(theString, 'Quarterly')}"><c:out value="Selected"/></c:if> value="Quarterly" >Quarterly</option>
               		<option <c:if test="${fn:contains(theString, 'Semi-Annually')}"><c:out value="Selected"/></c:if> value="Semi-Annually" >Semi-Annually</option>
                    <option <c:if test="${fn:contains(theString, 'Annually')}"><c:out value="Selected"/></c:if> value="Annually" >Annually</option>
                  
                  </select>
                  
                  <br/><span class="err"></span></td>
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
                <tr class="row2">
         
                  <td valign="middle" align="left" class="input_txt" width="30%">Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipmentid" class="input_txtbx" id="equipmentid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipmentid}" /><span class="err"></span></td>
                </tr> 
               <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Type of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="type_of_maintenance" class="input_cmbbx1">
                  <option value="">--Select--</option>
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
                  <span class="err"><form:errors path="Maintenance.reference"></form:errors></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="top" align="left" class="input_txt">Instructions:</td>
               <td valign="top" align="left"  colspan="3">
               <div id="instruction"></div>
               <textarea class="input_txtbx1"  name="instructions"  style="width:70%; height: 49px;" >${Maintenance.instructions}</textarea><br/><span class="err"><form:errors path="Maintenance.instructions"></form:errors></span></td>
            </tr>
        </table>
        </td> 
           <td>
           <table>
           
           
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="due_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.due_date}" /><span class="err"><form:errors path="Maintenance.due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.completion_date}" /><span class="err"><form:errors path="Maintenance.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Completed By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                    <select name="completed_by" id="searchbox"  class="input_cmbbx1" style="width:200px;">
							 
			                <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="calibrationname" varStatus="status">
        				       <option value="${calibrationname.name}"<c:if test="${calibrationname.name == Maintenance.completed_by}"><c:out value="selected"/></c:if>>${calibrationname.name}</option>
			                  </c:forEach>
			                 </select>
                  <span class="err"><form:errors path="Maintenance.completed_by"></form:errors></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt" width="30%">Notes:</td>
               <td valign="top" align="left"  colspan="3" width="70%"><textarea class="input_txtbx1"  name="notes"  style="width:80%; height: 49px;" >${Maintenance.notes}</textarea><br/><span class="err"><form:errors path="Maintenance.notes"></form:errors></span></td>
            </tr>
            <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" class="submit_btn1"></td>
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
	
	window.onload = function(){
		instructionAjax();toggleAjax();
	}
		</script>            
 <jsp:include page="footer.jsp"></jsp:include>
          