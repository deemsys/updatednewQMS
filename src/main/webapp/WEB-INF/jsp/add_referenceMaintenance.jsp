<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="/QMS_App/resources/js/jquery.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="http://s.codepen.io/assets/reset/normalize.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>  	
<title>Insert title here</title>
</head>
<body>
<script>
function validation()
{
	var error="";
if(document.getElementById("frequency_maintenance").value=="")
	{
	document.getElementById("frequency_maintenanceerr").innerHTML="Required field should not be empty";
	error="true";
	}
else if(document.getElementById("frequency_maintenance").value.length<4)
{
document.getElementById("frequency_maintenanceerr").innerHTML="Required and must be of length 4 to 32";
error="true";
}
else if(document.getElementById("frequency_maintenance").value.substring(0,1)==' ')
{
document.getElementById("frequency_maintenanceerr").innerHTML="Invalid data";
error="true";
}
if(error=="true")
	{
	return false;
	}
}
function validateAlpha4(){
    var textInput = document.getElementById("frequency_maintenance").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("frequency_maintenance").value = textInput;
}


</script>
<form method="post" enctype="multipart/form-data" action="insert_reference">
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:205px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Document Prefix</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Form Prefix</span>
									
								</a>
							</li>
							
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_process" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Process</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_formlocation" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Location</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_documenttype" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span">Document Type</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_revisionleveldocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Revision Level</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="setrevision" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Set Revision Format</span>
									
								</a>
							</li>	
							<li  style=" float:left;margin-right:0px;text-transform:uppercase;">
								<a href="addsourcenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Source of NC</span>
									
								</a>
							</li>	
				           </ul>
				           <ul class="horizmenu" style=" float:left;margin-left:205px;margin-bottom:5px;">
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Type of NC</span>
									
								</a>
							</li>	
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addproductidnc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Product ID</span>
									
								</a>
							</li>	
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_referenceMaintenance" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Reference Attachment</span>
									
								</a>
							</li>		
				          </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Instruction Reference</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                	 <td valign="middle" align="left" class="input_txt" width="25%"><span class="err">Type of NC :</td>
               		<td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="frequency_maintenance" id="frequency_maintenance" class="input_txtbx"  maxlength="32" style="width:200px;" value="" onInput="validateAlpha4()"/><br/><font size="+1" color="red"><span  id="frequency_maintenanceerr"></font><form:errors path="Reference.frequency_maintenance"></form:errors></span></td>
              		<td></td>
              		<td></td>
              		</tr>
              		<tr class="row1">
              		<td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%"></td>
              		<td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
              		 <input name="attachments" id="id_file" type="file" /> <br/>
              </td>
              </tr>
  
               <tr class="row2">
               <td></td>
             <td align="right">
             <input align="left" class="submit_btn1" type="submit" id="submit"  name="submit" value="Submit" onclick="return validation('this')" ></td>
             <td>
           <!--  <input align="middle" class="submit_btn1" type="reset" id="reset_export" name="reset_export" value="Reset" ></td> -->
           
              </tr>
               </table>
              </td>
              </tr>
              </table>
              </div>
              </td>
              </table>
</form>
</body>
</html>