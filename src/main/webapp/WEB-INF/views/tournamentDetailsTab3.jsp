<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:url var="addAction" value="/addTournamentDetails" ></c:url>
<c:choose>
    <c:when test="${currentSuperMode eq 'M' }">
       <c:set var="isM" value="tab active"></c:set>
    </c:when>
    <c:otherwise>
       <c:set var="isM" value="tab"></c:set>
    </c:otherwise>
</c:choose>
<div id="tab3" class="${isM}">
                                          <h3 class="tab-match-title"><spring:message code="category.mixtos" /></h3>
                                           <div class="tabs standard">
                                            <ul class="tab-links-match">
                                                 <c:choose>
                                            		<c:when test="${currentMode eq 'MA' }">
                                            			<li class="active"><a class="first-tabs" href="#tab1m"><spring:message code="category.mixtos" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            		<c:choose>
                                            			<c:when test="${fn:startsWith(currentMode, 'M')}">
                                            				<li><a href="#tab1m"><spring:message code="category.mixtos" /></a></li>	
                                            			</c:when>
                                            			<c:otherwise>
                                            				<li class="active"><a class="first-tabs" href="#tab1m"><spring:message code="category.mixtos" /></a></li>
                                            			</c:otherwise>
                                            		</c:choose>
                                            			
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'MK' }">
                                            			<li class="active"><a class="first-tabs" href="#tab2m"><spring:message code="category.nv.mixtos" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a href="#tab2m"><spring:message code="category.nv.mixtos" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>                                            	
                                            </ul>
                                            <div class="tab-content">
                                           	   <c:choose>
                                            		<c:when test="${currentMode eq 'MA' }">
                                            			<c:set var="isMA" value="tab active"></c:set>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<c:choose>
                                            				<c:when test="${fn:startsWith(currentMode, 'M')}">
                                            					<c:set var="isMA" value="tab"></c:set>
                                            				</c:when>
                                            				<c:otherwise>
                                            					<c:set var="isMA" value="tab active"></c:set>
                                            				</c:otherwise>
                                            			</c:choose>
                                            		</c:otherwise>
                                            	</c:choose>
                                                <div id="tab1m" class="${isMA}">
                                                	<form:form action="${addAction}" commandName="tournamentDetailsMixesA" name="tournamentDetailsMixesA" id="tournamentDetailsMixesA" modelAttribute="tournamentDetailsMixesA">
												
												<input type="hidden" value="${shortName}" name="shortName"></input>
												<form:hidden path="id" disabled="disable"  />
                                                <div class="captura-right-content">
                                                	<div class="captura-center-content">
															<div class="form-group">
																<label class="col-sm-4 control-label">* <spring:message code="tournamentDetails.format" /></label>
				                                                <div class="btn-group" >
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="RR" id="RRRBMA" onchange="javascript:radioChangedMA();"/>Round Robbin </label>
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="MD" id="MDRBMA" onchange="javascript:radioChangedMA();"/>Main Draw </label>
				                                                </div>
				                                            </div>
				                                     </div>
													 <div class="captura-right-content">
				                                                <spring:bind path="points">
																  <div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.points" /></label>
																	<div class="col-sm-5">
																		<form:textarea path="points" class="form-control"
														                                id="pointsMA" placeholder="" />
																		<form:errors path="points" class="control-label"/>
																	</div>
																  </div>
																</spring:bind>
				                                     </div>
				                                     <div class="captura-right-content">
				                                     	<div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.match" /></label>
																		<div class="col-sm-4">
																			<form:select path="matchDuration" name="matchDurationMA" id="matchDurationMA" class="form-control" >
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
																	<c:when test="${tournamentDetailsMixesA.format eq 'MD' }">
																		<form:input path="drawSize" class="form-control" id="drawSizeMA"  disabled="false" />
																	</c:when>
																	<c:otherwise>
																		<form:input path="drawSize" class="form-control" id="drawSizeMA"  disabled="true" />
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
																	<c:when test="${tournamentDetailsMixesA.format eq 'MA' }">
																		<form:input path="groupsSize" class="form-control" id="groupsSizeMA"  disabled="true"/>
																	</c:when>
																	<c:otherwise>
																		<form:input path="groupsSize" class="form-control" id="groupsSizeMA"  disabled="false"/>
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
																			<c:when test="${tournamentDetailsMixesA.format eq 'MA' }">
																				<form:select path="advanceSecond" name="advanceSecondMA" id="advanceSecondMA" class="form-control" disabled="true" >
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
																				<form:select path="advanceSecond" name="advanceSecondMA" id="advanceSecondMA" class="form-control" disabled="false"  >
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
																			<c:when test="${tournamentDetailsMixesA.format eq 'MA' }">
																				<form:select path="advanceThird" name="advanceThirdMA" id="advanceThirdMA" class="form-control" disabled="true"  >
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
																				<form:select path="advanceThird" name="advanceThirdMA" id="advanceThirdMA" class="form-control" disabled="false" >
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
																			<form:select path="categories" name="categories" id="categoriesMA" multiple="true" class="form-control" >
																				<c:forEach var="tp" items="${mixesCategories}">
																					<c:choose>
																						<c:when test="${fn:contains(selectedCategoriesMA, tp.name)}">
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
																		value="<spring:message code="greenBall.guardar"/>" name="MA" />
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
														<c:forEach items="${tournamentDetailsMA}" var="configura">
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
                                                <c:choose>
                                            		<c:when test="${currentMode eq 'MK' }">
                                            			<c:set var="isMK" value="tab active"></c:set>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<c:set var="isMK" value="tab"></c:set>
                                            		</c:otherwise>
                                            	</c:choose>
                                                
                                                <div id="tab2m" class="${isMK }">  
                                                	<form:form action="${addAction}" commandName="tournamentDetailsMixesK" name="tournamentDetailsMixesK" id="tournamentDetailsMixesK" modelAttribute="tournamentDetailsMixesK">
												
												<input type="hidden" value="${shortName}" name="shortName"></input>
												<form:hidden path="id" disabled="disable"  />
                                                <div class="captura-right-content">
                                                	<div class="captura-center-content">
															<div class="form-group">
																<label class="col-sm-4 control-label">* <spring:message code="tournamentDetails.format" /></label>
				                                                <div class="btn-group" >
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="RR" id="RRRBMK" onchange="javascript:radioChangedMK();"/>Round Robbin </label>
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="MD" id="MDRBMK" onchange="javascript:radioChangedMK();"/>Main Draw </label>
				                                                </div>
				                                            </div>
				                                     </div>
													 <div class="captura-right-content">
				                                                <spring:bind path="points">
																  <div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.points" /></label>
																	<div class="col-sm-5">
																		<form:textarea path="points" class="form-control"
														                                id="pointsMK" placeholder="" />
																		<form:errors path="points" class="control-label"/>
																	</div>
																  </div>
																</spring:bind>
				                                     </div>
				                                     <div class="captura-right-content">
				                                     	<div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.match" /></label>
																		<div class="col-sm-4">
																			<form:select path="matchDuration" name="matchDurationMK" id="matchDurationMK" class="form-control" >
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
																	<c:when test="${tournamentDetailsMixesK.format eq 'MD' }">
																		<form:input path="drawSize" class="form-control" id="drawSizeMK"  disabled="false" />
																	</c:when>
																	<c:otherwise>
																		<form:input path="drawSize" class="form-control" id="drawSizeMK"  disabled="true" />
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
																	<c:when test="${tournamentDetailsMixesK.format eq 'MA' }">
																		<form:input path="groupsSize" class="form-control" id="groupsSizeMK"  disabled="true"/>
																	</c:when>
																	<c:otherwise>
																		<form:input path="groupsSize" class="form-control" id="groupsSizeMK"  disabled="false"/>
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
																			<c:when test="${tournamentDetailsMixesK.format eq 'MA' }">
																				<form:select path="advanceSecond" name="advanceSecondMK" id="advanceSecondMK" class="form-control" disabled="true" >
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
																				<form:select path="advanceSecond" name="advanceSecondMK" id="advanceSecondMK" class="form-control" disabled="false"  >
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
																			<c:when test="${tournamentDetailsMixesK.format eq 'MA' }">
																				<form:select path="advanceThird" name="advanceThirdMK" id="advanceThirdMK" class="form-control" disabled="true"  >
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
																				<form:select path="advanceThird" name="advanceThirdMK" id="advanceThirdMK" class="form-control" disabled="false" >
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
																			<form:select path="categories" name="categories" id="categoriesMK" multiple="true" class="form-control" >
																				<c:forEach var="tp" items="${nvmixesCategories}">
																					<c:choose>
																						<c:when test="${fn:contains(selectedCategoriesMK, tp.name)}">
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
																		value="<spring:message code="greenBall.guardar"/>" name="MK" />
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
														<c:forEach items="${tournamentDetailsMK}" var="configura">
															<tr>
																<td>${configura.id}</td>
																<c:forEach items="${configura.categories}" var="categor">
																	<c:set var="categoria" value="${ categoria} ${categor.name}, "></c:set>
																</c:forEach>
																<td>${categoria}</td>
																<td><a href="<c:url value='/editTournamentDetails/${configura.id}' />" ><spring:message code="greenBall.editar" /></a></td>
																<td><a href="<c:url value='/removeTournamentDetails/${configura.id}' />" ><spring:message code="greenBall.borrar" /></a></td>
																<c:set var="categoria" value=""></c:set>
															</tr>
														</c:forEach>
														</table>
														
													 
												</form:form>
                                                	
                                                	
														
                                                </div>
                                            </div>
                                   		   </div>
                                     </div>