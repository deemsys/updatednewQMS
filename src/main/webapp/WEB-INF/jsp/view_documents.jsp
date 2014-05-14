<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							    <td align="left" valign="middle" width="15%"> Document Type: </td>
							    <td><select name="document_type" id="search_document_type" class="input_cmbbx1" style="width:200px;">
              					<option value="">--Select--</option>
                				<c:forEach items="${documentTypeForm.documentTypes}" var="documenttype" varStatus="status">
        				       <option value="${documenttype.document_type}" <c:if test="${documenttype.document_type==documentMain}"><c:out value="selected"></c:out></c:if>>${documenttype.document_type}</option>
			                  </c:forEach> </select></td>
               
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;&nbsp;Process Area:</td>
							    <td align="left" valign="middle" width="10%">
							    <select name="search_process" id="search_process"  class="input_cmbbx1" style="width:200px;">
               					<option value="">--Select--</option>
              					 <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
              					 <option value="${processes.process_name}" <c:if test="${processes.process_name==documentMain1}"><c:out value="selected"></c:out></c:if>>${processes.process_name}</option>
             				  </c:forEach>
               					</select></td>   
							    <td align="center" valign="middle" width="38%"><input type="submit" value="Find" class="submit_btn1"  "></td>
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
										    <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a id="element_to_pop_up"  onclick="popupwindow()" href="<c:out value="review_history_document?auto_number=${documentMains.auto_number}"/>" >View Revision History</a>
											</td>
										</tr>
							    	
										<c:forEach items="${revisionDocumentForm.revisionDocuments}" var="revision" varStatus="status">
										<c:if test="${revision.auto_number == documentMains.auto_number}">
									
									
										<tr class="row2" style="color:#0000A0; font-style: inherit;">
										<a name="current">
										 	 <td valign="top" align="left" width="10%"> ${revision.document_id}</td>
											<td valign="top" align="left" width="10%">${revision.issuer}</td>
											<td valign="top" align="left" width="10%">${revision.revision_level}</td>
											<td valign="top" align="left" width="10%">${revision.date}</td>
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
              
             <c:forEach var="count" begin="1" end="${noofrows}"> 
             
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
		  <c:if test="${display == 'show'}">
		  <div class='popup'>
											<div class='cnt223'>
									<!-- 		<img src='http://www.developertips.net/demos/popup-dialog/img/x.png' alt='quit' class='x' id='x' />
						    		 -->		
						    				<table cellpadding="0" cellspacing="0" border="0" width="100%">
						    				<img src='resources/images/closebutton-md1.png' alt='quit' class='x' id='x' /><br>
						<tr  id="tabledisplay">
								
									<td valign="top" align="center" width="10%"><b>Issuer</b></td>
									<td valign="top" align="center" width="10%"><b>RevisionLevel</b></td>
									<td valign="top" align="center" width="10%"><b>Date</b></td>
									<td valign="top" align="center" width="10%"><b>Approver1</b></td>
									<td valign="top" align="center" width="10%"><b>Approver2</b></td>
									<td valign="top" align="center" width="10%"><b>Approver3</b></td>
									<td valign="top" align="center" width="10%"><b>Comments</b></td>
									<td valign="top" align="center" width="10%"><b>Status</b></td>
									<td valign="top" align="center" width="10%"><b>Revision No</b></td>
									</tr>  			    	
										<c:forEach items="${revisionDocumentForm.revisionDocuments}" var="revision" varStatus="status">
										<c:if test="${revision.auto_number == documentMains.auto_number}">
										<c:if test="${revision.auto_no == form.auto_number}">
										<c:if test="${display == 'show'}">	
									<script>
									
									document.getElementById('tabledisplay').style.display="block";
									
									
									</script>
									</c:if>
									
									
										<tr class="row2" style="color:#0000A0; font-style: inherit;">
										
									
									<td valign="top" align="left">${revision.issuer}</td>
											 <td valign="top" align="left" width="10%">${revision.revision_level}</td>
											 <td valign="top" align="left" width="10%">${revision.date}</td>
											<td valign="top" align="left" width="10%">${revision.approver1}</td>
											<td valign="top" align="left" width="10%">${revision.approver2}</td>
											<td valign="top" align="left" width="10%">${revision.approver3}</td>
											<td valign="top" align="left" width="10%">${revision.comments}</td>
											<td valign="top" align="left" width="10%">${revision.status}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<td valign="top" align="left" width="10%">${revision.revision_id}</td>
									
									
										</tr>
									
										</c:forEach>
							</table>
							</div>
							</div>	
								</c:if>	
	
		  

  <style type="text/css">
#overlay {
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background-color: #000;
filter:alpha(opacity=70);
-moz-opacity:0.7;
-khtml-opacity: 0.7;
opacity: 0.7;
z-index: 100;
display: none;
}
.cnt223 a{
text-decoration: none;
}
.popup{
// background:red;
left:30px;
width: 1100px;
margin: 0 auto;
display: none;
position: fixed;
z-index: 101;
}
.cnt223{
min-width: 400px;
width: 60%;
min-height: 150px;
margin:280px auto;
background: #fff;
border:2px solid #ccc;
box-shadow:inset 0px 20px 25px #ccc;
position: relative;
z-index: 103;
padding: 10px;
border-radius: 5px;

}
.cnt223 p{
clear: both;
color: #555555;
text-align: justify;
}
.cnt223 p a{
color: #d91900;
font-weight: bold;
}
.cnt223 .x{
float: right;
height: 15px;
left: 10px;
position: relative;
top: -25px;
width: 15px;
}
.cnt223 .x:hover{
cursor: pointer;
}
</style>


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

function popupwindow()
{
//	alert("fsdf");

	self.setInterval("winClose()",20000);
//alert("pop-up");
var overlay = $('<div id="overlay"></div>');
overlay.show();
overlay.appendTo(document.body);
//$('.popup').show();
//alert("sfjhsdfhg");
}

$('.popup').show();

$('.close').click(function(){
$('.popup').hide();

return false;
});

$('.x').click(function(){
$('.popup').hide();

return false;
});



</script>
  <script type="text/javascript">
          
  function pop_up()
  {
  	var url="review_history_form?auto_no=${form.auto_no}";
  	popupWindow = window.open(url,"shoulderpopUpWindow" ,'width=1500,height=700,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
  }
 


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

<jsp:include page="footer.jsp"></jsp:include> --%>



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
							    <td align="left" valign="middle" width="15%"> Document Type: </td>
							    <td><select name="document_type" id="search_document_type" class="input_cmbbx1" style="width:200px;">
              					<option value="">--Select--</option>
                				<c:forEach items="${documentTypeForm.documentTypes}" var="documenttype" varStatus="status">
        				       <option value="${documenttype.document_type}" <c:if test="${documenttype.document_type==documentMain}"><c:out value="selected"></c:out></c:if>>${documenttype.document_type}</option>
			                  </c:forEach> </select></td>
               
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;&nbsp;Process Area:</td>
							    <td align="left" valign="middle" width="10%">
							    <select name="search_process" id="search_process"  class="input_cmbbx1" style="width:200px;">
               					<option value="">--Select--</option>
              					 <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
              					 <option value="${processes.process_name}" <c:if test="${processes.process_name==documentMain1}"><c:out value="selected"></c:out></c:if>>${processes.process_name}</option>
             				  </c:forEach>
               					</select></td>   
							    <td align="center" valign="middle" width="38%"><input type="submit" value="Find" class="submit_btn1"  "></td>
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
										    <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a id="element_to_pop_up" onclick="popupwindow()" href="<c:out value="review_history_document?auto_number=${documentMains.auto_number}"/>" >View Revision History</a>
									
							<%-- 		<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">href="<c:out value="review_history_document?auto_number=${documentMains.auto_number}"/></a></p>
    <div id="light" class="white_content">This is the lightbox content. <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Close</a></div>
    <div id="fade" class="black_overlay"></div> --%>
											</td>
										</tr>
							    	
									<%-- 	<c:forEach items="${revisionDocumentForm.revisionDocuments}" var="revision" varStatus="status">
										<c:if test="${revision.auto_number == documentMains.auto_number}">
									
									
										<tr class="row2" style="color:#0000A0; font-style: inherit;">
										<a name="current">
										 	 <td valign="top" align="left" width="10%"> ${revision.document_id}</td>
											<td valign="top" align="left" width="10%">${revision.issuer}</td>
											<td valign="top" align="left" width="10%">${revision.revision_level}</td>
											<td valign="top" align="left" width="10%">${revision.date}</td>
											<td valign="top" align="left" width="10%">${revision.approver1}</td>
											<td valign="top" align="left" width="10%">${revision.approver2}</td>
											<td valign="top" align="left" width="10%">${revision.approver3}</td>
											<td valign="top" align="center" width="10%">${revision.comments}</td>
											<td valign="top" align="left" width="10%">${revision.status}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											${revision.revision_id}</td>
												</a>
										</tr>
									
									</c:if>
										</c:forEach> --%>
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
		  <c:if test="${display == 'show'}">
		  <div class='popup'>
											<div class='cnt223'>
									<!-- 		<img src='http://www.developertips.net/demos/popup-dialog/img/x.png' alt='quit' class='x' id='x' />
						    		 -->		
						    				<table cellpadding="0" cellspacing="0" border="0" width="100%">
						    				<img src='resources/images/closebutton-md1.png' alt='quit' class='x' id='x' /><br>
						<tr  id="tabledisplay">
								
									<td valign="top" align="center" width="10%"><b>Issuer</b></td>
									<td valign="top" align="center" width="10%"><b>RevisionLevel</b></td>
									<td valign="top" align="center" width="10%"><b>Date</b></td>
									<td valign="top" align="center" width="10%"><b>Approver1</b></td>
									<td valign="top" align="center" width="10%"><b>Approver2</b></td>
									<td valign="top" align="center" width="10%"><b>Approver3</b></td>
									<td valign="top" align="center" width="10%"><b>Comments</b></td>
									<td valign="top" align="center" width="10%"><b>Status</b></td>
									<td valign="top" align="center" width="10%"><b>Revision No</b></td>
									</tr>  			    	
										<c:forEach items="${revisionDocumentForm.revisionDocuments}" var="revision" varStatus="status">
<%-- 										<c:if test="${revision.auto_number == documentMains.auto_number}">
 --%>										<%-- <c:if test="${revision.auto_no == form.auto_number}"> --%>
									<%-- 	<c:if test="${display == 'show'}">	
									<script>
									
									
									document.getElementById('tabledisplay').style.display="block";
									
									
									
									</script>
									</c:if>--%>
									
									
										<tr class="row2" style="color:#0000A0; font-style: inherit;">
										
									
									<td valign="top" align="left">${revision.issuer}</td>
											 <td valign="top" align="left" width="10%">${revision.revision_level}</td>
											 <td valign="top" align="left" width="10%">${revision.date}</td>
											<td valign="top" align="left" width="10%">${revision.approver1}</td>
											<td valign="top" align="left" width="10%">${revision.approver2}</td>
											<td valign="top" align="left" width="10%">${revision.approver3}</td>
											<td valign="top" align="left" width="10%">${revision.comments}</td>
											<td valign="top" align="left" width="10%">${revision.status}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<td valign="top" align="left" width="10%">${revision.revision_id}</td>
									
									
										</tr>
									
										</c:forEach>
							</table>
							</div>
							</div>	
								</c:if>	
	
		  

  <style type="text/css">
#overlay {
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background: none;
filter: alpha(opacity=0);
-moz-opacity:0;
opacity:0;
z-index: 1001;
display: block;
border:5px solid #3366cc;
}
.cnt223 a{
text-decoration: none;
}

.popup{
background:#ccc;
/* left:220px;
top:290px; */
left:0px;
top:90px;
opacity:0.90;
width: 1200px;
height: 1000px;
margin: 0 auto;
display: none;
position: fixed;
z-index: 101;
}
.cnt223{
min-width: 400px;
width: 65%;
min-height: 150px;
margin:100px auto;
background: #fff;
border:2px solid #000;
box-shadow:inset 0px 20px 25px #ccc;
position: relative;
z-index: 103;
padding: 10px;
border-radius: 5px;
opacity: 1;

}
.cnt223 p{
clear: both;
color: #555555;
text-align: justify;
}
.cnt223 p a{
color: #d91900;
font-weight: bold;
}
.cnt223 .x{
float: right;
height: 15px;
left: 10px;
position: relative;
top: -25px;
width: 15px;
}
.cnt223 .x:hover{
cursor: pointer;
}
</style>
<style>
.black_overlay{
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: black;
        z-index:1001;
        -moz-opacity: 0.8;
        opacity:.80;
        filter: alpha(opacity=80);
    }
    .white_content {
        display: none;
        position: absolute;
        top: 25%;
        left: 25%;
        width: 50%;
        height: 50%;
        padding: 16px;
        border: 16px solid orange;
        background-color: white;
        z-index:1002;
        overflow: auto;
    }
    </style>

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

function popupwindow()
{
//	alert("fsdf");

	self.setInterval("winClose()",20000);
//alert("pop-up");
var overlay = $('<div id="overlay"></div>');
overlay.show();
overlay.appendTo(document.body);
//$('.popup').show();
//alert("sfjhsdfhg");
}

$('.popup').show();

$('.close').click(function(){
$('.popup').hide();

return false;
});

$('.x').click(function(){
$('.popup').hide();

return false;
});



</script>
  <script type="text/javascript">
          
  function pop_up()
  {
  	var url="review_history_form?auto_no=${form.auto_no}";
  	popupWindow = window.open(url,"shoulderpopUpWindow" ,'width=1500,height=700,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
  }
 


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