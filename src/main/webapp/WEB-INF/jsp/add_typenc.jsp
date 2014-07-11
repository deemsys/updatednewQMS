<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserting Type NC</title>
</head>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"type="text/css" />
<body>
<form method="post" action="addtypenc">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:205px;">
						
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Document Prefix</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_prefixform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Form Prefix</span>
									
								</a>
							</li>
							
								<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_process" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Process</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_formlocation" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Location</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_documenttype" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span">Document Type</span>
									
								</a>
							</li>
						<%-- 	<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_revisionleveldocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Revision Level</span>
									
								</a>
							</li> --%>
						<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="setrevision" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Set Revision Format</span>
									
								</a>
							</li>	
						<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addsourcenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>"rel="ddsubmenu2">
									<span>Source of NC</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Type of NC</span>
									
								</a>
							</li>	
							 </ul>
							 <ul class="horizmenu" style=" float:left;margin-left:205px;margin-bottom:5px;">
								
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addproductidnc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Product ID</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addreportnc" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Report NC</span>
									
								</a>
							</li>		
							</li>	
							<%-- <li  style=" float:left;text-transform:uppercase;">
								<a href="add_referenceMaintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reference Attachment</span>
									
								</a>
							</li>	 --%>	
				          </ul>
				          
				         
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Add Type NC</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="50%">Type of NC :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="type_of_nc" maxlength="32" class="input_txtbx" id="typeofnc" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onInput="validateAlpha4()" value="" />
                <br>  <span id="typeofnc1" style="color:red"></span>
                  <span class="err"><form:errors path="Type_of_NC.type_of_nc"></form:errors></span></td>
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
               </td>
               </tr>
               </table>
               </form>
   
      <script type="text/javascript">
      $(function() {
  		$("#typeofnc").on("keypress", function(e) {
  			if (e.which === 32 && !this.value.length)
  		        e.preventDefault();
  		});
  		});
      function validateAlpha4(){
    	    var textInput = document.getElementById("typeofnc").value;
    	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    	    document.getElementById("typeofnc").value = textInput;
    	}
               function validation()
               {
            	   var chars = /[A-Za-z ]+$/;
            	   var typeofnc = document.getElementById('typeofnc').value;
            	   if(typeofnc == "")
            		   {
            		   document.getElementById("typeofnc1").innerHTML="Required Field Should not be Empty";
            			 return false;
            		   }
            	   else if(typeofnc.charAt(0)==" ")
            		   {
            		   document.getElementById("typeofnc1").innerHTML="Required Field Should not be Spaces";
          			 return false;
            		   }
            	   else if(typeofnc.length<4)
        		   {
        		   document.getElementById("typeofnc1").innerHTML="Required and must be of length 4 to 32";
      			 return false;
        		   }
            	   else if(typeofnc.match(chars))
            		   {
            		   document.getElementById("typeofnc1").innerHTML="";
            		   }
            	   else
            		   {
            		   document.getElementById("typeofnc1").innerHTML="Required Field Should be Alphabates";
            			 return false;
            		   
            		   }
            	   
            	   
               }
               </script>
               
</body>
</html>