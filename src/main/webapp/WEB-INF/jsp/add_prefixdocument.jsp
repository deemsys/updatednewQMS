<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<form method="post" action="add_documentprefix">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <!-- <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr> -->
      <tr>
      <td>
      <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu=='prefixform'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">Add Prefix</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documentprefix_list" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">View Prefixes</span>
								</a>
							</li>
				          
				           </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Document Prefix</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="70%"><span class="err">*</span>Prefix :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="doc_prefix" class="input_txtbx1" id="docprefix" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="DocumentPrefix.doc_prefix"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Document Id</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="document_id" class="input_txtbx1" id="document_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="DocumentPrefix.document_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" class="submit_btn1"></td>
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
 </html>
<jsp:include page="footer.jsp"></jsp:include>
