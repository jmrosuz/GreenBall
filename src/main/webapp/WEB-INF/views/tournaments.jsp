<%@ include file="header.jsp" %>

<script type="text/javascript">
$(function () {
$('#datepicker').datepicker();
$('#datepicker').on('changeDate', function() {
    $('#my_hidden_input').val(
        $('#datepicker').datepicker('getFormattedDate')
    );
});
});
</script>

<div id="atp-match">
          <div class="container">
          
          

<h1>
	Crear Torneo
</h1>

<c:url var="addAction" value="/addTournament" ></c:url>
<form:form action="${addAction}" commandName="tournament">


<div class="container">

        
    </div>
	<form:hidden path="id" disabled="disable"  />
		
		
		<div class="captura-right-label">
			<label class="col-sm-4 control-label"><spring:message code="tournaments.name" /></label>
			<label class="col-sm-4 control-label"><spring:message code="tournaments.shortName" /></label>
		</div>
		
		<div class="captura-right-content">
		<spring:bind path="name">
		  <div class="form-group ${hasError}">
			<div class="col-sm-4">
				<form:input path="name" class="form-control"
                                id="name" placeholder="" required="required"/>
				<form:errors path="name" class="control-label"/>
			</div>
		  </div>
		  </spring:bind>
		  
		  <spring:bind path="name">
		  <div class="form-group ${hasError}">
			<div class="col-sm-3">
				<form:input path="shortName" class="form-control"
                                id="shortName" placeholder="" required="required"/>
				<form:errors path="shortName" class="control-label"/>
			</div>
		  </div>
		  </spring:bind>
		</div>
		
		
		<div class="captura-right-label">
			<label class="col-sm-4 control-label"><spring:message code="tournaments.referee" /></label>
			<label class="col-sm-4 control-label"><spring:message code="tournaments.numPlayers" /></label>
		</div>
		
	
		
		<div class="captura-right-content">
		<spring:bind path="name">
		  <div class="form-group ${hasError}">
			<div class="col-sm-4">
				<form:input path="referee" class="form-control"
                                id="referee" placeholder="" required="required"/>
				<form:errors path="referee" class="control-label"/>
			</div>
		  </div>
		  </spring:bind>
		 
		 <spring:bind path="name">
		  <div class="form-group ${hasError}">
			<div class="col-sm-3">
				<form:input path="numPersons" class="form-control"
                                id="numPersons" placeholder="" required="required"/>
				<form:errors path="numPersons" class="control-label"/>
			</div>
		  </div>
		  </spring:bind>
		</div>
		
		<div class="captura-right-content">
		
		  <div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="tournaments.startEnd"/></label>
			<div class="col-sm-5">
				<div class="input-daterange input-group" id="datepicker">
    				<form:input type="text" class="input-sm form-control" name="start" path="startDate" required="required"/>
    				<span class="input-group-addon"><spring:message code="tournaments.a"/></span>
    				<form:input type="text" class="input-sm form-control" name="end" path="endDate" required="required"/>
				</div>
			
				
				<form:errors path="telephone" class="control-label" />
			</div>
		  </div>
		</div>
		
		<div class="captura-right-label">
			<label class="col-sm-4 control-label"><spring:message code="tournaments.club"/></label>
			<label class="col-sm-4 control-label"><spring:message code="tournaments.telefono"/></label>
		</div>
		
		<div class="captura-right-content">
		<spring:bind path="club">
		  <div class="form-group ${hasError} ">
			<div class="col-sm-4">
				<form:input path="club" class="form-control"
                                id="club" placeholder="Nombre o iniciales del club" required="required"/>
                <form:errors path="club" class="control-label" />
			</div>
		  </div>
		</spring:bind>
		
		<spring:bind path="telephone">
		  <div class="form-group">
			<div class="col-sm-3">
				<form:input path="telephone" class="input-medium bfh-phone form-control" data-format=" (ddd) ddd-dddd"
                                id="telephone" placeholder="(XXX) XXX-XXXX" required="required"/>
				<form:errors path="telephone" class="control-label" />
			</div>
		  </div>
		</spring:bind>
		
		</div>
		
		<div class="captura-right-label">
			<label class="col-sm-4 control-label"><spring:message code="tournaments.direccion"/></label>
			
		</div>
		
		<div class="captura-right-label">
			<label class="col-sm-3 control-label"><spring:message code="tournaments.calle"/></label>
			<label class="col-sm-2 control-label"><spring:message code="tournaments.numero"/></label>
			<label class="col-sm-2 control-label"><spring:message code="tournaments.cp"/></label>
		</div>
		
		<div class="captura-right-content">
			<spring:bind path="dirStreet">
			  <div class="form-group ${hasError} ">
				<div class="col-sm-3">
					<form:input path="dirStreet" class="form-control"
	                                id="dirStreet" placeholder="" required="required"/>
	                <form:errors path="dirStreet" class="control-label" />
				</div>
			  </div>
			</spring:bind>
			
			<spring:bind path="dirNumber">
			  <div class="form-group">
				<div class="col-sm-2">
					<form:input path="dirNumber" class="form-control"
	                                id="dirNumber" placeholder="" required="required"/>
					<form:errors path="dirNumber" class="control-label" />
				</div>
			  </div>
			</spring:bind>
			
			<spring:bind path="dirCP">
			  <div class="form-group">
				<div class="col-sm-2">
					<form:input path="dirCP" class="form-control"
	                                id="dirCP" placeholder="" required="required"/>
					<form:errors path="dirCP" class="control-label" />
				</div>
			  </div>
			</spring:bind>
			
			
		</div>
		
		
		
		
		
		<div class="captura-right-label">
			<label class="col-sm-3 control-label"><spring:message code="tournaments.colonia"/></label>
			<label class="col-sm-2 control-label"><spring:message code="tournaments.estado"/></label>
			<label class="col-sm-2 control-label"><spring:message code="tournaments.pais"/></label>
		</div>
		
		<div class="captura-right-content">
			<spring:bind path="dirNeighborhood">
			  <div class="form-group ${hasError} ">
				<div class="col-sm-3">
					<form:input path="dirNeighborhood" class="form-control"
	                                id="dirNeighborhood" placeholder="" required="required"/>
	                <form:errors path="dirNeighborhood" class="control-label" />
				</div>
			  </div>
			</spring:bind>
			
			<spring:bind path="dirState">
			  <div class="form-group ${hasError} ">
				<div class="col-sm-2">
					<form:input path="dirState" class="form-control"
	                                id="dirState" placeholder="" required="required"/>
	                <form:errors path="dirState" class="control-label" />
				</div>
			  </div>
			</spring:bind>
			
			<spring:bind path="dirCountry">
			  <div class="form-group ${hasError} ">
				<div class="col-sm-2">
					<form:input path="dirCountry" class="form-control"
	                                id="dirCountry" placeholder="" required="required"/>
	                <form:errors path="dirCountry" class="control-label" />
				</div>
			  </div>
			</spring:bind>
		
		</div>
		
<table>
	
	

	
	<tr>
		<td colspan="2">
			<c:if test="${!empty tournament.name}">
				<input class="pl-point-button" type="submit"
					value="<spring:message code="greenBall.guardar"/>" />
				<input class="pl-point-button" type="submit"
					value="<spring:message text="Cancelar"/>" name="cancelar" />
			</c:if>
			<c:if test="${empty tournament.name}">
				<input class="pl-point-button" type="submit"
					value="<spring:message code="greenBall.anadir"/>" /> 
			</c:if>
		</td>
	</tr>

</table>




  



  <h3><spring:message code="tournaments.listaTorneos"/></h3><input type="submit" name="borrarTodo" class="pl-point-button btn pull-right" value="<spring:message text="Borrar todo"/>"/>

<c:if test="${!empty listTournaments}">
	<div class="tab-content">
	<table class="tab-score">
	<tr class="top-score-table">
		<td width="80"><spring:message code="tournaments.shortName2"/></td>
		<td width="120"><spring:message code="tournaments.name2"/></td>
		<td width="120"><spring:message code="tournaments.start"/></td>
		<td width="120"><spring:message code="tournaments.end"/></td>
		<td width="60"><spring:message code="greenBall.editar"/></td>
		<td width="60"><spring:message code="greenBall.borrar"/></td>
		<td width="60"><spring:message code="tournaments.configurar"/></td>
		<td width="60">URL</td>
	</tr>
	<c:forEach items="${listTournaments}" var="tournament">
		<tr>
			<td>${tournament.shortName}</td>
			<td>${tournament.name}</td>
			<td>${tournament.startDate}</td>
			<td>${tournament.endDate}</td>
			<td><a href="<c:url value='/editTournament/${tournament.id}' />" ><spring:message code="greenBall.editar"/></a></td>
			<td><a href="<c:url value='/removeTournament/${tournament.id}' />" ><spring:message code="greenBall.borrar"/></a></td>
			<td><a href="<c:url value='/${tournament.shortName}/categories' />" ><spring:message code="tournaments.configurar"/></a></td>
			<td><a href="<c:url value='/removeTournament/${tournament.id}' />" ><spring:message code="tournaments.url"/></a></td>
		</tr>
	</c:forEach>
	</table>
	</div>
</c:if>

<div class="content-banner">
	<ul class="sponsor second"></ul>
</div>

</div>

</form:form>



<%@include file="footer.jsp" %>>


