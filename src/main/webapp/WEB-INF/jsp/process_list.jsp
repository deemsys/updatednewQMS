<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

 
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<div id="right_content">
	
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documentprefix_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Document Prefix</span>
								</a>
							</li>
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="formprefix_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Form Prefix</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="process_list" class="<c:choose>
								<c:when test="${menu=='controlprocess'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Process</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="formlocation_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Locations</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documenttype_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
								<span>Document Type</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documentrevisionlevel_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Revision Level</span>
								</a>
							</li>
						<li  style=" float:left;margin-right:0px;text-transform:uppercase;">
								<a href="sourceNC_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Source of NC</span>
									
								</a>
							</li>
							</ul>	
							<ul class="horizmenu" style="margin-bottom:5px;">
				          <li  style=" float:left;margin-right:0px;text-transform:uppercase;">
								<a href="typeNC_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Type of NC</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:0px;text-transform:uppercase;">
								<a href="productidNC_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Product ID</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:0px;text-transform:uppercase;">
								<a href="reportNC_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Report NC</span>
									
								</a>
							</li>				
							</li>	
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_referenceMaintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reference Attachment</span>
								</a>
							</li>		
							</ul>
  </div>
      		</td>
      		</tr>
		<c:if test="${success=='true'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="process_list">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr>
		</c:if>
		<c:if test="${success=='update'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/success.png"/>
						<a title="Close" href="process_list">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
		<c:if test="${success=='delete'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/removed.png"/>
						<a title="Close" href="process_list">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Prefix List</h2>
			        </div>
			        <div class="contentbox">
	 
			      <form action="process_list" method="POST"> 
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr class="title">
							<td valign="top" align="left" width="20%">Process Id</td>
							<td valign="top" align="left" width="20%">Process Name</td>
							<td valign="top" align="left" width="20%">Process Owner</td>
							<td valign="top" align="left" width="20%">Actions</td>
							</tr>
							<c:if test="${fn:length(processForm.processes) gt 0}">
        				  <c:forEach items="${processForm.processes}" var="processes" varStatus="status">
        				       				<tr class="row1">
        				       				
        				       				
        				       				 <td valign="top" align="left"  width="10%">
        				       				 
        				       				  ${processes.process_id}</td>
        				       				 <td valign="top" align="left" width="15%">${processes.process_name}</td>
        				       				 <td valign="top" align="left" width="15%">${processes.process_owner}</td>
        				       					<td valign="top" align="left">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_process?process_id=${processes.process_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_process?process_id=${processes.process_id}"/>" onclick="return confirmation()">Remove</a>
											</td>
        				       				 </tr>
        				       				 </c:forEach>
        				       				 </c:if>
        				       				
        				       				 </table>
        				       				</form>
        				       				<br><br><br><br><br>         


 
        				       				</div>
        				       				</td>
        				       				</tr>
        				       				<tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewprocessreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
            
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewprocessreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewprocessreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallprocessreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="process_list" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>

        				       				
        				       				</table>
        				       				</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include>     
<script language="javascript">

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete  Process Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script> 
   				       		