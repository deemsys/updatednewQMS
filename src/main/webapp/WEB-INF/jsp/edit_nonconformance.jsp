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
	              <h2>Non Conformance</h2>
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
				                  
				                	<td valign="middle" align="left" class="input_txt"> External ID </td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" value="<c:out value="${nonconformance.external_id}"/>"  class="input_txtbx1" id="inp_external_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="external_id" /><br><span class="err"><form:errors path="Nonconformance.external_id"></form:errors></span></td>
				                </tr>
				                

								 <tr class="row2">
						         	<td valign="middle" align="left" class="input_txt"> Source of NC </td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="source_of_nonconformance" class="input_cmbbx1">
						                    <option <c:if test="${nonconformance.source_of_nonconformance eq 'Internal Audit'}"><c:out value="Selected"/></c:if> value="Internal Audit" >Internal Audit</option>
											<option <c:if test="${nonconformance.source_of_nonconformance eq 'Customer Audit'}"><c:out value="Selected"/></c:if> value="Customer Audit">Customer Audit</option>
											<option  <c:if test="${nonconformance.source_of_nonconformance eq 'Third Party Audit'}"><c:out value="Selected"/></c:if> value="Third Party Audit">Third Party Audit</option>
											<option <c:if test="${nonconformance.source_of_nonconformance eq 'Incoming Inspection'}"><c:out value="Selected"/></c:if> value="Incoming Inspection">Incoming Inspection</option>
				                   			<option <c:if test="${nonconformance.source_of_nonconformance eq 'Customer Complaint'}"><c:out value="Selected"/></c:if> value="Customer Complaint">Customer Complaint</option>
				                   	<c:forEach items="${conformance_SourceForm.conformance_Sources}" var="sources" varStatus="status">
        				       <option value="${sources.source_of_nc}"<c:if test="${sources.source_of_nc == nonconformance.source_of_nonconformance}"><c:out value="selected"/></c:if>>${sources.source_of_nc}</option>
			                  </c:forEach>
				                   		</select>
				                   		<br><font color="Red" size="+1"></font></td>
						         	
					            	<td valign="middle" align="left" class="input_txt"> Product ID </td>
					                      	<td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.product_id}" class="input_txtbx1" id="inp_product_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="product_id" /><br><span class="err"><form:errors path="Nonconformance.product_id"></form:errors></span></td>
				           
					                  </tr>
								 
								<tr class="row1">
				                  	<td valign="middle" align="left" class="input_txt"> Type of NC </td>
				                  	<td valign="top" align="left" class="input_txt">
				                  		<select name="type_of_nonconformance" class="input_cmbbx1">
						                    <option <c:if test="${nonconformance.type_of_nonconformance eq 'Product Quality'}"><c:out value="Selected"/></c:if> value="Product Quality" >Product Quality</option>
											<option <c:if test="${nonconformance.type_of_nonconformance eq 'Service Quality'}"><c:out value="Selected"/></c:if>  value="Service Quality">Service Quality</option>
											<option  <c:if test="${nonconformance.type_of_nonconformance eq 'Late Delivery'}"><c:out value="Selected"/></c:if>  value="Late Delivery">Late Delivery</option>
											<option <c:if test="${nonconformance.type_of_nonconformance eq 'Early Delivery'}"><c:out value="Selected"/></c:if> value="Early Delivery">Early Delivery</option>
				                	
				                   		</select>
				                   	</td>
				                 	<td valign="middle" align="left" class="input_txt"> Quantity Suspect </td>
				                                     	<td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.quantity_suspect}" class="input_txtbx1" id="inp_quantity_suspect" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="quantity_suspect" /><br><span class="err"><form:errors path="Nonconformance.quantity_suspect"></form:errors></span></td>
				    	</tr>
						
				                <tr class="row2">
									<td valign="top" align="left" class="input_txt"> Nature Of NC </td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.nature_of_nonconformance}"  class="input_txtbx1" id="inp_nature_of_nonconformance" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="nature_of_nonconformance" /><br><span class="err"><form:errors path="Nonconformance.nature_of_nonconformance"></form:errors></span></td>
				               
				                
				                	
			                  <td valign="top" align="left" class="input_txt"> Disposition Required(Y/N) </td>
			        		        
			        		        <td valign="middle" align="left" class="input_txt" width="70%">
                	                            <input type="radio" name="disposition_required" value="Yes" onchange="toggle3(this.value);"  id="disposition_required_yes"<c:if test="${nonconformance.disposition_required=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
                	                            <input type="radio" name="disposition_required" value="No" id="disposition_required_no" onchange="toggle3(this.value);"  <c:if test="${nonconformance.disposition_required=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span></td>
                	           </tr>
								 <tr class="row1">
				                 	<td valign="middle" align="left" class="input_txt"> Date Found </td>
				                  	                        	<td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.date_found}" class="input_txtbx1" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="date_found" /><br><span class="err"><form:errors path="Nonconformance.date_found"></form:errors></span></td>
				  
				                
                	          
				                  	<td valign="middle" align="left" class="input_txt"> Disposition </td>
				                  	<td valign="top" align="left" class="input_txt">
				                  		<select name="disposition" class="input_cmbbx1">
						                    <option <c:if test="${nonconformance.disposition eq 'Discard'}"><c:out value="Selected"/></c:if> value="Discard" >Discard</option>
											<option <c:if test="${nonconformance.disposition eq 'Keep as is'}"><c:out value="Selected"/></c:if> value="Keep as is">Keep as is</option>
										</select>
				                   	</td> </tr>
								<tr class="row2">
				                	<td valign="top" align="left" class="input_txt"> Reported By </td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.reported_by}"  class="input_txtbx1" id="inp_reported_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="reported_by" /><br><span class="err"><form:errors path="Nonconformance.reported_by"></form:errors></span></td>
				                  	<td valign="top" align="left" class="input_txt"> Disposition Complete Date:</td>
			                                	<td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.disposition_complete_date}" class="input_txtbx1" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="disposition_complete_date" /><br><span class="err"><form:errors path="Nonconformance.disposition_complete_date"></form:errors></span></td>
				      
			          
				       	</tr>
						                 
   						  		<tr class="row1">
			   						<td valign="middle" align="left" class="input_txt"> Temporary Action </td>
               						<td valign="top" align="left" width="20%"><textarea class="input_txtbx1" id="temporary_action"  name="temporary_action"  style="width:20%; height: 50px;" >${nonconformance.temporary_action}</textarea><br/><span class="err"></span></td>
         							<td valign="top" align="left" class="input_txt"> Disposition Responsibility </td>
			                        <td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.name_of_disposition_responsibility}" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="name_of_disposition_responsibility" /><br/><span class="err"><form:errors path="Nonconformance.name_of_disposition_responsibility"></form:errors></span></td>
				        		</tr>
		  					
		  					<tr class="row2">
                  				   	<td valign="middle" align="left" class="input_txt"> Corrective Action Required(Y/N) </td>
                  				 
                  				                   <td valign="middle" align="left" class="input_txt" width="70%">
                			 					<input type="radio" name="corrective_action_required" value="Yes" onchange="toggle3(this.value);"  id="corrective_action_required_yes" <c:if test="${nonconformance.corrective_action_required=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
                			 					<input type="radio" name="corrective_action_required" value="No" id="corrective_action_required_no" onchange="toggle3(this.value);"  <c:if test="${nonconformance.corrective_action_required=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span></td>
                			 
                			 
			    	                <td valign="top" align="left" class="input_txt"> Cost of NC </td>
			   	                 	<td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.cost_of_nonconformance}" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="cost_of_nonconformance" /><br/><span class="err"><form:errors path="Nonconformance.cost_of_nonconformance"></form:errors></span></td>
				          </tr>
     
                <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn1" value="Update" onclick="update.submit()"></td>
            </tr>
    </table>
    
   </div>
   </td>
   </tr>
   </table>
   </form>
    </div>
            
      
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<script>
 $(function() {
	 var format="yy-mm-dd";
           $( "#datepicker" ).datepicker();
           
         });
 
 $(function() {
           $( "#datepicker1" ).datepicker();
         });
</script> 
<jsp:include page="footer.jsp"></jsp:include>