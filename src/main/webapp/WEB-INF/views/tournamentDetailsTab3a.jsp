<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:url var="addAction" value="/addTournamentDetails" ></c:url>
<c:choose>
                                            		<c:when test="${currentMode eq 'SMN' }">
                                            			<c:set var="isSMN" value="tab active"></c:set>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<c:set var="isSMN" value="tab"></c:set>
                                            		</c:otherwise>
                                            	</c:choose>
												
                                                <div id="tab3a" class="${isSMN }">
                                                	<form:form action="${addAction}" commandName="tournamentDetailsNMens" name="tournamentDetailsNMens" id="tournamentDetailsNMens" modelAttribute="tournamentDetailsNMens">
												
													<input type="hidden" value="${shortName}" name="shortName"></input>
													<form:hidden path="id" disabled="disable"  />
													<div class="captura-right-content">
	                                                	<div class="captura-center-content">
																<div class="form-group">
																	<label class="col-sm-4 control-label">* <spring:message code="tournamentDetails.format" /></label>
					                                                <div class="btn-group" >
					                                                	<label class="btn btn-primary">
					                                                	<form:radiobutton path="format" value="RR" id="RRRBNM" onchange="javascript:radioChangedNM();"/>Round Robbin </label>
					                                                	<label class="btn btn-primary">
					                                                	<form:radiobutton path="format" value="MD" id="MDRBNM" onchange="javascript:radioChangedNM();"/>Main Draw </label>
					                                                </div>
					                                            </div>
					                                     </div>
					                                     <div class="captura-right-content">
				                                                <spring:bind path="points">
																  <div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.points" /></label>
																	<div class="col-sm-5">
																		<form:textarea path="points" class="form-control"
														                                id="pointsNM" placeholder="" />
																		<form:errors path="points" class="control-label"/>
																	</div>
																  </div>
																</spring:bind>
				                                     </div>
				                                     <div class="captura-right-content">
				                                     	<div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.match" /></label>
																		<div class="col-sm-4">
																			<form:select path="matchDuration" name="matchDurationNM" id="matchDurationNM" class="form-control" >
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
																	<c:when test="${tournamentDetailsNMens.format eq 'MD' }">
																		<form:input path="drawSize" class="form-control" id="drawSizeNM"  disabled="false"/>
																	</c:when>
																	<c:otherwise>
																		<form:input path="drawSize" class="form-control" id="drawSizeNM"  disabled="true"/>
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
																	<c:when test="${tournamentDetailsNMens.format eq 'MD' }">
																		<form:input path="groupsSize" class="form-control" id="groupsSizeNM"  disabled="true"/>
																	</c:when>
																	<c:otherwise>
																		<form:input path="groupsSize" class="form-control" id="groupsSizNM"  disabled="false"/>
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
																			<c:when test="${tournamentDetailsNMens.format eq 'MD' }">
																				<form:select path="advanceSecond" name="advanceSecond" id="advanceSecondNM" class="form-control" disabled="true" >
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
																				<form:select path="advanceSecond" name="advanceSecond" id="advanceSecondNM" class="form-control" disabled="false"  >
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
																			<c:when test="${tournamentDetailsNMens.format eq 'MD' }">
																				<form:select path="advanceThird" name="advanceThird" id="advanceThirdNM" class="form-control" disabled="true" >
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
																				<form:select path="advanceThird" name="advanceThird" id="advanceThirdNM" class="form-control" disabled="false"  >
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
														
														  <div class="form-group ${hasError} ">
														  	<spring:bind path="fieldSize">
															<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.field" /></label>
															<div class="col-sm-2">
																<form:input path="fieldSize" class="form-control"
												                                id="fieldSizeNM"  />
												                <form:errors path="fieldSize" class="control-label" />
															</div>
															 </spring:bind>
														  </div>
														
													</div>
													<div class="captura-right-content">
														<spring:bind path="ballSize">
														  <div class="form-group ${hasError} ">
															<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.ball" /></label>
															<div class="col-sm-2">
																<form:input path="ballSize" class="form-control"
												                                id="ballSizeNM"  />
												                <form:errors path="ballSize" class="control-label" />
															</div>
														  </div>
														</spring:bind>
													</div>
													<div class="captura-right-content">
														<spring:bind path="serveMode">
														  <div class="form-group ${hasError} ">
															<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.serve" /></label>
															<div class="col-sm-2">
																<form:input path="serveMode" class="form-control"
												                                id="serveModeNM"   />
												                <form:errors path="serveMode" class="control-label" />
															</div>
														  </div>
														</spring:bind>
													</div>
				                                     
													 <div class="captura-right-content" >
				                                     	<div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.categoriesRel" /></label>
																		<div class="col-sm-4">
																			<form:select path="categories" name="categoriesNM" id="categoriesNM" multiple="true" class="form-control" >
																				<c:forEach var="tp" items="${nvmensCategoriesS}">
																					<c:choose>
																						<c:when test="${fn:contains(selectedCategoriesSMN, tp.name)}">
																							<form:option value="${tp.id}" selected="true">${tp.name }</form:option>
																						</c:when>
																						<c:otherwise>
																							<form:option value="${tp.id}">${tp.name }</form:option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
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
																		value="<spring:message code="greenBall.guardar"/>"  name="SMN"/>
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
															<td width="60"><spring:message code="greenBall.editar" /></td>
															<td width="60"><spring:message code="greenBall.borrar" /></td>
														</tr>
														<c:forEach items="${tournamentDetailsSMN}" var="configura">
															<tr>
																<td>${configura.id}</td>
																<c:forEach items="${configura.categories}" var="categor">
																	<c:set var="categoria" value="${ categoria} ${categor.name}, "></c:set>
																</c:forEach>
																<td>${categoria}</td>
																<td><a href="<c:url value='/${shortName}/editTournamentDetails/${configura.id}' />" ><spring:message code="greenBall.editar" /></a></td>
																<td><a href="<c:url value='/${shortName}/removeTournamentDetails/${configura.id}' />" ><spring:message code="greenBall.borrar" /></a></td>
																<c:set var="categoria" value=""></c:set>
															</tr>
														</c:forEach>
														</table>
														
				                                     
													
													</form:form>
                                                </div>