<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="qms.model.SupplierPerformance"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>

<html>
<head>
<STYLE type="text/css">
  P#mypar {font-style:calibri;
  line-height:18px;}
  
  </STYLE>
 </head>
 <body>

  <div id="right_content">
  <form method="post" action="add_supplierperformance">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
         <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Supplier</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Supplier</span>
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
              <h2>Supplier Performance Details</h2>
              
            </div>
            <div class="contentbox">
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
   				 <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="30%">Supplier ID :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="hidden" name="supplier_id" value="<c:out value="${id}"/>"/><c:out value="${id}"/><br/><span style="color: red;"></span><form:errors path="supplierperformance.supplier_id"></form:errors></td>
                
            	 <td valign="top" align="left" class="input_txt" width="30%">Website :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="website" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.website}" /><br/><span style="color: red;" id="websiteerror"><form:errors path="supplierperformance.website"></form:errors></span></td>
                </tr>
            
             
                  <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%">Supplier Name :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="supplier_name" class="input_txtbx" onInput="return validatename(id);" id="inp_supplier_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.supplier_name}" /><br/><span style="color: red;" id="nameerror"><form:errors path="supplierperformance.supplier_name"></form:errors></span></td>
           		  <td valign="top" align="left" class="input_txt" width="30%">Certified To :</td>
				<td valign="top" align="left" class="input_txt"><select	name="certified_to" class="dropdown"  id="certified">
															<option value="">--Select--</option>			
                  										<option
															<c:if test="${supplierperformance.certified_to eq 'ISO 9001'}"><c:out value="Selected"/></c:if>
															value="ISO 9001">ISO 9001</option>
														<option
															<c:if test="${supplierperformance.certified_to eq 'ISO 9002'}"><c:out value="Selected"/></c:if>
															value="ISO 9002">ISO 9002</option>
															</select><span style="color: red;" id="certifiederror"><form:errors path="SupplierPerformance.certified_to"></form:errors></span></td>
                                  
      
                </tr>
		        <tr class="row2">
				  <td valign="top" align="left" class="input_txt" width="30%">Category :</td>
				<td valign="top" align="left" class="input_txt"><select	name="category" class="dropdown" id="category">
					<option value="">--Select--</option>
				                  									
                  										<option
															<c:if test="${supplierperformance.category eq 'Critical'}"><c:out value="Selected"/></c:if>
															value="Critical">Critical</option>
														<option
															<c:if test="${supplierperformance.category eq 'Non Critical'}"><c:out value="Selected"/></c:if>
															value="Non Critical">Non Critical</option>
															</select>
															<br/><span style="color: red;" id="categoryerror"><form:errors path="SupplierPerformance.category"></form:errors></span></td>
                                  
                  <td valign="top" align="left" class="input_txt" width="30%">ContactName :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="contact_name" class="input_txtbx" id="inp_contact_name" onInput="return validatename(id);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.contact_name}" /><br/><span style="color: red;" id="contacterror"><form:errors path="supplierperformance.contact_name"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%"> Address :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">
                <%--   <input type="text" name="address" onInput="return validatename(id);" class="input_txtbx" id="inp_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.address}" /><br/><span style="color: red;" id="addresserror"><form:errors path="supplierperformance.address"></form:errors></span></td>
                 --%>  <textarea class="input_txtbx" id="inp_address" name="address"  style="height: 50px;" >${supplierperformance.address}</textarea><br/>
				<span style="color: red;" id="addresserror"><form:errors path="supplierperformance.address"></form:errors></span></td>
			
                  <td valign="top" align="left" class="input_txt" width="30%"> Title :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="contact_title" class="input_txtbx" onInput="return validatename(id);" id="inp_contact_title" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.contact_title}" /><br/><span style="color: red;" id="titleerror"><form:errors path="supplierperformance.contact_title"></form:errors></span></td>

                </tr>
				<tr class="row2">
				  <td valign="top" align="left" class="input_txt" width="30%"> City :</td>
				  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="city" class="input_txtbx" id="inp_city" onInput="return validatename(id);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.city}" /><br/><span style="color: red;" id="cityerror"><form:errors path="supplierperformance.city"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="30%"> Phone :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="phone" maxlength="10" class="input_txtbx" id="inp_phone" onkeypress="return validate(event)"; onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.phone}" /><br/><span style="color: red;" id="phoneerror"><form:errors path="supplierperformance.phone"></form:errors></span></td>

                </tr>
              	<tr class="row1">
              	<td valign="top" align="left" class="input_txt" width="30%"> State :</td>
              	<td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="state" class="input_txtbx" id="inp_state" onInput="return validatename(id);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.state}" /><br/><span style="color: red;" id="stateerror"><form:errors path="supplierperformance.state"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="30%"> Fax :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" placeholder="+1" name="fax" maxlength="13" class="input_txtbx" id="inp_fax"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.fax}" /><br/><span style="color: red;" id="faxerror"><form:errors path="supplierperformance.fax"></form:errors></span></td>

              	</tr>
                <tr class="row2">
				<td valign="top" align="left" class="input_txt" width="30%">PostalCode :</td>
				<td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="postalcode" maxlength="5" onkeypress="return validate(event)" class="input_txtbx" id="inp_postalcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.postalcode}" /><br/><span style="color: red;" id="postalerror"><form:errors path="supplierperformance.postalcode"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="30%"> Email :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="email_address" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.email_address}" /><br/><span style="color: red;" id="emailerror"><form:errors path="supplierperformance.email_address"></form:errors></span></td>

                </tr>
				<tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%">Country :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="country" class="input_txtbx" onInput="return validatename(id);" id="inp_country" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.country}" /><br/><span style="color: red;" id="countryerror"><form:errors path="supplierperformance.country"></form:errors></span></td>
                </tr>
               
               <tr class="row1">
               <td></td><td></td>
               </tr>
                 <tr class="row1">
                  <td><br>
                  <td valign="top" align="center"><input type="submit" value="Submit" onclick="return checkSubmit();" class="submit_btn1"></td>
                </tr>
              </table>

</div>
</div>
</td>
</tr>
</table>
</form></div><br><br><br>

<script>
  $(function() {
	$("#inp_supplier_name").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
  $(function() {
		$("#inp_website").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_contact_name").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_address").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_contact_title").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_city").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	/* 
  $(function() {
		$("#inp_phone").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	 */
  $(function() {
		$("#inp_state").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_fax").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_postalcode").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_email_address").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_country").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	

</script>
<!-- 	  <script>
i=0;
$(document).ready(function(){
  $("#inp_phone").keypress(function(){
var phone=document.getElementById("inp_phone").value;
phone = phone.replace(/(\d{3})(\d{3})(\d+)/, '($1)$2-$3');
document.getElementById("inp_phone").value=phone;
 });  

});
</script> -->
<script>
function validatename(id)
{
	var textInput = document.getElementById(id).value;
	textInput = textInput.replace(/[^A-Za-z ]/g, "");
	document.getElementById(id).value = textInput;
}
</script>
<script>

	function checkSubmit()
	{
		var contact = document.getElementById('inp_contact_name').value;
		var address = document.getElementById('inp_address').value;
		var title = document.getElementById('inp_contact_title').value;
		var city = document.getElementById('inp_city').value;
		var phone = document.getElementById('inp_phone').value;
		var state = document.getElementById('inp_state').value;
		var fax = document.getElementById('inp_fax').value;
		var postal = document.getElementById('inp_postalcode').value;
		var email = document.getElementById('inp_email_address').value;
		var country = document.getElementById('inp_country').value;
		var certified = document.getElementById('certified').value;
		var category = document.getElementById('category').value; 
		var error="";
		var mobile = /(\W|^)[(]{0,1}\d{3}[)]{0,1}[\s-]{0,1}\d{3}[\s-]{0,1}\d{4}(\W|$)/;
		if(certified=="")
		{
		
		document.getElementById("certifiederror").innerHTML="Required Field Should not be Empty";
		error="true";
		}
		else{
		document.getElementById("certifiederror").innerHTML="";
		}
		if(category=="")
		{
		
		document.getElementById("categoryerror").innerHTML="Required Field Should not be Empty";
		error="true";
		}
		else{
		document.getElementById("categoryerror").innerHTML="";
		}
		if(document.getElementById("inp_supplier_name").value=="")
			{
			
			document.getElementById("nameerror").innerHTML="Required Field Should not be Empty";
			error="true";
			}
		else if(document.getElementById("inp_supplier_name").value.length<4 || document.getElementById("inp_supplier_name").value.length>=32)
	    {
	    	
	    	document.getElementById("nameerror").innerHTML="Should be of length 4 to 32";
			error="true";
	    }

	    else if(document.getElementById("inp_supplier_name").value.substring(0,1)==" ")
		{
		document.getElementById("nameerror").innerHTML="Initial space not allowed";
		 error="true";
		}
		
	    else
	    	{
	    	document.getElementById("nameerror").innerHTML="";
	    	}		
		if(contact =="")
		 {
		
			 document.getElementById("contacterror").innerHTML="Required Field Should not be Empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_contact_name").value.length<4 || document.getElementById("inp_contact_name").value.length>=32)
		    {
		    	
		    	document.getElementById("contacterror").innerHTML="Should be of length 4 to 32";
		    	 error="true";
		    } 
		else if(document.getElementById("inp_contact_name").value.substring(0,1)==" ")
		{
		document.getElementById("contacterror").innerHTML="Initial space not allowed";
		 error="true";
		}
		
		    else
		    	{
		    	document.getElementById("contacterror").innerHTML="";
		    	}
		if(address =="")
		 {
		
			 document.getElementById("addresserror").innerHTML="Required Field Should not be Empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_address").value.length<5 || document.getElementById("inp_address").value.length>=500)
		    {
		    	
		    	document.getElementById("addresserror").innerHTML="Should be of length 5 to 500";
		    	 error="true";
		    } 
		else if(document.getElementById("inp_address").value.substring(0,1)==" ")
		{
		document.getElementById("addresserror").innerHTML="Initial space not allowed";
		 error="true";
		}
		
		    else
		    	{
		    	document.getElementById("addresserror").innerHTML="";
		    	}
		if(title =="")
		 {
		
			 document.getElementById("titleerror").innerHTML="Required Field Should not be Empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_contact_title").value.length<4 || document.getElementById("inp_contact_title").value.length>=32)
		    {
		    	
		    	document.getElementById("titleerror").innerHTML="Should be of length 4 to 32";
		    	 error="true";
		    } 
		else if(document.getElementById("inp_contact_title").value.substring(0,1)==" ")
		{
		document.getElementById("titleerror").innerHTML="Initial space not allowed";
		 error="true";
		}
		    else
		    	{
		    	document.getElementById("titleerror").innerHTML="";
		    	}
		if(city =="")
		 {
		
			 document.getElementById("cityerror").innerHTML="Required Field Should not be Empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_city").value.length<4 || document.getElementById("inp_city").value.length>=32)
		    {
		    	
		    	document.getElementById("cityerror").innerHTML="Should be of length 4 to 32";
		    	 error="true";
		    } 
		else if(document.getElementById("inp_city").value.substring(0,1)==" ")
		{
		document.getElementById("cityerror").innerHTML="Initial space not allowed";
		 error="true";
		}
		    else
		    	{
		    	document.getElementById("cityerror").innerHTML="";
		    	}
		if(state =="")
		 {
		
			 document.getElementById("stateerror").innerHTML="Required Field Should not be Empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_state").value.length<4 || document.getElementById("inp_state").value.length>=32)
		    {
		    	
		    	document.getElementById("stateerror").innerHTML="Should be of length 4 to 32";
		    	 error="true";
		    } 
		else if(document.getElementById("inp_state").value.substring(0,1)==" ")
		{
		document.getElementById("stateerror").innerHTML="Initial space not allowed";
		 error="true";
		}
		    else
		    	{
		    	document.getElementById("stateerror").innerHTML="";
		    	}
		if(country =="")
		 {
		
			 document.getElementById("countryerror").innerHTML="Required Field Should not be Empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_country").value.length<4 || document.getElementById("inp_country").value.length>=32)
		    {
		    	
		    	document.getElementById("countryerror").innerHTML="Should be of length 4 to 32";
		    	 error="true";
		    } 
		else if(document.getElementById("inp_country").value.substring(0,1)==" ")
		{
		document.getElementById("countryerror").innerHTML="Initial space not allowed";
		 error="true";
		}
		    else
		    	{
		    	document.getElementById("countryerror").innerHTML="";
		    	}
	

		
		var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	    
		if(email=="")
		{
		document.getElementById("emailerror").innerHTML="Required Field Should not be Empty";
		error="true";
		}
		
		else if(email.match(mail)==null)
	    {
	    	document.getElementById("emailerror").innerHTML="Invalid E-Mail Format";
	    	error="true";
	    }
		else if(email.substring(0,1)==" ")
		{
		document.getElementById("emailerror").innerHTML="Initial space not allowed";
		 error="true";
		}
		else
			{
			document.getElementById("emailerror").innerHTML="";
			}

		var zipcode =/^\d{5}$/;
		var zero = 00000;
	
	    if(postal=="")	
		{
		document.getElementById("postalerror").innerHTML="Required Field Should not be Empty";
		error="true";
		}else if(document.getElementById("inp_postalcode").value.length>5)
	    {
	    
	    	document.getElementById("postalerror").innerHTML="Should be of length 5";
	    	 error="true";
	    } 

		else if(document.getElementById("inp_postalcode").value.match(zipcode)==null)
	    {
	    	document.getElementById("postalerror").innerHTML="Invalid Postalcode Format";
	    	error="true";
	    }
	    else if(document.getElementById("inp_postalcode").value.match(zero))
	    	{
	    	document.getElementById("postalerror").innerHTML="invalid PostalCode";
	    	}
	    else
	    	{
	    	document.getElementById('postalerror').innerHTML="";
	    	}
	    
	    //var faxreg = /\+1(|\.|\-)[2-9][0-9]{2}(|\.|\-)[0-9]{3}(|\.|\-)[0-9]{4}/;
var letters = /^[A-Za-z]+$/;  
    var faxreg = /^\+?[0-9]+$/;
//	   var faxreg = /\+1(|\.|\-)[2-9][0-9]{2}(|\.|\-)[0-9]{3}(|\.|\-)[0-9]{4}/;
	    if(document.getElementById("inp_fax").value=="")	
		{
		document.getElementById("faxerror").innerHTML="Required Field Should not be Empty";
		error="true";
		}
	    else if(document.getElementById("inp_fax").value.match(faxreg)==null)
	    {
	    	document.getElementById("faxerror").innerHTML="Invalid Fax Format";
	    	error="true";
	    }
	    else if(document.getElementById("inp_fax").value.substring(0,1)==" ")
		{
		document.getElementById("faxerror").innerHTML="Initial space not allowed";
		 error="true";
		}
	    
	    else if(document.getElementById("inp_fax").value.match(letters))
	    	{
	    	alert("numeric");
	    	document.getElementById("faxerror").innerHTML="Enter Numeric Values";
	    	error="true";
	    	}
	    
	    else
	    	{
	    	document.getElementById("faxerror").innerHTML="";
	    	}

	    

	    var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
		  
	    
	    if(document.getElementById("inp_website").value=="")	
		{
		document.getElementById("websiteerror").innerHTML="Required Field Should not be Empty";
		error="true";
		}

	    else if(document.getElementById("inp_website").value.match(website)==null)
	    {
	    	document.getElementById("websiteerror").innerHTML="Invalid website Format";
	    	error="true";
	    }
	    else
	    	{
	    	document.getElementById("websiteerror").innerHTML="";
	    	}
	
	    if(phone =="")
		  {
		  document.getElementById("phoneerror").innerHTML="Required Field should not be Empty";
	    	error="true";
		  }
	  
	  else if(phone.match(mobile)){  
		  if((phone == "0000000000") || (phone == "1111111111"))
		   {
		   document.getElementById("phoneerror").innerHTML="Invalid Number";
	    	error="true";
			}
		  else
		   {
		   document.getElementById("phoneerror").innerHTML="";
		   }
	  }
	  else{
		  document.getElementById("phoneerror").innerHTML="Required Field should contain 10 digits";
	    	error="true";
	  }
  	  
    
	    if(error == "true")
	    	{
		return false;
		}
		
		
	}
	</script>

<script type="text/javascript">
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
</body>
</html>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
