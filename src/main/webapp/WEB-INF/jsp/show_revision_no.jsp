<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<form method="post" action="update_documentrevisionlevel">
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
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
						
				           </ul>
  </div>
      </td>
      </tr>
      
       <tr>
      
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Revision Format</h2>
              
             
              
              
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
      
        <c:set value="${revision_No_Form.revision_Nos[0]}" var="revision"/>   
              <tr class="row2">
               
																		              <td valign="middle" align="left" class="input_txt" >Revision Format:</td>
																		<td valign="top" align="left" class="input_txt">
																		 <select id="decimalno" name="first" class="input_cmbbx1" style="width:200px;">
             
              <option value="">--Select--</option>
               <option value="integer"<c:if test="${revision.first=='integer'}"><c:out value="Selected"/></c:if>>Integer</option>
               <option value="alpha"<c:if test="${revision.first=='alpha'}"><c:out value="Selected"/></c:if>>Alphabet</option>
             <%--   <option value="romain"<c:if test="${revision.first=='romain'}"><c:out value="Selected"/></c:if>>Romain</option> --%>
               </select>
																		
																		</td>
																		<td valign="top" align="left" class="input_txt">
																		 <select id="floorno" name="second" class="input_cmbbx1" style="width:200px;">
             <option value="">--Select--</option>
               <option value="integer"<c:if test="${revision.second=='integer'}"><c:out value="Selected"/></c:if>>Integer</option>
               <option value="alpha"<c:if test="${revision.second=='alpha'}"><c:out value="Selected"/></c:if>>Alphabet</option>
              <%--  <option value="romain"<c:if test="${revision.second=='romain'}"><c:out value="Selected"/></c:if>>Romain</option> --%>
               </select>
																		
																		</td>
     
     </tr>
       </table>
       <tr class="row1">
              <td colspan="1" align="right">
             <input type="submit" id="export"  name="export" value="Submit" class="submit_btn1"></td>
             <td colspan="1">
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td>
</tr>
       </td>
       </tr>
       </table>
       </div>
       </td>
       </tr>
       </table>
       </form>  
</body>
</html>