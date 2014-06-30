<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Type of NC</title>
</head>
<body>
<form method="post" action="update_type">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">Add Type of NC</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="typeNC_list" class="<c:choose>
								<c:when test="${menu=='admin'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blueactive">View Type of NC</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Editing Type of NC</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${type_of_NC_Form.type_of_NCs[0]}" var="types"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="middle" align="right" class="input_txt" width="30%">Type of NC :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="hidden" name="auto_id" value="${types.auto_id}"/>
                  <input type="text" name="type_of_nc" class="input_txtbx" id="typeofnc" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${types.type_of_nc}" />
                  <span id="typeofnc1" style="color:red"></span>
                  <span class="err"><form:errors path="Type_of_NC.type_of_nc"></form:errors></span>
                  
                  </td>
                </tr>
                  <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" onclick="return validation();"class="submit_btn1"></td>
                </tr>
             </table>
             </td>
             </tr>
             </table>
             </div>
             </div>
             </td>
             </tr>
             </table>
             </div>
             </form>
            <script type="text/javascript">
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
<jsp:include page="footer.jsp"></jsp:include> 
</html>