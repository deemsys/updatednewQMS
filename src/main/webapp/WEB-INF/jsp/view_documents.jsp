<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="/QMS_App/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/ajaxpaging.js">
    <script type="text/javascript">  
        $(document).ready(function(){
            $("#report tr:odd").addClass("odd");
            $("#report tr:not(.odd)").hide();
            $("#report tr:first-child").show();
            
            $("#report tr.odd").click(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script>   


<div id="right_content">
	
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
    	
      		<tr>
      		<td>
      		 <div>
  						<ul class="horizmenu">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Document
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									View Document
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Document report
									
								</a>
							</li>
							
			            </ul>
  </div>
      		</td>
      		</tr>
      		<c:if test="${success=='true' }">
      		<tr>
	        	<td valign="top" align="left">
					<div class="status success">
			            <p class="closestatus"><a title="Close" href="viewdocuments">x</a></p>
			            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span><c:out value="${success_message}"/></span></p>
			          </div>
				</td>
      		</tr>
      		</c:if>
      		<tr>
				<td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>
	          		</div>
				</td>
			</tr>
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>View Documents</h2>
			        </div>
			        <div class="contentbox">
						<form action="findDocument" method="get">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="15%"> Document Type : </td>
							    <td><input type="text" name="search_document_type" class="input_txtbx2" id="moblie"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;&nbsp;Process Area:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="search_process" id="search_process" class="input_txtbx2"></td>
							   
							    <td align="center" valign="middle" width="38%"><input type="submit" value="Find" class="submit_btn1"  onclick="findpart()"></td>
							    <td align="center" valign="middle" width="38%"><input type="reset" value="Clear" class="submit_btn1"></td>
							  </tr>
							</table>
							
						</div></form>
						<form name="grid"  action="" method="POST" name="dashboard">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" id="report">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="10%">Document&nbsp;ID</td>
					         	<td valign="top" align="left" width="15%">Document Title</td>
					         	<td valign="top" align="left" width="15%">Document Type</td>

          						<td valign="top" align="left" width="10%">Process</td>
          						<td valign="top" align="center" width="10%">Document</td>
          						<td valign="top" align="center" width="15%">External Documents</td>
          						<td valign="top" align="left" width="20%">Actions</td>
        					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${documentMainForm.documentMains}" var="documentMains" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="10%"><a href="list_documents?id=${documentMains.document_id}">${documentMains.document_id}</a></td>
											<td valign="top" align="left" width="10%">${documentMains.document_title}</td>
											<td valign="top" align="left" width="10%">${documentMains.document_type}</td>
											<td valign="top" align="left" width="10%">${documentMains.process}</td>
											
											<c:choose>
											<c:when test="${documentMains.media_type=='electronic'}">
											<td valign="top" align="center" width="10%"><a href="<c:out value="downloadMaindoc?id=${documentMains.document_id}"></c:out>">Download</a></td>
										</c:when>
										<c:when test="${documentMains.media_type=='hardcopy'}">
										<td valign="top" align="center" width="10%">Hard Copy </td>
										</c:when>
										<c:otherwise>
										<td valign="top" align="center" width="10%"><a href="<c:out value="downloadMaindoc?id=${documentMains.document_id}"></c:out>">Download</a>&nbsp;<label>and</</label>&nbsp;<label>Hard Copy </label></td>
										</c:otherwise>
										</c:choose>	
											<td valign="top" align="center" width="15%">
											<c:choose>
											<c:when test="${documentMains.external=='Yes'}">
											<c:out value="Yes"></c:out>
											</c:when>	
											<c:otherwise>
											<c:out value="No"></c:out>
											</c:otherwise>							
											</c:choose>
											</td>
											<td valign="top" align="left" width="25%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_document?auto_number=${documentMains.auto_number}"></c:out>" style="padding-right:20px;">Edit</a>
										    <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="review_history_document?auto_number=${documentMains.auto_number}"/>#current">View Revision History</a>
											
													
											</td>
										</tr>
							    	
										<c:forEach items="${revisionDocumentForm.revisionDocuments}" var="revision" varStatus="status">
										<c:if test="${revision.auto_number == documentMains.auto_number}">
									
									
										<tr class="row2" style="color:#0000A0; font-style: inherit;">
										<a name="current">
										 	<%--  <td valign="top" align="left" width="10%"> ${revision.document_id}</td>
											 --%><td valign="top" align="left" width="10%">${revision.issuer}</td>
											<%-- <td valign="top" align="left" width="10%">${revision.revision_level}</td>
											 --%><td valign="top" align="left" width="10%">${revision.date}</td>
											<td valign="top" align="left" width="10%">${revision.approver1}</td>
											<td valign="top" align="left" width="10%">${revision.approver2}</td>
											<td valign="top" align="left" width="10%">${revision.approver3}</td>
											<td valign="top" align="center" width="10%">${revision.comments}</td>
											<td valign="top" align="left" width="10%">${revision.status}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											${revision.revision_id}</td>
												</a>
										</tr>
									
									</c:if>
										</c:forEach>
										 </c:forEach>
										</table>
									   
									    
								
							    	
						<tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewdocumentreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdocumentreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdocumentreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldocumentreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewdocuments" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
		  </table>
		  </div>
		  

<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?");
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
	}
}
</script>

<script language="javascript">

function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
return true;
}


<script type="text/javascript">


        $(function () {
			//alert("good");
			$("a[data-bind-action='toggle-content']").click(toggleContent);
			function toggleContent(){
	  	    	
	  	   var proceee_name = '';

	 // $('#autonumber1 tr').each(function() {
		
		 
	   //   $.each(this.cells, function(){
	/*   alert($(this).html()); */
	    	  if (proceee_name == '') {
			   var $td= $(this).closest('tr').children('td');  
			     
			     
			      proceee_name= $td.eq(0).text();  
			     
			  
			     }
			     else{
			    	
			      proceee_name = proceee_name + ',' + $(this).find("td").html();
			     }
			     
			   
	$.ajax({
		
		type : "POST",
		url : "/QMS_App/ajax_getrevisionsdoc",
		data : "auto_number=" + proceee_name,
		success : function(response) {
              
             // alert("response= "+response);
              
	       $('#process_owner_id').html(response);
      	    			},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
	
	
	
			}
});



<script>
function findpart()
{
// alert(document.getElementById("moblie").value);
// alert(document.getElementById("group").value);
// alert(document.getElementById("city").value);
window.location="?do=viewparticipants&moblie="+document.getElementById("moblie").value+"&group="+document.getElementById("group").value+"&city="+document.getElementById("city").value;
}



function subhide()

{
	document.getElementById('subrow').style.display="block";
}
</script>

<jsp:include page="footer.jsp"></jsp:include>