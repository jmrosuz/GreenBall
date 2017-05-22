<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:url var="addAction" value="/addTournamentDetails" ></c:url>
<c:choose>
    <c:when test="${currentSuperMode eq 'D' }">
       <c:set var="isD" value="tab active"></c:set>
    </c:when>
    <c:otherwise>
       <c:set var="isD" value="tab"></c:set>
    </c:otherwise>
</c:choose>
<div id="tab2" class="${isD}">
                                          <h3 class="tab-match-title"><spring:message code="category.doubles" /></h3>
                                           <div class="tabs standard">
                                            <ul class="tab-links-match">
                                                 <c:choose>
                                            		<c:when test="${currentMode eq 'DM' }">
                                            			<li class="active"><a class="first-tabs" href="#tab1d"><spring:message code="category.mens" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            		<c:choose>
                                            			<c:when test="${fn:startsWith(currentMode, 'D')}">
                                            				<li><a href="#tab1d"><spring:message code="category.mens" /></a></li>	
                                            			</c:when>
                                            			<c:otherwise>
                                            				<li class="active"><a class="first-tabs" href="#tab1d"><spring:message code="category.mens" /></a></li>
                                            			</c:otherwise>
                                            		</c:choose>
                                            			
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'DW' }">
                                            			<li class="active"><a class="first-tabs" href="#tab2d"><spring:message code="category.woman" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a href="#tab2d"><spring:message code="category.woman" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'DMN' }">
                                            			<li class="active"><a class="first-tabs" href="#tab3d"><spring:message code="category.nv.mens" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a href="#tab3d"><spring:message code="category.nv.mens" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'DWN' }">
                                            			<li class="active"><a class="first-tabs" href="#tab4d"><spring:message code="category.nv.woman" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a href="#tab4d"><spring:message code="category.nv.woman" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                                
                                            </ul>
                                            <div class="tab-content">
                                           	   <c:choose>
                                            		<c:when test="${currentMode eq 'DM' }">
                                            			<c:set var="isDM" value="tab active"></c:set>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<c:choose>
                                            				<c:when test="${fn:startsWith(currentMode, 'D')}">
                                            					<c:set var="isDM" value="tab"></c:set>
                                            				</c:when>
                                            				<c:otherwise>
                                            					<c:set var="isDM" value="tab active"></c:set>
                                            				</c:otherwise>
                                            			</c:choose>
                                            		</c:otherwise>
                                            	</c:choose>
                                                <div id="tab1d" class="${isDM}">
                                                	<form:form action="${addAction}" commandName="tournamentDetailsDoublesM" name="tournamentDetailsDoublesM" id="tournamentDetailsDoublesM" modelAttribute="tournamentDetailsDoublesM">
												
												<input type="hidden" value="${shortName}" name="shortName"></input>
												<form:hidden path="id" disabled="disable"  />
                                                <div class="captura-right-content">
                                                	<div class="captura-center-content">
															<div class="form-group">
																<label class="col-sm-4 control-label">* <spring:message code="tournamentDetails.format" /></label>
				                                                <div class="btn-group" >
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="RR" id="RRRBDM" onchange="javascript:radioChangedDM();"/>Round Robbin </label>
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="MD" id="MDRBDM" onchange="javascript:radioChangedDM();"/>Main Draw </label>
				                                                </div>
				                                            </div>
				                                     </div>
													 <div class="captura-right-content">
				                                                <spring:bind path="points">
																  <div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.points" /></label>
																	<div class="col-sm-5">
																		<form:textarea path="points" class="form-control"
														                                id="pointsDM" placeholder="" />
																		<form:errors path="points" class="control-label"/>
																	</div>
																  </div>
																</spring:bind>
				                                     </div>
				                                     <div class="captura-right-content">
				                                     	<div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.match" /></label>
																		<div class="col-sm-4">
																			<form:select path="matchDuration" name="matchDurationDM" id="matchDurationDM" class="form-control" >
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
																	<c:when test="${tournamentDetailsDoublesM.format eq 'MD' }">
																		<form:input path="drawSize" class="form-control" id="drawSizeDM"  disabled="false" />
																	</c:when>
																	<c:otherwise>
																		<form:input path="drawSize" class="form-control" id="drawSizeDM"  disabled="true" />
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
																	<c:when test="${tournamentDetailsDoublesM.format eq 'MD' }">
																		<form:input path="groupsSize" class="form-control" id="groupsSizeDM"  disabled="true"/>
																	</c:when>
																	<c:otherwise>
																		<form:input path="groupsSize" class="form-control" id="groupsSizeDM"  disabled="false"/>
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
																			<c:when test="${tournamentDetailsDoublesM.format eq 'MD' }">
																				<form:select path="advanceSecond" name="advanceSecondDM" id="advanceSecondDM" class="form-control" disabled="true" >
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
																				<form:select path="advanceSecond" name="advanceSecondDM" id="advanceSecondDM" class="form-control" disabled="false"  >
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
																			<c:when test="${tournamentDetailsDoublesM.format eq 'MD' }">
																				<form:select path="advanceThird" name="advanceThirdDM" id="advanceThirdDM" class="form-control" disabled="true"  >
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
																				<form:select path="advanceThird" name="advanceThirdDM" id="advanceThirdDM" class="form-control" disabled="false" >
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
																			<form:select path="categories" name="categories" id="categoriesDM" multiple="true" class="form-control" >
																				<c:forEach var="tp" items="${mensCategoriesD}">
																					<c:choose>
																						<c:when test="${fn:contains(selectedCategoriesDM, tp.name)}">
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
																		value="<spring:message code="greenBall.guardar"/>" name="DM" />
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
														<c:forEach items="${tournamentDetailsDM}" var="configura">
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
                                                <c:choose>
                                            		<c:when test="${currentMode eq 'DW' }">
                                            			<c:set var="isDW" value="tab active"></c:set>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<c:set var="isDW" value="tab"></c:set>
                                            		</c:otherwise>
                                            	</c:choose>
                                                <div id="tab2d" class="${isDW }">  
                                                	<form:form action="${addAction}" commandName="tournamentDetailsDoublesW" name="tournamentDetailsDoublesW" id="tournamentDetailsDoublesW" modelAttribute="tournamentDetailsDoublesW">
												
												<input type="hidden" value="${shortName}" name="shortName"></input>
												<form:hidden path="id" disabled="disable"  />
                                                <div class="captura-right-content">
                                                	<div class="captura-center-content">
															<div class="form-group">
																<label class="col-sm-4 control-label">* <spring:message code="tournamentDetails.format" /></label>
				                                                <div class="btn-group" >
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="RR" id="RRRBDW" onchange="javascript:radioChangedDM();"/>Round Robbin </label>
				                                                	<label class="btn btn-primary">
				                                                	<form:radiobutton path="format" value="MD" id="MDRBDW" onchange="javascript:radioChangedDM();"/>Main Draw </label>
				                                                </div>
				                                            </div>
				                                     </div>
													 <div class="captura-right-content">
				                                                <spring:bind path="points">
																  <div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.points" /></label>
																	<div class="col-sm-5">
																		<form:textarea path="points" class="form-control"
														                                id="pointsDW" placeholder="" />
																		<form:errors path="points" class="control-label"/>
																	</div>
																  </div>
																</spring:bind>
				                                     </div>
				                                     <div class="captura-right-content">
				                                     	<div class="form-group ${hasError}">
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.match" /></label>
																		<div class="col-sm-4">
																			<form:select path="matchDuration" name="matchDurationDW" id="matchDurationDM" class="form-control" >
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
																	<c:when test="${tournamentDetailsDoublesW.format eq 'WD' }">
																		<form:input path="drawSize" class="form-control" id="drawSizeDW"  disabled="false" />
																	</c:when>
																	<c:otherwise>
																		<form:input path="drawSize" class="form-control" id="drawSizeDW"  disabled="true" />
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
																	<c:when test="${tournamentDetailsDoublesW.format eq 'WD' }">
																		<form:input path="groupsSize" class="form-control" id="groupsSizeDW"  disabled="true"/>
																	</c:when>
																	<c:otherwise>
																		<form:input path="groupsSize" class="form-control" id="groupsSizeDW"  disabled="false"/>
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
																			<c:when test="${tournamentDetailsDoublesW.format eq 'WD' }">
																				<form:select path="advanceSecond" name="advanceSecondDW" id="advanceSecondDW" class="form-control" disabled="true" >
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
																				<form:select path="advanceSecond" name="advanceSecondDW" id="advanceSecondDW" class="form-control" disabled="false"  >
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
																			<c:when test="${tournamentDetailsDoublesW.format eq 'WD' }">
																				<form:select path="advanceThird" name="advanceThirdDW" id="advanceThirdDW" class="form-control" disabled="true"  >
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
																				<form:select path="advanceThird" name="advanceThirdDW" id="advanceThirdDW" class="form-control" disabled="false" >
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
																	<label class="col-sm-2 control-label">* <spring:message code="tournamentDetails.categories" /></label>
																		<div class="col-sm-4">
																			<form:select path="categories" name="categories" id="categoriesW" multiple="true" class="form-control" >
																				<c:forEach var="tp" items="${womansCategoriesD}">
																					<c:choose>
																						<c:when test="${fn:contains(selectedCategoriesDW, tp.name)}">
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
																		value="<spring:message code="greenBall.guardar"/>" name="DW" />
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
														<c:forEach items="${tournamentDetailsDW}" var="configura">
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
                                                
                                                 <jsp:include page="tournamentDetailsTab3d.jsp"></jsp:include>
                                                 <jsp:include page="tournamentDetailsTab4d.jsp"></jsp:include>
                                            </div>
                                   		   </div>
                                     </div>