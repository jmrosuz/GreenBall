<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<%String pathGreenBall = request.getContextPath(); %>

<html xmlns="../../../../../../www.w3.org/1999/xhtml/index.html">
<head>

    <title>TENNIS CLUB</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />

<meta name="author" content="corsini" />
<meta name="keywords" content="Tennis, club, events, football, golf, non-profit, betting assistant, football,fitness, tennis, sport, soccer, goal, sports, volleyball, basketball,	charity, club, cricket, football, hockey, magazine, non profit, rugby, soccer, sport, sports, tennis" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<c:set value="$(pageContext.request.contextPath)" var="myURL"></c:set>
    
    <link href="<%=pathGreenBall%>/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
	

    <!--Video Porfolio-->
    <link href="<%=pathGreenBall%>/resources/css/stapel.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
    

    <link href="<%=pathGreenBall%>/resources/css/component.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/style_dir.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/greenBall.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/png" href="<%=pathGreenBall%>/resources/img/favicon.ico" />
    <link href="<%=pathGreenBall%>/resources/css/responsive.css" rel="stylesheet" type="text/css" />

    <link href="<%=pathGreenBall%>/resources/css/animate.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/bootstrapHelper.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/tether.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/bootstrap-dialog.css" rel="stylesheet" type="text/css" />
    <script src="<%=pathGreenBall%>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%=pathGreenBall%>/resources/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="<%=pathGreenBall%>/resources/js/jquery.transit.min.js" type="text/javascript"></script>
	
	<script src="<%=pathGreenBall%>/resources/js/tether.min.js" type="text/javascript"></script>
	 <script src="<%=pathGreenBall%>/resources/js/bootstrap.js" type="text/javascript"></script>
	
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript">
$( "player" ).submit(function( event ) {
	  event.preventDefault();
	});
	

function kidsChanged(variable){


	$("#singlesCategory").empty();
	$("#singlesCategory").attr("disabled", true);
	$("#doublesCategory").empty();
	$("#doublesCategory").attr("disabled", true);
	$("#mixesCategory").empty();
	$("#mixesCategory").attr("disabled", true);
	
	$("#singlesCategorySelected").attr('checked', false);
	$("#doublesCategorySelected").attr('checked', false);
	$("#mixesCategorySelected").attr('checked', false);
}
	
function singlesCheckChanges(variable){
	if (variable.checked){
		if($( "#sex option:selected" ).text() == "M"){
			if($("#kid").is(':checked')){
				$("#singlesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${nvmensCategoriesS}">
				$("#singlesCategory").append('<option value="${categories.id}">${categories.name}</option>');
			</c:forEach>
			}
			else{
				$("#singlesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${mensCategoriesS}">
					$("#singlesCategory").append('<option value="${categories.id}">${categories.name}</option>');
				</c:forEach>
			}
			
		}
		else if($( "#sex option:selected" ).text() == "F"){
			if($("#kid").is(':checked')){
				$("#singlesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${nvwomansCategoriesS}">
					$("#singlesCategory").append('<option value="${categories.id}">${categories.name}</option>');
				</c:forEach>	
			}
			else{
				$("#singlesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${womansCategoriesS}">
					$("#singlesCategory").append('<option value="${categories.id}">${categories.name}</option>');
				</c:forEach>
			}
		
			
		}
	}
	else{
		$("#singlesCategory").empty();
		$("#singlesCategory").attr("disabled", true);
	}
}
	
function doublesCheckChanges(variable){
	if (variable.checked){
		if($( "#sex option:selected" ).text() == "M"){
			if($("#kid").is(':checked')){
				$("#doublesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${nvmensCategoriesD}">
					$("#doublesCategory").append('<option value="${categories.id}">${categories.name}</option>');
				</c:forEach>
			}
			else{
				$("#doublesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${mensCategoriesD}">
					$("#doublesCategory").append('<option value="${categories.id}">${categories.name}</option>');
				</c:forEach>
			}
			
		}
		else if($( "#sex option:selected" ).text() == "F"){
			if($("#kid").is(':checked')){
				$("#doublesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${nvwomansCategoriesD}">
					$("#doublesCategory").append('<option value="${categories.id}">${categories.name}</option>');
				</c:forEach>	
			}
			else{
				$("#doublesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${womansCategoriesD}">
					$("#doublesCategory").append('<option value="${categories.id}">${categories.name}</option>');
				</c:forEach>
			}
		
			
		}
	}
	else{
		$("#doublesCategory").empty();
		$("#doublesCategory").attr("disabled", true);
	}
}
	

function mixesCheckChanges(variable){
	if (variable.checked){
		
			if($("#kid").is(':checked')){
				$("#mixesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${nvmixesCategories}">
					$("mixesCategory").append('<option value="${categories.id}">${categories.name}</option>');
				</c:forEach>
			}
			else{
				$("#mixesCategory").attr("disabled", false);
				<c:forEach var="categories" items="${mixesCategories}">
					$("#mixesCategory").append('<option value="${categories.id}">${categories.name}</option>');
				</c:forEach>
			}	
	}
	else{
		$("#mixesCategory").empty();
		$("#mixesCategory").attr("disabled", true);
	}
	
}	



</script>

</head>
<body>
<%@ include file="head.jsp" %>

 <section class="drawer">
    <section id="summary" class="container secondary-page">
      <div class="general general-results" >
<%@ include file="menu.jsp" %>

		
		<div id="atp-match">
		          <div class="container">
		          
		          
		<c:if test="${not empty badRows}">
		
		<div class="container badfile">
		<p class="news-title-right"><spring:message code="players.badFile1"/><a href="" data-toggle="modal" data-target="#myModal"> <spring:message code="players.badFile2"/></a> <spring:message code="players.badFile3"/> </p>
		</div>
		
		<div id="myModal" class="modal fade" role="dialog" >
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title"><spring:message code="players.badLoad"/></h4>
		      </div>
		      <div class="modal-body">
		        <p><spring:message code="players.badRows"/><c:out value="${badRows}"></c:out>  </p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="greenBall.close"/></button>
		      </div>
		    </div>
		
		  </div>
		</div>
		
		
		</c:if>          
		
		<h1>
			<spring:message code="players.addPlayer"/>
		</h1>
		
		<p style="text-align:center;"><img alt="" src="<%=pathGreenBall%>/resources/images/draws/drawsState3.png" align="middle" ></p>
		
		<c:url var="addAction" value="/${shortName}/addPlayers?${_csrf.parameterName}=${_csrf.token}" ></c:url>
		<form:form action="${addAction}" commandName="player" enctype="multipart/form-data">
		
		<input type="hidden" value="${shortName}" name="shortName"></input>
		<div class="container">
		
		        
		    </div>
			<form:hidden path="idPlayer" disabled="disable"  />
				
				
				<div class="captura-right-content">
				<spring:bind path="name">
				  <div class="form-group ${hasError}">
					<label class="col-sm-2 control-label">* <spring:message code="players.name"/></label>
					<div class="col-sm-5">
						<form:input path="name" class="form-control"
		                                id="name" placeholder="" required="required"/>
						<form:errors path="name" class="control-label"/>
					</div>
				  </div>
				  </spring:bind>
				</div>
				
				
				
				
				
			
				<div class="captura-right-content">
				<spring:bind path="middleName">
				  <div class="form-group ${hasError} ">
					<label class="col-sm-2 control-label">* <spring:message code="players.middleName"/></label>
					<div class="col-sm-5">
						<form:input path="middleName" class="form-control"
		                                id="middleName" placeholder="" required="required"/>
						<form:errors path="middleName" class="control-label" />
					</div>
				  </div>
				</spring:bind>
				</div>
				
				
				<div class="captura-right-content">
				<spring:bind path="lastName">
				  <div class="form-group ${hasError}">
					<label class="col-sm-2 control-label"><spring:message code="players.lastName"/></label>
					<div class="col-sm-5">
						<form:input path="lastName" class="form-control"
		                                id="lastName" placeholder="" />
						<form:errors  path="lastName" class="control-label" />
					</div>
				  </div>
				</spring:bind>
				</div>
				
				<div class="captura-right-content">
				<spring:bind path="club">
				  <div class="form-group ${hasError} ">
					<label class="col-sm-2 control-label">* <spring:message code="players.club"/></label>
					<div class="col-sm-5">
						<form:input path="club" class="form-control"
		                                id="club" placeholder="Nombre o iniciales del club" required="required" />
		                <form:errors path="club" class="control-label" />
					</div>
				  </div>
				</spring:bind>
				</div>
				
				<div class="captura-right-content">
				<spring:bind path="telephone">
				  <div class="form-group">
					<label class="col-sm-2 control-label"><spring:message code="players.telephone"/></label>
					<div class="col-sm-5">
						<form:input path="telephone" class="input-medium bfh-phone form-control" data-format=" (ddd) ddd-dddd"
		                                id="telephone" placeholder="(XXX) XXX-XXXX"/>
						<form:errors path="telephone" class="control-label" />
					</div>
				  </div>
				</spring:bind>
				</div>
				
				
				<div class="captura-right-content">
				<spring:bind path="email">
				  <div class="form-group ${hasError}">
					<label class="col-sm-2 control-label"><spring:message code="players.email"/></label>
					<div class="col-sm-5">
						<form:input path="email" class="form-control"
		                                id="email" placeholder="usuario@dominio.com" />
						<form:errors path="email" class="control-label" />
					</div>
				  </div>
				</spring:bind>
				</div>
				
				<div class="captura-right-content">
				<spring:bind path="sex">
				  <div class="form-group">
					<label class="col-sm-2 control-label">* <spring:message code="players.sex"/></label>
					<div class="col-sm-5">
						<form:select path="sex" class="form-control" onchange="javascript:kidsChanged(this);"
		                                id="sex">
		                      <option <c:if test="${player.sex eq 'M'.charAt(0)}">selected="selected"</c:if>>M</option>
		                      <option <c:if test="${player.sex eq 'F'.charAt(0)}"></c:if>>F</option>
		                      
		                </form:select>
						<form:errors path="sex" class="control-label" />
					</div>
				  </div>
				</spring:bind>
				</div>
				
				
				
				<div class="captura-right-content">
				<spring:bind path="kid">
				  <div class="form-group">
					<label class="col-sm-2 control-label"><spring:message code="players.isKid"/></label>
					<div class="col-sm-5">
						<form:checkbox path="kid" class="form-control"
		                                id="kid"  onchange="javascript:kidsChanged(this);" />
						<form:errors path="kid" class="control-label" />
					</div>
				  </div>
				</spring:bind>
				</div>
				
				<div class="captura-right-content">
				  <div class="form-group">
				  	<label class="col-sm-2 control-label"><spring:message code="players.singles"/></label>
				  	<c:if test="${ empty player.singlesCategory}">
						<div class="col-sm-1">
	  							<input type="checkbox"  class="form-control"
			                                id="singlesCategorySelected" onchange="singlesCheckChanges(this);"/>
						</div>
						<div class="col-sm-4">
							<select name="singlesCategory" id="singlesCategory" class="form-control" disabled="disabled" id="singlesCategory" >
								
							</select>
						</div>
					</c:if>
					<c:if test="${not empty player.singlesCategory}">
						<div class="col-sm-1">
	  							<input type="checkbox"  class="form-control" checked="checked"
			                                id="singlesCategorySelected" onchange="singlesCheckChanges(this);"/>
						</div>
						<div class="col-sm-4">
							<select name="singlesCategory" id="singlesCategory" class="form-control" id="singlesCategory" >
								<c:forEach items="${singlesAvailable}" var="ite">
									<c:choose>
										<c:when test="${ite.id == player.singlesCategory.id}">
											<option value="${ite.id}" selected="selected">${ite.name}</option>
										</c:when>
										<c:otherwise>
											<option value="${ite.id}">${ite.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</c:if>
				  </div>
				</div>
				
				
				<div class="captura-right-content">
				  <div class="form-group">
				  	<label class="col-sm-2 control-label"><spring:message code="players.doubles"/></label>
				  	<c:if test="${ empty player.doublesCategory}">
						<div class="col-sm-1">
	  							<input type="checkbox"  class="form-control"
			                                id="doublesCategorySelected"  onchange="doublesCheckChanges(this);"/>
						</div>
						<div class="col-sm-4">
							<select id="doublesCategory" name="doublesCategory" class="form-control" disabled="disabled" ></select>
						</div>
					</c:if>
					<c:if test="${not empty player.doublesCategory}">
						<div class="col-sm-1">
	  							<input type="checkbox"  class="form-control" checked="checked"
			                                id="doublesCategorySelected" onchange="doublesCheckChanges(this);"/>
						</div>
						<div class="col-sm-4">
							<select name="doublesCategory" id="doublesCategory" class="form-control" >
								<c:forEach items="${doublesAvailable}" var="ite">
									<c:choose>
										<c:when test="${ite.id == player.doublesCategory.id}">
											<option value="${ite.id}" selected="selected">${ite.name}</option>
										</c:when>
										<c:otherwise>
											<option value="${ite.id}">${ite.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</c:if>
				  </div>
				</div>
				
				<div class="captura-right-content">
				  <div class="form-group">
				  	<label class="col-sm-2 control-label"><spring:message code="players.mixes"/></label>
				  	<c:if test="${ empty player.mixesCategory}">
						<div class="col-sm-1">
	  							<input type="checkbox"  class="form-control"
			                                id="mixesCategorySelected"  onchange="mixesCheckChanges(this);" />
						</div>
						<div class="col-sm-4">
							<select id="mixesCategory" name="mixesCategory" class="form-control" disabled="disabled" id="mixesCategory"></select>
						</div>
					</c:if>
					<c:if test="${not empty player.mixesCategory}">
						<div class="col-sm-1">
	  							<input type="checkbox"  class="form-control" checked="checked"
			                                id="mixesCategorySelected" onchange="mixesCheckChanges(this);"/>
						</div>
						<div class="col-sm-4">
							<select name="mixesCategory" id="mixesCategory" class="form-control" id="mixesCategory" >
								<c:forEach items="${mixesAvailable}" var="ite">
									<c:choose>
										<c:when test="${ite.id == player.mixesCategory.id}">
											<option value="${ite.id}" selected="selected">${ite.name}</option>
										</c:when>
										<c:otherwise>
											<option value="${ite.id}">${ite.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</c:if>
					
				  </div>
				</div>
		<table>
			
			
		
			
			<tr>
				<td colspan="2">
					<c:if test="${!empty player.name}">
						<input class="pl-point-button" type="submit"
							value="<spring:message code="greenBall.guardar"/>" />
						<input class="pl-point-button" type="submit"
							value="<spring:message code="greenBall.cancelar"/>" name="cancelar" />
					</c:if>
					<c:if test="${empty player.name}">
						<input class="pl-point-button" type="submit"
							value="<spring:message code="greenBall.anadir"/>" /> 
					</c:if>
				</td>
			</tr>
		
		</table>
		
		
		  
		<p></p>
		<p><label><spring:message code="players.select"/></label></p>
		  
		<p><input name="file" id="fileToUpload" type="file" /></p>  
		<p><input class="pl-point-button" type="submit" name="uploadFile"
							value="<spring:message code="players.uploadFile"/>" /></p>
		
		
		  <h3><spring:message code="players.list"/></h3><input type="submit" name="borrarTodo" class="pl-point-button btn pull-right" value="<spring:message code="players.borrarTodo"/>"/>
		
		<c:if test="${!empty listPlayers}">
			<div class="tab-content">
			<table class="tab-score">
			<tr class="top-score-table">
				<td width="80"><spring:message code="players.id"/></td>
				<td width="120"><spring:message code="players.name"/></td>
				<td width="120"><spring:message code="players.club"/></td>
				<td width="60"><spring:message code="greenBall.editar"/></td>
				<td width="60"><spring:message code="greenBall.borrar"/></td>
			</tr>
			<c:forEach items="${listPlayers}" var="player">
				<tr>
					<td>${player.idPlayer}</td>
					<td>${player.name} ${player.middleName} ${player.lastName}</td>
					<td>${player.club}</td>
					<td><a href="<c:url value='/${shortName}/editPlayer/${player.idPlayer}' />" ><spring:message code="greenBall.editar"/></a></td>
					<td><a href="<c:url value='/${shortName}/removePlayer/${player.idPlayer}' />" ><spring:message code="greenBall.borrar"/></a></td>
				</tr>
			</c:forEach>
			</table>
			</div>
		</c:if>
		
		<div><p></p><p><input class="pl-point-button" type="button" name="uploadFile" onclick="window.location.href='<%=pathGreenBall%>/${shortName}/tournamentDetails'"
							value="<spring:message code="prev.tournamentDetails"/>" />
							<input style="float: right;" class="pl-point-button" type="button" name="uploadFile" onclick="window.location.href='<%=pathGreenBall%>/${shortName}/draws'"
							value="<spring:message code="next.draws"/>" />
							</p></div>
		
		<div class="content-banner">
			<ul class="sponsor second"></ul>
		</div>
		</form:form>
		
		
		</div>
		
		
		
		</div>
	</div>
 </section>	
</section>

<%@include file="foot.jsp" %>>

<script type="text/javascript" src="<%=pathGreenBall%>/resources/js/bootstrap.helper.phone.js"></script>
<script type="text/javascript" src="<%=pathGreenBall%>/resources/js/bootstrap.helper.phone.format.js"></script>

</body>
</html>


