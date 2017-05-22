<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link href="<%=pathGreenBall%>/resources/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=pathGreenBall%>/resources/js/bootstrap-datepicker.js"></script>



<style>
	.btn-primary {background-color:#212121; border-color:#333333}
	.btn-primary.active, .btn-primary:active, .open>.dropdown-toggle.btn-primary {background-color:#f59123; border-color:#e78315}
	.btn-primary:hover, .btn-primary.active:hover {
    color: #fff;
    background-color: #fcb86e;
}
	
</style>	
	
<script type="text/javascript">

function radioChanged(){
	if($("#RRRB").is(':checked')){
		alert("Hey, en hombres RR si lo hago");
		$("#groupsSize").attr("disabled", false);
		$("#advanceSecond").attr("disabled", false);
		$("#advanceThird").attr("disabled", false);
		$("#drawSize").attr("disabled", true);	
		
	}
	else if($("#MDRB").is(':checked')){
		alert("Hey, en hombres MD si lo hago");
		$("#groupsSize").attr("disabled", true);
		$("#drawSize").attr("disabled", false);
		$("#advanceSecond").attr("disabled", true);
		$("#advanceThird").attr("disabled", true);
		
	}
		
}

function radioChangedW(){
	if($("#RRRBW").is(':checked')){
		$("#groupsSizeW").attr("disabled", false);
		$("#advanceSecondW").attr("disabled", false);
		$("#advanceThirdW").attr("disabled", false);
		$("#drawSizeW").attr("disabled", true);	
		
	}
	else if($("#MDRBW").is(':checked')){
		$("#groupsSizeW").attr("disabled", true);
		$("#drawSizeW").attr("disabled", false);
		$("#advanceSecondW").attr("disabled", true);
		$("#advanceThirdW").attr("disabled", true);
		
	}
		
}

function radioChangedDM(){
	if($("#RRRBDM").is(':checked')){
		$("#groupsSizeDM").attr("disabled", false);
		$("#advanceSecondDM").attr("disabled", false);
		$("#advanceThirdDM").attr("disabled", false);
		$("#drawSizeDM").attr("disabled", true);	
		
	}
	else if($("#MDRBDM").is(':checked')){
		$("#groupsSizeDM").attr("disabled", true);
		$("#drawSizeDM").attr("disabled", false);
		$("#advanceSecondDM").attr("disabled", true);
		$("#advanceThirdDM").attr("disabled", true);
		
	}
		
}

function radioChangedMA(){
	if($("#RRRBMA").is(':checked')){
		$("#groupsSizeMA").attr("disabled", false);
		$("#advanceSecondMA").attr("disabled", false);
		$("#advanceThirdMA").attr("disabled", false);
		$("#drawSizeMA").attr("disabled", true);	
		
	}
	else if($("#MDRBMA").is(':checked')){
		$("#groupsSizeMA").attr("disabled", true);
		$("#drawSizeMA").attr("disabled", false);
		$("#advanceSecondMA").attr("disabled", true);
		$("#advanceThirdMA").attr("disabled", true);
		
	}
		
}

function radioChangedMK(){
	if($("#RRRBMK").is(':checked')){
		$("#groupsSizeMK").attr("disabled", false);
		$("#advanceSecondMK").attr("disabled", false);
		$("#advanceThirdMK").attr("disabled", false);
		$("#drawSizeMK").attr("disabled", true);	
		
	}
	else if($("#MDRBMK").is(':checked')){
		$("#groupsSizeMK").attr("disabled", true);
		$("#drawSizeMK").attr("disabled", false);
		$("#advanceSecondMK").attr("disabled", true);
		$("#advanceThirdMK").attr("disabled", true);
		
	}
		
}

function radioChangedNM(){
	if($("#RRRBNM").is(':checked')){
		$("#groupsSizeNM").attr("disabled", false);
		$("#advanceSecondNM").attr("disabled", false);
		$("#advanceThirdNM").attr("disabled", false);
		$("#drawSizeNM").attr("disabled", true);	
		
	}
	else if($("#MDRBNM").is(':checked')){
		$("#groupsSizeNM").attr("disabled", true);
		$("#drawSizeNM").attr("disabled", false);
		$("#advanceSecondNM").attr("disabled", true);
		$("#advanceThirdNM").attr("disabled", true);
		
	}
		
}

function radioChangedNW(){
	if($("#RRRBNW").is(':checked')){
		$("#groupsSizeNW").attr("disabled", false);
		$("#advanceSecondNW").attr("disabled", false);
		$("#advanceThirdNW").attr("disabled", false);
		$("#drawSizeNW").attr("disabled", true);	
		
	}
	else if($("#MDRBNW").is(':checked')){
		$("#groupsSizeNW").attr("disabled", true);
		$("#drawSizeNW").attr("disabled", false);
		$("#advanceSecondNW").attr("disabled", true);
		$("#advanceThirdNW").attr("disabled", true);
		
	}
		
}

function radioChangedNMD(){
	if($("#RRRBNMD").is(':checked')){
		$("#groupsSizeNMD").attr("disabled", false);
		$("#advanceSecondNMD").attr("disabled", false);
		$("#advanceThirdNMD").attr("disabled", false);
		$("#drawSizeNMD").attr("disabled", true);	
		
	}
	else if($("#MDRBNMD").is(':checked')){
		$("#groupsSizeNMD").attr("disabled", true);
		$("#drawSizeNMD").attr("disabled", false);
		$("#advanceSecondNMD").attr("disabled", true);
		$("#advanceThirdNMD").attr("disabled", true);
		
	}
		
}

function radioChangedNWD(){
	if($("#RRRBNWD").is(':checked')){
		$("#groupsSizeNWD").attr("disabled", false);
		$("#advanceSecondNWD").attr("disabled", false);
		$("#advanceThirdNWD").attr("disabled", false);
		$("#drawSizeNWD").attr("disabled", true);	
		
	}
	else if($("#MDRBNWD").is(':checked')){
		$("#groupsSizeNWD").attr("disabled", true);
		$("#drawSizeNWD").attr("disabled", false);
		$("#advanceSecondNWD").attr("disabled", true);
		$("#advanceThirdNWD").attr("disabled", true);
		
	}
		
}

</script>	




</head>
<body>
<%@ include file="head.jsp" %>
<%@ include file="menu.jsp" %>



<c:url var="addAction" value="/addTournamentDetails" ></c:url>


<section class="drawer">
     <section id="single-match-pl" class="container secondary-page">
      <div class="general general-results players">
           <div class="top-score-title right-score col-md-16">
           	  <div id ="atp-match"class="top-score-title player-vs">
                <h3>Total <span>Scores</span><span class="point-little">.</span></h3>
                <div class="main">
                       <div class="tabs standard single-pl">
                                <ul class="tab-links-match tb-set">
                                     <c:choose>
                                            		<c:when test="${currentSuperMode eq 'S' }">
                                            			<li class="active" onclick="${'#tab1a'}.attr('class', 'tab active')"><a class="first-tabs" href="#tab1"><spring:message code="category.singles" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li onclick="${'#tab1a'}.attr('class', 'tab active')"><a href="#tab1"><spring:message code="category.singles" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentSuperMode eq 'D' }">
                                            			<li class="active" onselect="${'#tab1d'}.attr('class', 'tab active');  " ><a class="first-tabs" href="#tab2"><spring:message code="category.doubles" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li onselect="${'#tab1d'}.attr('class', 'tab active');  " ><a href="#tab2"><spring:message code="category.doubles" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentSuperMode eq 'MIX' }">
                                            			<li class="active"><a class="first-tabs" href="#tab3"><spring:message code="category.mixes" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a href="#tab3"><spring:message code="category.mixes" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                </ul>
                                <div class="tab-content single-match">
                                <c:choose>
								    <c:when test="${currentSuperMode eq 'S' }">
								       <c:set var="isS" value="tab active"></c:set>
								    </c:when>
								    <c:otherwise>
								       <c:set var="isS" value="tab"></c:set>
								    </c:otherwise>
								</c:choose>
                                    <div id="tab1" class="${isS }">
                                       <h3 class="tab-match-title"><spring:message code="category.singles" /></h3>
                                        <div class="tabs standard">
                                            <ul class="tab-links-match">
                                             
                                            		<c:choose>
                                            		<c:when test="${currentMode eq 'SM' }">
                                            			<li class="active"><a class="first-tabs" href="#tab1a"><spring:message code="category.mens" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            		<c:choose>
                                            			<c:when test="${fn:startsWith(currentMode, 'S')}">
                                            				<li><a href="#tab1a"><spring:message code="category.mens" /></a></li>	
                                            			</c:when>
                                            			<c:otherwise>
                                            				<li class="active"><a class="first-tabs" href="#tab1a"><spring:message code="category.mens" /></a></li>
                                            			</c:otherwise>
                                            		</c:choose>
                                            			
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'SW' }">
                                            			<li class="active"><a class="first-tabs" href="#tab2a"><spring:message code="category.woman" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a href="#tab2a"><spring:message code="category.woman" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'SMN' }">
                                            			<li class="active"><a class="first-tabs" href="#tab3a"><spring:message code="category.nv.mens" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a href="#tab3a"><spring:message code="category.nv.mens" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'SWN' }">
                                            			<li class="active"><a class="first-tabs" href="#tab4a"><spring:message code="category.nv.woman" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a href="#tab4a"><spring:message code="category.nv.woman" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	
                                            </ul>
                                            <div class="tab-content">
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'SM' }">
                                            			<c:set var="isSM" value="tab active"></c:set>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<c:choose>
                                            				<c:when test="${fn:startsWith(currentMode, 'S')}">
                                            					<c:set var="isSM" value="tab"></c:set>
                                            				</c:when>
                                            				<c:otherwise>
                                            					<c:set var="isSM" value="tab active"></c:set>
                                            				</c:otherwise>
                                            			</c:choose>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<div id="tab1a" class="${isSM}">
                                                <form:form action="${addAction}" commandName="tournamentDetails" name="tournamentDetails" id="tournamentDetails">
												
												<input type="hidden" value="${shortName}" name="shortName"></input>
												<form:hidden path="id" disabled="disable"  />
                                                <div class="captura-right-content">
                                                	<div class="captura-center-content">
															<div class="form-group">
																<label class="col-sm-4 control-label">* <spring:message code="tournamentDetails.format" /></label>
				                                                <div class="btn-group" >
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="RR" id="RRRB" onchange="javascript:radioChanged();"/>Round Robbin </label>
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="MD" id="MDRB" onchange="javascript:radioChanged();"/>Main Draw </label>
				                                                </div>
				                                            </div>
				                                     </div>
													 <div class="captura-right-content">
				                                                <spring:bind path="points">
																  <div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.points" /></label>
																	<div class="col-sm-5">
																		<form:textarea path="points" class="form-control"
														                                id="points" placeholder="" />
																		<form:errors path="points" class="control-label"/>
																	</div>
																  </div>
																</spring:bind>
				                                     </div>
				                                     <div class="captura-right-content">
				                                     	<div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.match" /></label>
																		<div class="col-sm-4">
																			<form:select path="matchDuration" name="matchDuration" id="matchDuration" class="form-control" >
																				<form:option value="30" selected="selected">30 min</form:option>
																				<form:option value="60">1 hr</form:option>
																				<form:option value="90">1.5 hrs</form:option>
																				<form:option value="120">2 hrs</form:option>
																				<form:option value="150">2.5 hrs</form:option>
																				<form:option value="180">3 hrs</form:option>
																				<form:option value="240">4 hrs</form:option>
																				<form:option value="300">5 hrs</form:option>
																			</form:select>
                                                						</div>
																	
																  </div>
				                                     </div>	
				                                     <div class="captura-right-content">
														<spring:bind path="drawSize">
														  <div class="form-group ${hasError} ">
															<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.draw" /></label>
															<div class="col-sm-1">
																<c:choose>
																	<c:when test="${tournamentDetails.format eq 'MD' }">
																		<form:input path="drawSize" class="form-control" id="drawSize"  disabled="false" />
																	</c:when>
																	<c:otherwise>
																		<form:input path="drawSize" class="form-control" id="drawSize"  disabled="true" />
																	</c:otherwise>
																</c:choose>
												                <form:errors path="drawSize" class="control-label" />
															</div>
														  </div>
														</spring:bind>
													</div>
													<div class="captura-right-content">
														<spring:bind path="groupsSize">
														  <div class="form-group ${hasError} ">
															<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.group" /></label>
															<div class="col-sm-1">
																<c:choose>
																	<c:when test="${tournamentDetails.format eq 'MD' }">
																		<form:input path="groupsSize" class="form-control" id="groupsSize"  disabled="true"/>
																	</c:when>
																	<c:otherwise>
																		<form:input path="groupsSize" class="form-control" id="groupsSize"  disabled="false"/>
																	</c:otherwise>
																</c:choose>
												                <form:errors path="groupsSize" class="control-label" />
															</div>
														  </div>
														</spring:bind>
													</div>
													<div class="captura-right-content">
				                                     	<div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label"><spring:message code="tournamentDetails.seconds" /></label>
																		<div class="col-sm-2">
																		<c:choose>
																			<c:when test="${tournamentDetails.format eq 'MD' }">
																				<form:select path="advanceSecond" name="advanceSecond" id="advanceSecond" class="form-control" disabled="true" >
																				<form:option value="0" selected="selected"><spring:message code="tournamentDetails.none" /></form:option>
																				<form:option value="9"><spring:message code="tournamentDetails.all" /></form:option>
																				<form:option value="1"><spring:message code="tournamentDetails.1" /></form:option>
																				<form:option value="2"><spring:message code="tournamentDetails.2" /></form:option>
																				<form:option value="3"><spring:message code="tournamentDetails.3" /></form:option>
																				<form:option value="4"><spring:message code="tournamentDetails.4" /></form:option>
																				<form:option value="5"><spring:message code="tournamentDetails.5" /></form:option>
																			</form:select>
																			</c:when>
																			<c:otherwise>
																				<form:select path="advanceSecond" name="advanceSecond" id="advanceSecond" class="form-control" disabled="false"  >
																				<form:option value="0" selected="selected"><spring:message code="tournamentDetails.none" /></form:option>
																				<form:option value="9"><spring:message code="tournamentDetails.all" /></form:option>
																				<form:option value="1"><spring:message code="tournamentDetails.1" /></form:option>
																				<form:option value="2"><spring:message code="tournamentDetails.2" /></form:option>
																				<form:option value="3"><spring:message code="tournamentDetails.3" /></form:option>
																				<form:option value="4"><spring:message code="tournamentDetails.4" /></form:option>
																				<form:option value="5"><spring:message code="tournamentDetails.5" /></form:option>
																				</form:select>
																			</c:otherwise>
																		</c:choose>
																			
                                                						</div>
                                                					<label class="col-sm-2 control-label"><spring:message code="tournamentDetails.thirds" /></label>
																		<div class="col-sm-2">
																			<c:choose>
																			<c:when test="${tournamentDetails.format eq 'MD' }">
																				<form:select path="advanceThird" name="advanceThird" id="advanceThird" class="form-control" disabled="true"  >
																				<form:option value="0" selected="selected"><spring:message code="tournamentDetails.none" /></form:option>
																				<form:option value="9"><spring:message code="tournamentDetails.all" /></form:option>
																				<form:option value="1"><spring:message code="tournamentDetails.1" /></form:option>
																				<form:option value="2"><spring:message code="tournamentDetails.2" /></form:option>
																				<form:option value="3"><spring:message code="tournamentDetails.3" /></form:option>
																				<form:option value="4"><spring:message code="tournamentDetails.4" /></form:option>
																				<form:option value="5"><spring:message code="tournamentDetails.5" /></form:option>
																			</form:select>
																			</c:when>
																			<c:otherwise>
																				<form:select path="advanceThird" name="advanceThird" id="advanceThird" class="form-control" disabled="false" >
																				<form:option value="0" selected="selected"><spring:message code="tournamentDetails.none" /></form:option>
																				<form:option value="9"><spring:message code="tournamentDetails.all" /></form:option>
																				<form:option value="1"><spring:message code="tournamentDetails.1" /></form:option>
																				<form:option value="2"><spring:message code="tournamentDetails.2" /></form:option>
																				<form:option value="3"><spring:message code="tournamentDetails.3" /></form:option>
																				<form:option value="4"><spring:message code="tournamentDetails.4" /></form:option>
																				<form:option value="5"><spring:message code="tournamentDetails.5" /></form:option>
																			</form:select>
																			</c:otherwise>
																		</c:choose>
                                                						</div>
																	
													      </div>
				                                     </div>
				                                     <div class="captura-right-content">
				                                     	<div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.categoriesRel" /></label>
																		<div class="col-sm-4">
																			<form:select path="categories" name="categories" id="categories" multiple="true" class="form-control" >
																				<c:forEach var="tp" items="${mensCategoriesS}">
																					<c:choose>
																						<c:when test="${fn:contains(selectedCategoriesSM, tp.name)}">
																							<form:option value="${tp.id}" selected="true">${tp.name }</form:option>
																						</c:when>
																						<c:otherwise>
																							<form:option value="${tp.id}">${tp.name }</form:option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																				<!--  form:options items="${mensCategoriesS}" itemValue="id" itemLabel="name"/>-->
																				<!--  form:options items="${selectedCategoriesSM.contains(tp) eq true}" itemValue="id" itemLabel="name"/>-->
																				<!--  form:options items="${tp.name}" itemValue="id" itemLabel="name"/>-->
																			</form:select>
                                                						</div>
																	
																  </div>
				                                     </div>
				                                     </div>
				                                     <div class="captura-right-content">
				                                     <table>
														<tr>
															<td colspan="2">
																	<input class="pl-point-button" type="submit"
																		value="<spring:message code="greenBall.guardar"/>" />
																	<input class="pl-point-button" type="submit"
																		value="<spring:message code="greenBall.cancelar"/>" name="cancelar" />
															</td>
														</tr>
													
													</table>
													</div>

													
														
														<table class="tab-score">
														<tr class="top-score-table">
															<td width="80"><spring:message code="tournamentDetails.config.id" /></td>
															<td width="120"><spring:message code="tournamentDetails.categories" /></td>
															<td width="60"><spring:message code="greenBall.editar"/></td>
															<td width="60"><spring:message code="greenBall.borrar"/></td>
														</tr>
														<c:forEach items="${tournamentDetailsSM}" var="configura">
															<tr>
																<td>${configura.id}</td>
																<c:forEach items="${configura.categories}" var="categor">
																	<c:set var="categoria" value="${ categoria} ${categor.name}, "></c:set>
																</c:forEach>
																<td>${categoria}</td>
																<td><a href="<c:url value='/editTournamentDetails/${configura.id}' />" ><spring:message code="greenBall.editar"/></a></td>
																<td><a href="<c:url value='/removeTournamentDetails/${configura.id}' />" ><spring:message code="greenBall.borrar"/></a></td>
																<c:set var="categoria" value=""></c:set>
															</tr>
														</c:forEach>
														</table>
														
													 
												</form:form>	
				                               </div> 
				                               
				                              
											   <jsp:include page="tournamentDetailsTab2a.jsp"></jsp:include>	
                                               <jsp:include page="tournamentDetailsTab3a.jsp"></jsp:include>
                                               <jsp:include page="tournamentDetailsTab4a.jsp"></jsp:include>
                                                
                                            </div>
                                        </div>     
                                    </div>
                                    <jsp:include page="tournamentDetailsTab2.jsp"></jsp:include>
                                    <jsp:include page="tournamentDetailsTab3.jsp"></jsp:include>
                                     
          					  </div><!--Close Top Match-->
           				</div>
           			</div>
         		 </div>
         	</div>
         </div>
     </section>
   
</section>


 <section id="sponsor" class="container">
            <!--SECTION SPONSOR-->
           <div class="client-sport client-sport-nomargin">
               <div class="content-banner">
                     <ul class="sponsor second">
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/02.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/03.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/04.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/06.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/08.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/13.png" alt="" /></li>
                    </ul>
                </div>
          </div>
       </section>


<%@ include file="foot.jsp" %>

<script src="<%=pathGreenBall%>/resources/js/jquery.ui.totop.js" type="text/javascript"></script>


<script>
    jQuery(document).ready(function () {
        jQuery('.tabs .tab-links-match a').on('click', function (e) {
            var currentAttrValue = jQuery(this).attr('href');

            // Show/Hide Tabs
            jQuery('.tabs ' + currentAttrValue).show().siblings().hide();

            // Change/remove current tab to active
            jQuery(this).parent('li').addClass('active').siblings().removeClass('active');

            e.preventDefault();
        });
    });
</script>

<script src="<%=pathGreenBall%>/resources/js/custom.js" type="text/javascript"></script>


</body>
</html>