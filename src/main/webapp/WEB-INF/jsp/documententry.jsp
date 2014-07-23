<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

 
 
  <div id="right_content">
  
        
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        </td>
        </tr>
        
        
       	 <tr class="row1"  >
        <td width="20%"></td>
             <td colspan="2" ><br/><br/><br/><br/><form method="get" enctype="multipart/form-data" action="adddocument">
             <input type="submit" id="document"  name="DOCUMENT" value="Documents" class="menubuttonsub blue" style="width: 100%;height: 50px;font-size: 24px;cursor:pointer">
            </form><br/></td>
            
             <td colspan="3"><br/><br/><br/><br/>
             <form method="get" enctype="multipart/form-data" action="addform">
            <input type="submit" id="form" name="FORM" value="Forms/Records" class="menubuttonsub blue"style="width: 100%;height: 50px;font-size: 24px;cursor:pointer">
            </form><br/></td>
</tr>
<tr class="row1" height="200px;" >
        <td width="20%"></td>
             <td colspan="2" >
             <h3 style="font-size:26px;">Documents</h3><br/><br/>
             <p align="justify"> <a href="adddocument">Click here</a>....Leads to 'Add Document details' and 'Add revision details' page, gets the input and same input will be displayed in View document.This page also has an search functionality will search for a particular keyword(document type,process area) and will list the document of search.The report tab gives the list of reports of document added/inserted in add document.Click a corresponding or document link will give or display the complete information of the document and added with download option.</p>
            <!--  <p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p><p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p>
             <p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p>
             <p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p>
             <p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p> -->
             </td>
            
             <td colspan="3">
             <h3 style="font-size:26px;">Forms/Records</h3><br/><br/>
              <p align="justify"> <a href="addform">Click here</a>....Leads to 'Add Form details' and 'Add revision details' page, gets the input and same input will be displayed in View Form.This page also has an search functionality will search for a particular keyword(process area) and will list the Form of search.The report tab gives the list of reports of Form added/inserted in add Form.Click a corresponding or Form link will give or display the complete information of the form and added with download option.</p>
            <!--  <p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p><p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p>
             <p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p>
             <p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p>
             <p align="justify"> Test contents please change this while you put the original contents Test contents please change this while you put the original contents 
             Test contents please change this while you put the original contents Test contents please change this while you put the original contents </p> -->
             </td>
</tr>
</table></div>




<table  width=300 height=300>
			<tr height=30><td></td></tr></table>
			<br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>		