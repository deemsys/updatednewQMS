<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script>

 function validation()
 {

 document.getElementById("start").style.display="block";
 
 }
 function validation1()
 {

 document.getElementById("start").style.display="none";
  }
 
</script>
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;">

					<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add NonConformance</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View NonConformance</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformance_report" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
				             
				</ul>
			</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="nonconformance_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>
<table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
					<h2>NonConformance Report</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_nonconformance_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="document_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Select NonConformance Type :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<!-- <input type="radio" name="doc_type" value="0" id="id_type_manual" checked/><br/> -->
								
								<br>
								<br>
								<input type="radio" onchange="validation1()" name="doc_type" value="0" id="id_open_nonconformance" checked/>Open Non-Conformances<br/>
								<input type="radio"  onclick="validation1()"  name="doc_type" value="1" id="id_disposition"/>No Disposition Over 30 Days<br/>
								 <input type="radio" onclick="validation()" name="doc_type" value="2" id="id_cost_of_nonconformance"/>Cost of Non-Conformance<br/> 
								
								</td>
								</tr>
								
								<td colspan="4">
								
								
								<table id="start" cellpadding="0" cellspacing="0" border="0" width="100%" style="display:none;">
	
    								<tr class="row2">
    								<td valign="middle" align="left" class="input_txt"> Enter the Start Date : </td>
    								<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx" id="datepicker" name="start"/><br><span id="starterr"></span></td>
    								</tr>
    								
    								
    								<tr class="row2">
    								<td valign="middle" align="left" class="input_txt"> Enter the End Date : </td>
    								<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx" id="datepicker1" name="end" /><br><span id="enderr"></span></td>
    								</tr>
    							</table>
    							
    							</td>
    							
    							
    						
			
								<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
									
								</td>
								
							</tr>
						
						</table>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
						
							<!-- <tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="radio" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr> -->
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Enter the Name to appear on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="name_of_disposition_responsibility" class="input_txtbx" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Enter the Fields Required on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
								<td><input type="checkbox" name="report_field[]" value="id" id="id_field_id"/>NC ID</td>
								<td><input type="checkbox" name="report_field[]" value="reported_by" id="id_field_reported_by"/>Reported By</td>
								<td><input type="checkbox" name="report_field[]" value="corrective_action_required" id="id_field_corrective_action_required"/>Corrective Action Required? (Y/N)</td>
					      		<td><input type="checkbox" name="report_field[]" value="cost_of_nonconformance" id="id_field_cost_of_nonconformance"/>Cost of NC</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="source_of_nonconformance" id="id_field_source_of_nonconformance"/>Source of NC</td>
								<td><input type="checkbox" name="report_field[]" value="external_id" id="id_field_external_id"/>External ID</td>
								<td><input type="checkbox" name="report_field[]" value="disposition_required" id="id_field_disposition_required"/>Disposition Required (Y/N)</td>
					      		<td><input type="checkbox" name="report_field[]" value="disposition1" id="id_field_disposition1"/>Disposition1</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="type_of_nonconformance" id="id_field_type_of_nonconformance"/>Type of NC</td>
								<td><input type="checkbox" name="report_field[]" value="product_id" id="id_field_product_id"/>Product ID</td>
								<td><input type="checkbox" name="report_field[]" value="disposition2" id="id_field_disposition2"/>Disposition2</td>
					      		<td><input type="checkbox" name="report_field[]" value="disposition3" id="id_field_disposition3"/>Disposition3</td>
								</tr>
					      		
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="nature_of_nonconformance" id="id_field_nature_of_nonconformance"/>Nature of NC</td>
								<td><input type="checkbox" name="report_field[]" value="quantity_suspect" id="id_field_quantity_suspect"/>Quantity Suspect</td>
								<td><input type="checkbox" name="report_field[]" value="disposition_complete_date" id="id_field_disposition_complete_date"/>Disposition Complete Date</td>
					      		<td><input type="checkbox" name="report_field[]" value="quality1" id="id_quality1"/>Quality1</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="date_found" id="id_field_date_found"/>Date Found</td>
								<td><input type="checkbox" name="report_field[]" value="temporary_action" id="id_field_temporary_action"/>Temporary Action</td>
								<td><input type="checkbox" name="report_field[]" value="disposition_responsibility" id="id_field_disposition_responsibility"/>Disposition Responsibility</td>
					      		<td><input type="checkbox" name="report_field[]" value="quality2" id="id_quality2"/>Quality2</td>
					      		<td><input type="checkbox" name="report_field[]" value="quality3" id="id_quality3"/>Quality3</td>
					      		</tr>
					      		<span style="color: red;font-style:italic;" id="error"></span>
								</table>
								
								</td>
								
							</tr>
							<tr >
             <td  colspan="2" align="center" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate" class="submit_btn1">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1" onclick="return submit();"></td>
            
             </tr></table>
            
           
             </tr>
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>

<table  width=300 height=200>
			<tr height=30><td></td></tr></table>

<script>
function submit()
{
	alert("hi");
	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
	var startdate = document.getElementById('datepicker').value;
	var enddate = document.getElementById('datepicker1').value;
	var cost = document.getElementById('id_cost_of_nonconformance').checked;
	var error="";
	if(!cost=="" && startdate=="")
		{
		alert("asfdfdg");
	 document.getElementById("starterr").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(startdate.match(date))
	 {
		 alert("match");
	 document.getElementById("starterr").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("starterr").innerHTML="Invalid Date";
	 error="true";
	 }
	if(!cost=="" && enddate == "")
	 {
		alert("end");
	 document.getElementById("enderr").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(enddate.match(date))
	 {
		 alert("match2");
	 document.getElementById("enderr").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("enderr").innerHTML="Invalid Date";
	 error="true";
	 }

	if(error == "true")
		{
		return false;
		}
	}
</script>

<script type="text/javascript">

$(function() {
	 var format="yy-mm-dd";
          $( "#datepicker" ).datepicker();
          
        });
$(function() {
	 var format="yy-mm-dd";
          $( "#datepicker1" ).datepicker();
          
        });

 function toggle2(value){
    var e3=document.getElementById("document_type_table");
if(value=="document_list_by_type")
    {
	
	e3.style.display="table-row";
	
    }
else
    {
	
	e3.style.display="none";
  
    }
    
}
function toggle3(value){
	
    var e1=document.getElementById("userdefined_name");
    var e2=document.getElementById("userdefined_fields");
if(value==1)
    {
	
	e1.style.display="table-row";
	e2.style.display="table-row";
    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
  
    }
    
}



 function toggle1(value){
	alert(value);
	document.getElementById("reportdate").style.display="block";
    //var e1=document.getElementById("startdate");
    
if(value==2)
    {
	alert("jhsghjsa");
	document.getElementById("reportdate").style.display="block";

    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
  
    }
    
}
</script>

<script>
function checkboxvalid()
{
	var id = document.getElementById('id_field_id').checked;
	var reported_by = document.getElementById('id_field_reported_by').checked;
	var action_required = document.getElementById('id_field_corrective_action_required').checked;
	var cost = document.getElementById('id_field_cost_of_nonconformance').checked;
	var source = document.getElementById('id_field_source_of_nonconformance').checked;
	var external = document.getElementById('id_field_external_id').checked;
	var disposition_required = document.getElementById('id_field_disposition_required').checked;
	var type = document.getElementById('id_field_type_of_nonconformance').checked;	
	var product = document.getElementById('id_field_product_id').checked;
	var disposition1 = document.getElementById('docid_field_disposition1').checked;
	var disposition2 = document.getElementById('docid_field_disposition2').checked;
	var disposition3 = document.getElementById('docid_field_disposition3').checked;
	var quality1 = document.getElementById('id_quality1').checked;
	var quality2 = document.getElementById('id_quality2').checked;
	var quality3 = document.getElementById('id_quality3').checked;
	var nature = document.getElementById('id_field_nature_of_nonconformance').checked;
	var quantity = document.getElementById('id_field_quantity_suspect').checked;
	var complete_date = document.getElementById('id_field_disposition_complete_date').checked;
	var datefound = document.getElementById('id_field_date_found').checked;
	var tempaction = document.getElementById('id_field_temporary_action').checked;
	var responsibility = document.getElementById('id_field_disposition_responsibility').checked;
	
if(!id && !reported_by  && !action_required && !cost && !source && !external && !disposition_required && !type && !product && !disposition1
		&& !disposition2 && !disposition3 && !quality1 && !quality2 && !quality3 && !nature && !quantity && !complete_date && !datefound && !tempaction && !responsibility)
	{
	 document.getElementById("error").innerHTML="Please Select Atleast One";
	 error="true";
	 }
 else
	 {
	 document.getElementById("error").innerHTML="";
	 }
	 
	 if(error="true")
		 {
		 return false;
		 }
	 }
</script>

  <jsp:include page="footer.jsp"></jsp:include>