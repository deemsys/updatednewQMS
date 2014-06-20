<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<form method="post" action="add_maintenance">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <!-- <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr> -->
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu=='maintenance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Maintenance</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Maintenance</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
								</a>
							</li>
				           </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Maintenance and Calibration Details</h2>
            </div>
            
    <div class="contentbox">
       <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:15px;">
        <div>
           <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 35px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="equipment_id" class="input_txtbx1" id="equipment_id" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.equipment_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Equipment Name :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="equipment_name" class="input_txtbx1" id="equipment_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.equipment_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Equipment Model :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="equipment_model" class="input_txtbx1" id="equipment_model" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.equipment_model"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Serial Number :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="serial_number" class="input_txtbx1" id="serial_number" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.serial_number"></form:errors></span></td>
                </tr>
                </table>
						         </td>
						         <td align="left" valign="top">
						         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Date Acquired :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="date_acquired" class="input_txtbx1" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.date_acquired"></form:errors></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="50%"> Equipment Status :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">
                  <select name="equipment_status" class="input_cmbbx1">
                  <option value="">--Select--</option>
                  <option value="Active">Active</option>
                  <option value="Not Active">Not Active</option>
                  </select>
                  <br/><span class="err"></span></td>
                  
                  </tr>
                  <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" >Frequency of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt">
                  <select name="frequency_maintenance" class="input_cmbbx1">
                  <option value="">--Select--</option>
                  <option value="Weekly">Weekly</option>
                  <option value="Monthly">Monthly</option>
                   <option value="Weekly">Quarterly</option>
                   <option value="Weekly">Semi-Annually</option>
                  <option value="Monthly">Annually</option>
                  </select>
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="50%">Calibration(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="50%">
               <input type="radio" name="calibration" value="Yes" onchange="toggle3(this.value);"  id="calibration_yes" checked>Yes&nbsp;&nbsp;&nbsp;
               <input type="radio" name="calibration" value="No" id="calibration_no" onchange="toggle3(this.value);"  >No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               </td>
               </table>
             </td>
              </tr>
            
            
        </table>
        </div>
       
         <div>
         <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:10px;">
          <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  
                  <td valign="middle" align="left" class="input_txt" width="50%">Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="equipmentid" class="input_txtbx1" id="equipmentid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"></span></td>
                </tr> 
               <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="50%"> Type of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">
                  <select name="type_of_maintenance" class="input_cmbbx1">
                 
                  <option value="Preventive">Preventive</option>
                  <option value="Corrective">Corrective</option>
                   <option value="Predictive">Predictive</option>
               </select>
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Frequency of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">
                  <input type="checkbox" name="weekly" value="weekly" id="weekly"/ onclick="toggleAjax()" >&nbsp;Weekly  <br/>               
             	  <input type="checkbox" name="monthly" value="monthly" id="monthly"/onclick="toggleAjax()" >&nbsp;Monthly<br/>
                  <input type="checkbox" name="quarterly" value="quarterly" id="quarterly"/onclick="toggleAjax()" >&nbsp;Quarterly<br/>
                  <input type="checkbox" name="semiannually" value="semi-annually" id="semiannually"/ onclick="toggleAjax()" >&nbsp;Semi-Annually<br/>
                  <input type="checkbox" name="annually" value="annually" id="annually"/ onclick="toggleAjax()" >&nbsp;Annually<br/>
                 <%--  <span class="err"><form:errors path="Maintenance.maintenance_frequency"></form:errors></span> --%></td>
                </tr>
                 <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="50%">Reference :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">
                  <div id="reference1"></div><br>
                  <div id="reference2"></div><br>
                  <div id="reference3"></div><br>
                  <div id="reference4"></div><br>
                  <div id="reference5"></div>
                  
                  </td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt">Instructions:</td>
               <td valign="top" align="left"  colspan="3"><div id="instruction"></div>
               <textarea class="input_txtbx1"  name="instructions"  style="width:96%; height: 89px;" ></textarea><br/><span class="err"><form:errors path="Maintenance.instructions"></form:errors></span>
               
               
               </td>
           
            </tr>
        </table>
        </td> 
           <td>
           <table>
           
           
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="50%"><input type="text" name="due_date" class="input_txtbx1" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="completion_date" class="input_txtbx1" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Completed By :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="completed_by" class="input_txtbx1" id="completed_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.completed_by"></form:errors></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt"width="50%">Notes:</td>
               <td valign="top" align="left"  class="input_txt"width="50%"><textarea class="input_txtbx1"  name="notes"  style="width:85%; height: 89px;" ></textarea><br/><span class="err"><form:errors path="Maintenance.notes"></form:errors></span></td>
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
              </div>
              </div>
          </table>
           </form>
       <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
 <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
 <script>
 $(function() {
	 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
            <script>
            function toggle(value){
            	
            if(value!=null)
            	equipmentid.value=value;
            
            }
            </script>
 <script>
$(document).ready(function()
{
$("#searchbox").keyup(function()
{
var sr=$("#searchbox").val();
$("#suggestion_box").val('');
$.ajax(
{
type:"post",
url:"add_maintenance.jsp",
data:"search="+ sr,
cache:false,
success:function(html)
{
$("#suggestion_box").html(html);
}
});
}); 
});
</script>
  
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
		instructionAjax();
	}
		</script>        
            
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
            