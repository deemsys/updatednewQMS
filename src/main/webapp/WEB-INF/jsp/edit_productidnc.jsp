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
<title>Edit Product ID NC</title>
</head>
<body>
<form method="post" action="update_productid">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span >Add Product Id</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="typeNC_list" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span >View Product Id</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Editing Product Id</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${productId_NC_Form.productIDNCs[0]}" var="products"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="middle" align="left" class="input_txt" width="30%">Product Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="hidden" name="auto_id" value="${products.auto_id}"/>
                  <input type="text" name="productid_nc" class="input_txtbx" maxlength="32" id="productidnc" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${products.productid_nc}" onInput="validateAlpha4()" />
                   <span id="productidnc1" style="color:red"></span>
                  <span class="err"><form:errors path="ProductIDNC.productid_nc"></form:errors></span>
                  
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
             <tr height="350"><td></td></tr>
             </table>
             </div>
             </form>
            <script type="text/javascript">
            $(function() {
          		$("#productidnc").on("keypress", function(e) {
          			if (e.which === 32 && !this.value.length)
          		        e.preventDefault();
          		});
          		});
              function validateAlpha4(){
            	    var textInput = document.getElementById("productidnc").value;
            	    textInput = textInput.replace(/[^A-Z0-9]/g, "");
            	    document.getElementById("productidnc").value = textInput;
            	}
               function validation()
               {
            	   var number = /^[A-Z0-9]+$/;
            	   var productidnc = document.getElementById('productidnc').value;
            	   if(productidnc == "")
            		   {
            		   document.getElementById("productidnc1").innerHTML="Required Field Should not be Empty";
            			 return false;
            		   }
            	   else if(productidnc.charAt(0)==" ")
            		   {
            		   document.getElementById("productidnc1").innerHTML="Required Field Should not be Spaces";
          			 return false;
            		   }
            	   else if(productidnc.length<4)
        		   {
        		   document.getElementById("productidnc1").innerHTML="Required and must be of length 4 to 32";
        			 return false;
        		   }
            	   else if(productidnc.match(number))
            		   {
            		   document.getElementById("productidnc1").innerHTML="";
            		   }
            	   else
            		   {
            		   document.getElementById("productidnc1").innerHTML="Required Field Should be Captial Alpha-Numeric";
            			 return false;
            		   
            		   }
            	   
            	   
               }
               </script>      
</body>
<jsp:include page="footer.jsp"></jsp:include> 
</html>