<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<form method="post" action="update_revisionformat">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <!-- <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr> -->
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
								<a href="setrevision" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Set Revision Format</span>
									
								</a>
							</li>	
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addsourcenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Source of NC</span>
									
								</a>
							</li>	
							 <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Type of NC</span>
								</a>
							</li>
								<%-- 	<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_revisionleveldocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Revision Level</span>
									
								</a>
							</li>	 --%>			
					
							</ul>
							  <ul class="horizmenu" style=" float:left;margin-left:205px;margin-bottom:5px;">
							 
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addproductidnc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Product ID</span>
									
								</a>
							</li>	
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addreportnc" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Report NC</span>
									
								</a>
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
      <c:if test="${success=='update'}">
			<tr align="left" >
				<td valign="top" align="left" style="padding-left: 230px">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/success.png"/>
						<a title="Close" href="setrevision">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2 style="padding-left: 55px">Add Revision Format</h2>
              
             
              
              
            </div>
    <div class="contentbox">
    <TABLE border="0"><%-- <c:if test="${success=='true'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="viewdocuments">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr> --%>
		<%-- </c:if> --%>
		</TABLE>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" style="width:100%">
      
        <c:set value="${revision_No_Form.revision_Nos[0]}" var="revision"/>   
              <tr class="row2">
               
																		              <td valign="middle" align="left" class="input_txt" style="padding-left: 60px" >Revision Format :</td>
																		<td valign="top" align="left" class="input_txt">
																		 <select id="decimalno" name="first" class="dropdown" style="width:200px;">
             
              <option value="">--Select--</option>
               <option value="integer"<c:if test="${revision.first=='integer'}"><c:out value="Selected"/></c:if>>Integer</option>
               <option value="alpha"<c:if test="${revision.first=='alpha'}"><c:out value="Selected"/></c:if>>Alphabet</option>
             <%--   <option value="romain"<c:if test="${revision.first=='romain'}"><c:out value="Selected"/></c:if>>Romain</option> --%>
               </select><br>	<span id="nullvalue" style="color:red"></span>
																		
																		</td>
																		<td valign="top" align="left" class="input_txt">
																		 <select id="floorno" name="second" class="dropdown" style="width:200px;">
             <option value="">--Select--</option>
               <option value="integer"<c:if test="${revision.second=='integer'}"><c:out value="Selected"/></c:if>>Integer</option>
               <option value="alpha"<c:if test="${revision.second=='alpha'}"><c:out value="Selected"/></c:if>>Alphabet</option>
              <%--  <option value="romain"<c:if test="${revision.second=='romain'}"><c:out value="Selected"/></c:if>>Romain</option> --%>
               </select>
																							
																		</td>
     
     </tr>
      
       <tr class="row1">
            <td></td>  <td ><br>
             <input type="submit" id="export" style="align:center;"  name="export" value="Submit" onclick="return validation();"class="submit_btn1"></td>
            <!--  <td colspan="1">
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td> -->
<td></td><td></td>
</tr>
       </td>
       </tr>
       </table>
       </div>
       </td>
       </tr>
       </table>
       </form>  
       <script type="text/javascript">
function validation()
{
	var error="";
  if((document.getElementById('decimalno').value =="")&&(document.getElementById('floorno').value ==""))
	  {	  
	  document.getElementById("nullvalue").innerHTML="Required field should not be empty";
		error="true";
	  }
	else  if((document.getElementById('decimalno').value==""))
	  {	  
	  document.getElementById("nullvalue").innerHTML="Required field should not be empty";
		error="true";
	  }
	  if(error=="true")
	  {
	  return false;
	  }
	  
}

</script>
</body>
</html>