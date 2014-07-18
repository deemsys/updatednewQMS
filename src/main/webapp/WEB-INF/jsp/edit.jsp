<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Signup Page</title> 
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"  type="text/css" />
<!-- <script src="/QMS_App/resources/js/jquery.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script> -->
<script src="resources/js/modal.js"></script>
<style>
.errorblock {
	color: #eaeaea; 
	background-color: #eaeaea;
	border: 3px solid #eaeaea;
	padding: 8px;
	margin: 16px;
}
</style>
<script>

function Alphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode == 32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}

function AlphabetsNumber(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}




</script>
<script>
function validation()
{
	var error="";
	var fullname = document.getElementById('fullname').value;
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	var email = document.getElementById('email').value;
	var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	  
	
	
	if(fullname == "")
	{
		
	 document.getElementById("ferr").innerHTML="Required field should not be empty";
	 error="true";
	
	}
	
	else if(fullname.charAt(0) == " ")
	{
		document.getElementById("ferr").innerHTML="Required field should not accept initial space";
		 error="true";
	}
	else if((fullname.length < 4) ||(fullname.length > 32))
	{
	document.getElementById("ferr").innerHTML="Required field should be length of 4 to 32";
	error="true";
	
	}
	else
	{
	document.getElementById("ferr").innerHTML="";
	}
	
	if(username == "")
	{
		
	 document.getElementById("uerr").innerHTML="Required field should not be empty";
	 error="true";
	
	}
	
	else if(username.charAt(0) == " ")
	{
		document.getElementById("uerr").innerHTML="Required field should not accept initial space";
		 error="true";
	}
	else if((username.length < 4) ||(username.length > 32))
	{
	document.getElementById("uerr").innerHTML="Required field should be length of 4 to 32";
	error="true";
	
	}
	else
	{
	document.getElementById("uerr").innerHTML="";
	}
	  
	if(password == "")
	{
		
	 document.getElementById("perr").innerHTML="Required field should not be empty";
	 error="true";
	
	}
	
	else if(password.charAt(0) == " ")
	{
		document.getElementById("perr").innerHTML="Required field should not accept initial space";
		 error="true";
	}
	else if((password.length < 4) ||(password.length > 32))
	{
	document.getElementById("perr").innerHTML="Required field should be length of 4 to 32";
	error="true";
	
	}
	else
	{
	document.getElementById("perr").innerHTML="";
	}
	 
	  if(email =="")
	  {
	  document.getElementById("emailerr").innerHTML="Required field should not be empty";
  	error="true";
	  }
	  else if(email.charAt(0) ==" ") 
	   {
	   document.getElementById("emailerr").innerHTML="Required field Should not accept initial space";
	error="true";
		}
else if(email.match(mail)){  
	  
	   document.getElementById("emailerr").innerHTML="";
	  
	   }

else{
	  document.getElementById("emailerr").innerHTML="Invalid email format";
  	error="true";
}
	
	   
	    if(error == "true")
		{
	    	//alert("er");
		return false;
		}
	    
}

</script>
<script>
function AlphabetsNumber(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}


</script>
 <script>
      $(function() {
    	    $("#password").keydown(function(e) {
    	        if (e.keyCode == 32) // 32 is the ASCII value for a space
    	            e.preventDefault();
    	    });
    	});
      $(function() {
  		$("#fullname").on("keypress", function(e) {
  			if (e.which === 32 && !this.value.length)
  		        e.preventDefault();
  		});
  		});
      $(function() {
  		$("#username").on("keypress", function(e) {
  			if (e.which === 32 && !this.value.length)
  		        e.preventDefault();
  		});
  		});
      $(function() {
  		$("#email").on("keypress", function(e) {
  			if (e.which === 32 && !this.value.length)
  		        e.preventDefault();
  		});
  		});
      function validateAlpha(){
    	    var textInput = document.getElementById("fullname").value;
    	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    	    document.getElementById("fullname").value = textInput;
    	}
      function validateAlpha1(){
  	    var textInput = document.getElementById("username").value;
  	    textInput = textInput.replace(/[^A-Za-z0-9@_.]/g, "");
  	    document.getElementById("username").value = textInput;
  	}
     

      
      </script>
</head>
<body>

<div id="login_div" style="margin-left:500px;">
		  <div class="login-top">
		 
		  
		  </div>
		  <div class="login-center" style="width:500px;">
		  <ul class="login-list">
		  <li  style="background-color:#FFFFD6;"><h3 style="font-family:verdana;background-color:gainsboro;padding:10px;font-weight:bolder;text-align:center;border:solid 1px brown;"><font color="#993300">Create a Free Account</font></h3>
		  </li>
		  </ul>
<h2></h2>
 
<sf:form action="submituser" method="POST" modelAttribute="userProfile">         
   <fieldset> 
   <ul class="login-list" style="margin-left:50px;">
		   <li>
<BR/>
	 <table cellpadding="0" cellspacing="0" border="0" width="300">
	 <td  style="width:70%" valign="top">
	
		       <b> <font color="#993300">&nbsp;&nbsp;Full Name:</font></b>
		     </td>
		     
		      <td style="width: 512px; "><sf:input path="fullName" id="fullname" size="30" maxlength="32" onkeypress="return Alphabets(event,this);"/><br/>
     <span id="ferr" style="color: red;font-style:italic;"></span>
        </td>
		      </table>
		      </li>
		       <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td  style="width:70%" valign="top">
		        <b><font color="#993300">&nbsp;&nbsp;UserName:</font></b></td>
		       <td style="width: 512px; "> <sf:input path="username" id="username" onInput="return validateAlpha1();" size="30" maxlength="32" />
             <!--  <b><font color="#993300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</font></b> <small id="username_msg"></small><br/> -->
             <span id="uerr" style="color: red;font-style:italic;"></span>
		        </table>
  
   
     
      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td style="width:70%" valign="top">
		        <b><font color="#993300">&nbsp;&nbsp;Password:</font></b></td>
		      
		      <td style="width: 512px; "><sf:password class="input_txt" path="password" id="password" size="30"  maxlength="32" showPassword="true"/> 
             <!-- <small>6 characters or more (be tricky!)</small><br/> -->
              <span id="perr" style="color: red;font-style:italic;"></span>
		      </td>
		      </table>
	
<li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td style="width:70%" valign="top">
		        <b><font color="#993300">&nbsp;&nbsp;Email Address:</font></b>
		        </td>
		      
		      
		      <td style="width: 512px; "><sf:input path="email" id="email" size="30"/> 
         
             <span id="emailerr" style="color: red;font-style:italic;"></span>
		      </td>
		      </table>
		      </li>
     <li>
		     
		      </li>
      <!--<start id="image_field"/>--> 
     <!--  <tr>
        <th><label for="image">Profile image:</label></th>
        <td><input name="image" type="file"/>
      </tr> -->
      <!--<end id="image_field"/>--> 
     
     
     <li><br>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      
		      <a href="#">
		        <input name="commit" type="submit" class="submit_btn1" value="I accept. Create my account." style="width:200px;height:30px;" onclick="return validation()">
		        </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" class="submit_btn1" value="Back to Login" onclick="window.location.href='login'">
		    
		         <!-- <td><button type="reset" class="submit_btn" value="Reset">Reset</button></td> -->
		
		
		  </table></li>
		  
     <!--  <tr>
         <th></th>
         <td><input name="commit" type="submit"  onclick="return validation()"
                    value="I accept. Create my account." /></td>
      </tr>
   </table> -->
   
   
</fieldset>
</sf:form>

</ul>
		  </div>
		  <div class="login-bottom"></div>
		</div>

</body>

</html>