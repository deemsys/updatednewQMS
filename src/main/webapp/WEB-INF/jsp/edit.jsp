<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<script src="/QMS_App/resources/js/jquery.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<div>
<h2>Create a free account</h2>
 
<sf:form action="submituser" method="POST" modelAttribute="userProfile">         
   <fieldset> 
   <table cellspacing="0">
      <tr>
         <th><sf:label path="fullName">Full name:</sf:label></th>
         <td><sf:input path="fullName" id="fullname" size="30" maxlength="32" onInput="validateAlpha()"/><br/>
         <font color="red"> <span id="ferr"></span></font>     
         </td>
      </tr>
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
  	    textInput = textInput.replace(/[^A-Za-z0-9@$_]/g, "");
  	    document.getElementById("username").value = textInput;
  	}
     

      function validation()
      {
    	  var error="";
    	  if(document.getElementById("fullname").value=="")
  		{
  		//alert(""+document.getElementById("username").value);
  		document.getElementById("ferr").innerHTML="Required Field should not be empty";
  		error="true";
  		}
    	  
    	  else if(document.getElementById("fullname").value.length<4)
    		{
    		
    		document.getElementById("ferr").innerHTML="Required and must be of length 4 to 32";
    		error="true";
    		}
    	  else if(document.getElementById("fullname").value.substring(0,1)==' ')
  		{  		
  		document.getElementById("ferr").innerHTML="Initial space not allowed";
  		error="true";
  		}
    	  
    	  if(document.getElementById("username").value=="")
    		{
    		
    		document.getElementById("uerr").innerHTML="Required Field should not be empty";
    		error="true";
    		}
    	  else  if(document.getElementById("username").value.length<4)
  		{
  		
  		document.getElementById("uerr").innerHTML="Required and must be of length 4 to 32";
  		error="true";
  		}
    	  else if(document.getElementById("username").value.substring(0,1)==' ')
    		{  		
    		document.getElementById("uerr").innerHTML="Initial space not allowed";
    		error="true";
    		}
    	  if(document.getElementById("password").value=="")
  		{
  		//alert(""+document.getElementById("username").value);
  		document.getElementById("perr").innerHTML="Required Field should not be empty";
  		}
    	  else  if(document.getElementById("password").value.length<6)
    		{
    		
    		document.getElementById("perr").innerHTML="Required and must be of length 6 to 32";
    		error="true";
    		}
    	  else if(document.getElementById("password").value.substring(0,1)==' ')
  		{  		
  		document.getElementById("perr").innerHTML="Initial space not allowed";
  		error="true";
  		}
    	  if(document.getElementById("email").value=="")
  		{
  		//alert(""+document.getElementById("username").value);
  		document.getElementById("emailerr").innerHTML="Required Field should not be empty";
  		}
    	  else if(document.getElementById("email").value.substring(0,1)==' ')
  		{  		
  		document.getElementById("emailerr").innerHTML="Initial space not allowed";
  		error="true";
  		}
    	 
    	  var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    	  if(document.getElementById("email").value!=""){
    	  if(document.getElementById("email").value.match(mail)==null)
    	    {
    	    	document.getElementById("emailerr").innerHTML="Invalid E-Mail Format";    	    	
    	    	 return false;
    	    }}

if(error=="true")
	{
    	  return false;
	}
    	  
      }
      
      </script>
      <tr>
         <th><sf:label path="username">Username:</sf:label></th>
         <td><sf:input path="username" id="username" size="30" maxlength="32" onInput="validateAlpha1()"/>
              <small id="username_msg">No spaces, please.</small><br/>
               <font color="red"> <span id="uerr"></span></font>
          
             

            </td>
      </tr>
      <tr>
         <th><sf:label path="password">Password:</sf:label></th>
         <td><sf:password class="input_txt" path="password" id="password" size="30" maxlength="32"
                            showPassword="true"/> 
             <small>6 characters or more (be tricky!)</small><br/>
              <font color="red"> <span id="perr"></span></font>
            </td>
      </tr>

      <tr>
         <th><sf:label path="email">Email Address:</sf:label></th>

         <td><sf:input path="email" id="email" size="30"/> 
             <small>In case you forget something</small><br/>
              <font color="red"> <span id="emailerr"></span></font>
             
            </td>
      </tr>
      <!--<start id="image_field"/>--> 
      <tr>
        <th><label for="image">Profile image:</label></th>
        <td><input name="image" type="file"/>
      </tr>
      <!--<end id="image_field"/>--> 
      <tr>
         <th></th>
         <td>
            <sf:checkbox path="updateByEmail"/>
            <sf:label path="updateByEmail" 
            >Send me email updates!</sf:label>

         </td>
      </tr>
      <tr>
         <th></th>
         <td><input name="commit" type="submit"  onclick="return validation()"
                    value="I accept. Create my account." /></td>
      </tr>
   </table>
</fieldset>
</sf:form>
</div>
