<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="updatecustomer">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        	 <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Customers</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewcustomers" class="<c:choose>
								<c:when test="${menu=='customer'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Customers</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addfeedback" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewfeedback" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="feedback_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Feedback Report</span>
									
								</a>
							</li>
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Customer</h2>
            </div>
            <div class="contentbox">
            <c:set value="${customersForm.customers[0]}" var="customers"/>
             <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
				 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">ID:</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="hidden" name="customer_id" value="<c:out value="${customers.customer_id}"/>"/><c:out value="${customers.customer_id }"/><br/><span class="err"></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%">Website:</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="website" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.website}" onInput="return validatename1(id);"/><br>
                   <span id="websiteerror" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.website"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Customer Name:</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="customer_name" class="input_txtbx" id="customername" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.customer_name}" onInput="return validatename(id);"/><br>
                   <span id="customernameerror"style="color:red"></span>
                  <span class="err"><form:errors path="Customers.customer_name"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%">Contactname</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="contact_name" class="input_txtbx" id="inp_contact_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.contact_name}" onInput="return validatename(id);" /><br>
                   <span id="contactnameerror" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.contact_name"></form:errors></span></td>
                </tr>
				<tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Address:</td>
               		<td><textarea class="input_txtbx" id="inp_address" name="address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="height: 75px;"><c:out value="${customers.address}"/>	</textarea><br/>
               		<span id="addresserror" style="color:red"></span>
               		<span class="err"><form:errors path="Customers.address"></form:errors></span></td>
               		 <td valign="middle" align="left" class="input_txt" width="30%">Contact Title:</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="title_of_contact" class="input_txtbx" id="inp_title_of_contact" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.title_of_contact}"  onInput="return validatename(id);"/><br>
                  <span id="contacterror" style="color:red"></span><span class="err"><form:errors path="Customers.title_of_contact"></form:errors></span></td>
                
               	</tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">City:</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="city" class="input_txtbx" id="inp_city" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.city}"  onInput="return validatename(id);"/><br>
                   	<span id="cityerror" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.city"></form:errors></span></td>
                 <td valign="middle" align="left" class="input_txt" width="30%"> Telephone :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="telephone" class="input_txtbx" id="inp_telephone" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.telephone}"  onInput="return validatename2(id);"/><br>
                    <span id="telephoneerror" style="color:red">
                  <span class="err"><form:errors path="Customers.telephone"></form:errors></span></td>
                 
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">State:</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="state" class="input_txtbx" id="inp_state" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.state}"  onInput="return validatename(id);"/><br>
                    <span id="stateerror" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.state"></form:errors></span></td>
                   <td valign="middle" align="left" class="input_txt" width="30%"> Fax :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="fax" class="input_txtbx" id="inp_fax" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.fax}"  onInput="return validatename1(id);"/><br>
                   <span id="faxerror" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.fax"></form:errors></span></td>
                  
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Country:</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="country" class="input_txtbx" id="inp_country" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.country}"  onInput="return validatename(id);"/><br>
                  <span id="countryerror" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.country"></form:errors></span></td>
                   <td valign="middle" align="left" class="input_txt" width="30%">Email:</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="email_address" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.email_address}" onInput="return validatename1(id);"/><br>
                   <span id="emailerror" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.email_address"></form:errors></span></td>
                 
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">ZipCode:</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="zipcode" class="input_txtbx" id="inp_zipcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customers.zipcode}"  onInput="return validatename2(id);"/><br>
                   	<span id="zipcodeerror" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.zipcode"></form:errors></span></td>
                
                </tr>
                 <tr class="row1">
                  
                  <td colspan ="3" valign="middle" align="right"><input type="submit" value="Update Customer" style="width:140px;"onclick="return validate();"class="submit_btn1"></td>
                </tr>
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
 <script>
$(function() {

	$("#customername").on("keypress", function(e) {
		
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
	$("#inp_city").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#inp_title_of_contact").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#inp_state").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#inp_telephone").on("keypress", function(e) {
	
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
$(function() {
	$("#inp_fax").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#inp_zipcode").on("keypress", function(e) {
	
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

  </script>  
     <script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById(id).value = textInput;
}  
function validatename1(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[ ]/g, "");
    document.getElementById(id).value = textInput;
}  
function validatename2(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}  
</script>
      <script type="text/javascript">
      function validate()
      {
    	  var error="";
    	  var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
    	  var mobile = /(\W|^)[(]{0,1}\d{3}[)]{0,1}[\s-]{0,1}\d{3}[\s-]{0,1}\d{4}(\W|$)/;
    	  var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
    	  var faxreg = /\+1(|\.|\-)[2-9][0-9]{2}(|\.|\-)[0-9]{3}(|\.|\-)[0-9]{4}/;
    	  var zipcode =/^\d{5}$|^\d{5}-\d{4}$/;
    	  var customername = document.getElementById('customername').value;
    	  var inp_website = document.getElementById('inp_website').value;
    	  var inp_contact_name = document.getElementById('inp_contact_name').value;
    	  var address = document.getElementById('inp_address').value;
    	  var city = document.getElementById('inp_city').value;
    	  var contact = document.getElementById('inp_title_of_contact').value;
    	  var state = document.getElementById('inp_state').value;
    	  var telephone = document.getElementById('inp_telephone').value;
    	  var country = document.getElementById('inp_country').value;
    	  var fax = document.getElementById('inp_fax').value;
    	  var inpzipcode = document.getElementById('inp_zipcode').value;
    	  var  emailaddress= document.getElementById('inp_email_address').value;
    	  if(customername =="")
    		  {
    		  document.getElementById("customernameerror").innerHTML="Required Field should not be Empty";
  	    	  error="true";
    		  }
    	  else if(customername.charAt(0) == " ")
    		  {
    		  document.getElementById("customernameerror").innerHTML="Required Field should not Start with Spaces";
  	    	  error="true";
    		  }
    	  else  if((customername.length < 4) ||(customername.length > 32))
    		   {
    		   document.getElementById("customernameerror").innerHTML="Required Field should be Length of 4 to 32";
    	    	error="true";
 				}
    	   else
    		   {
    		   document.getElementById("customernameerror").innerHTML="";
    		   }
    	  
    	  
    	  if(inp_website == "")
    		  {
    		  document.getElementById("websiteerror").innerHTML="Required Field should not be Empty";
	   	    	error="true";
    		  }
    	  else if(inp_website.charAt(0) ==" ") 
		   {
		   document.getElementById("websiteerror").innerHTML="Initial Spaces not Allowed";
	    	error="true";
			}
    	  else  if(inp_website.match(website))
    		   {
    		  
    			   document.getElementById("websiteerror").innerHTML="";
    		   }
    		   
    	   else
    		   {
    		   document.getElementById("websiteerror").innerHTML="Invalid URL";
	   	    	error="true";
    		   }
    	   
    	  
    	  
    	
    	  
    	  
    	  if(address =="")
		  {
		  document.getElementById("addresserror").innerHTML="Required Field should not be Empty";
	    	error="true";
		  }
    	  else if(address.charAt(0) ==" ") 
		   {
		   document.getElementById("addresserror").innerHTML="Initial Spaces not Allowed";
	    	error="true";
			}
	  else  if((address.length < 4) ||(address.length > 400))
		   {
		   document.getElementById("addresserror").innerHTML="Required Field should be Length of 4 to 400";
	    	error="true";
			}
	   else
		   {
		   document.getElementById("addresserror").innerHTML="";
		   }
    	  
    	  
    	  if(inp_contact_name =="")
		  {
		  document.getElementById("contactnameerror").innerHTML="Required Field should not be Empty";
	    	error="true";
		  }
    	  else if(inp_contact_name.charAt(0) ==" ") 
		   {
		   document.getElementById("contactnameerror").innerHTML="Initial Spaces not Allowed";
	    	error="true";
			}
	 	 else  if((inp_contact_name.length < 4) ||(inp_contact_name.length > 32))
		   {
		   document.getElementById("contactnameerror").innerHTML="Required Field should be Length of 4 to 32";
	    	error="true";
			}
	   else
		   {
		   document.getElementById("contactnameerror").innerHTML="";
		   }
    	  
    	  
    	  if(city =="")
		  {
		  document.getElementById("cityerror").innerHTML="Required Field should not be Empty";
	    	error="true";
		  }
    	  else if(city.charAt(0) ==" ") 
		   {
		   document.getElementById("cityerror").innerHTML="Initial Spaces not Allowed";
	    	error="true";
			}
	  else  if((city.length < 4) ||(city.length > 32))
		   {
		   document.getElementById("cityerror").innerHTML="Required Field should be Length of 4 to 32";
	    	error="true";
				}
	   else
		   {
		   document.getElementById("cityerror").innerHTML="";
		   }
    	  
    	  
    	  if(contact =="")
		  {
		  document.getElementById("contacterror").innerHTML="Required Field should not be Empty";
	    	error="true";
		  }
    	  else if(contact.charAt(0) ==" ") 
		   {
		   document.getElementById("contacterror").innerHTML="Initial Spaces not Allowed";
	    	error="true";
			}
	  else  if((contact.length < 4) ||(contact.length > 32))
		   {
		   document.getElementById("contacterror").innerHTML="Required Field should be Length of 4 to 32";
	    	error="true";
				}
	   else
		   {
		   document.getElementById("contacterror").innerHTML="";
		   }
    	  
    	  
    	  if(state =="")
		  {
		  document.getElementById("stateerror").innerHTML="Required Field should not be Empty";
	    	error="true";
		  }
    	  else if(state.charAt(0) ==" ") 
		   {
		   document.getElementById("stateerror").innerHTML="Initial Spaces not Allowed";
	    	error="true";
			}
	  else  if((state.length < 4) ||(state.length > 32))
		   {
		   document.getElementById("stateerror").innerHTML="Required Field should be Length of 4 to 32";
	    	error="true";
				}
	   else
		   {
		   document.getElementById("stateerror").innerHTML="";
		   }	  
    	  
    	  if(telephone =="")
		  {
		  document.getElementById("telephoneerror").innerHTML="Required Field should not be Empty";
	    	error="true";
		  }
    	  else if(telephone.charAt(0) ==" ") 
		   {
		   document.getElementById("telephoneerror").innerHTML="Initial Spaces not Allowed";
	    	error="true";
			}
	  else if(telephone.match(mobile)){  
		  if((telephone == "0000000000") || (telephone == "1111111111"))
		   {
		   document.getElementById("telephoneerror").innerHTML="Invalid Number";
	    	error="true";
			}
		  else
		   {
		   document.getElementById("telephoneerror").innerHTML="";
		   }
	  }
	  else{
		  document.getElementById("telephoneerror").innerHTML="Required Field should contain 10 digits";
	    	error="true";
	  }
    	  
      
	  if(country =="")
	  {
	  document.getElementById("countryerror").innerHTML="Required Field should not be Empty";
    	error="true";
	  }
	  else if(country.charAt(0) ==" ") 
	   {
	   document.getElementById("countryerror").innerHTML="Initial Spaces not Allowed";
  	error="true";
		}
  	else  if((country.length < 4) ||(country.length > 32))
	   {
	   document.getElementById("countryerror").innerHTML="Required Field should be Length of 4 to 32";
    	error="true";
		}
   else
	   {
	   document.getElementById("countryerror").innerHTML="";
	   }
	  
	  
	  if(fax =="")
	  {
	  document.getElementById("faxerror").innerHTML="Required Field should not be Empty";
    	error="true";
	  }
	  else if(fax.charAt(0) ==" ") 
	   {
	   document.getElementById("faxerror").innerHTML="Initial Spaces not Allowed";
 	error="true";
		}
  else if(fax.match(faxreg))
	   {
	   document.getElementById("faxerror").innerHTML="";
    	
		}
	  
   else
	   {
	   
	  document.getElementById("faxerror").innerHTML="Invalide Fax Number";
   	error="true";
      }
	  
	  
	  
	  if(inpzipcode =="")
	  {
	  document.getElementById("zipcodeerror").innerHTML="Required Field should not be Empty";
    	error="true";
	  }
	  else if(inpzipcode.charAt(0) ==" ") 
	   {
	   document.getElementById("zipcodeerror").innerHTML="Initial Spaces not Allowed";
	error="true";
		}
  	else if(inpzipcode.match(zipcode)){  
	  
	   document.getElementById("zipcodeerror").innerHTML="";
	   }
  
  else{
	  document.getElementById("zipcodeerror").innerHTML="Required Field should contain 5 digits";
    	error="true";
  }
	  
	  
	  if(emailaddress =="")
	  {
	  document.getElementById("emailerror").innerHTML="Required Field should not be Empty";
    	error="true";
	  }
	  else if(emailaddress.charAt(0) ==" ") 
	   {
	   document.getElementById("emailerror").innerHTML="Initial Spaces not Allowed";
	error="true";
		}
  else if(emailaddress.match(mail)){  
	  
	   document.getElementById("emailerror").innerHTML="";
	   }
  
  else{
	  document.getElementById("emailerror").innerHTML="Invalid Email Format";
    	error="true";
  }
  
    	  if(error=="true")
    		  {
    		 
    		  return false;
    		  }
    	  
      }
      
      </script>
      <jsp:include page="footer.jsp"></jsp:include>
