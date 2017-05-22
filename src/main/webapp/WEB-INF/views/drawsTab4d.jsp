<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%String pathGreenBall = request.getContextPath(); %>
<c:url var="addAction" value="/addDraws" ></c:url>
<c:choose>
                                            		<c:when test="${currentMode eq 'DWN' }">
                                            			<c:set var="isDWN" value="tab active"></c:set>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<c:set var="isDWN" value="tab"></c:set>
                                            		</c:otherwise>
                                            	</c:choose>
												
                                                <div id="tab2d" class="${isDWN }">
                                                	<form:form action="${addAction}" commandName="draws" name="draws" id="draws">
                                            		
                                            		<input type="hidden" id="juegoNumDWN" value="0">
                                            		<input type="hidden" name="actualMode" id ="actualMode" value="${currentMode }">
                                            		
                                            			<div class="captura-right-content">
                                            				<div class="form-group">
                                            					<label class="col-sm-2 control-label">Categoria</label>
                                            					<div class="col-sm-4">
																	<select name="nvwomansDoublesCat" id="nvwomansDoublesCat" class="form-control" id="nvwomansDoublesCat" onchange="javascript:categorySelectedMethod('DWN');" >
																		<option value="0">Selecciona una Categoria</option>
																		<c:forEach items="${nvwomansCategoriesD}" var="cat">
																					<c:choose>
																						<c:when test="${wscSelected == cat.id}">
																							<option selected="selected" value="${cat.id}">${cat.name}</option>		
																						</c:when>
																						<c:otherwise>
																							<option  value="${cat.id}">${cat.name}</option>
																						</c:otherwise>
																					</c:choose>
																					
																				
																		</c:forEach>
																	</select>
																</div>
                                            				</div>
                                            			
                                            			</div>
                                            			
                                            			<c:if test="${(numOfGraphMDDWN ne null and numOfGraphMDDWN != 0)  or (numOfGraphRRDWN ne null and numOfGraphRRDWN ne 0)}">
                                            				<input class="pl-point-button" type="button" name="AutoGenerar" data-toggle="modal" data-target="#myModalAutoGenDWN" 
																value="<spring:message code="draws.autogen"/>" /> 
															<input class="pl-point-button" type="button" name="AutoGenerar" onclick="javascrip:toSubmit('DWN');"
																value="<spring:message code="draws.save"/>" /> 
                                            			</c:if>
                                            			
                                            			<div class="captura-right-content">
                                            				<div class="form-group">
                                            					<label class="col-sm-2 control-label"><spring:message code="draws.disponibles" /></label>
                                            					<div class="span4" id="header2">
																	  <ol style="width: 220px;" class="simple_with_animation vertical" name="summaryOL2" id="summaryOL2">
																	  		<c:forEach items="${nvwdAvailable}" var="player">
																	  			<li class='highlight' id="${player.idPlayer }">${player.name} ${player.middleName} ${player.lastName}</li>
																	  		
																	  		</c:forEach>
																	  </ol>
																</div>
                                            				</div>
                                            				
                                            				<!-- Modal -->
															  <div class="modal fade" id="myModalDWN" role="dialog"   >
															    <div class="modal-dialog" role="doument">
															    
															      <!-- Modal content-->
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h4 class="modal-title"><spring:message code="draws.match.data" /></h4>
															        </div>
															        <div class="modal-body">
															          <p><spring:message code="draws.match.field" /></p>
															          <input type="text" id="field8">
															          
															           <div class="input-daterange input-group" id="datepicker8">
															           <label class="col-sm-5 control-label"><spring:message code="draws.match.date" /></label>
														    				<input type="text" class="input-sm form-control" name="start"  id="date8" required="required"/>
																		</div>
															           <div class="input-group bootstrap-timepicker timepicker">
															           		<label class="col-sm-3 control-label"><spring:message code="draws.match.hour" /></label>
																            <input id="timepicker8" type="text" class="form-control input-small">
																            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
																        </div>
																        
															          
															        </div>
															        <div class="modal-footer">
															          <button type="button" class="pl-point-button" data-dismiss="modal" data-backdrop="false" onclick="javascript:matchTimeSelected('DWN');"><spring:message code="draws.match.save" /></button>
															          <button type="button" class="pl-point-button" data-dismiss="modal"><spring:message code="draws.match.close" /></button>
															        </div>
															      </div>
															      
															    </div>
															  </div>
															  
															  <div class="modal fade" id="myModalAutoGenDWN" role="dialog"  >
															    <div class="modal-dialog">
															    
															      <!-- Modal content-->
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h4 class="modal-title"><spring:message code="draws.confirm" /></h4>
															        </div>
															        <div class="modal-body">
															          <p><spring:message code="draws.confirm.msg" /></p>
															          
															          
															        </div>
															        <div class="modal-footer">
															          <button type="button" class="pl-point-button" data-dismiss="modal" data-backdrop="false" onclick="javascript:autoSelected('DWN');"><spring:message code="draws.confirm.continue" /></button>
															          <button type="button" class="pl-point-button" data-dismiss="modal"><spring:message code="draws.match.close" /></button>
															        </div>
															      </div>
															      
															    </div>
															  </div>
															  
															  <!-- Modal -->
															  <div class="modal fade in" id="myModalMissingDataDWN" role="dialog"  >
															    <div class="modal-dialog">
															    
															      <!-- Modal content-->
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h4 class="modal-title"><spring:message code="draws.confirm.missing" /></h4>
															        </div>
															        <div class="modal-body">
															          <p><spring:message code="draws.confirm.msg2" /></p>
															          
															        </div>
															        <div class="modal-footer">
															          <button type="button" class="pl-point-button" data-dismiss="modal"><spring:message code="draws.match.close" /></button>
															        </div>
															      </div>
															      
															    </div>
															  </div>
															  
															   
                                            			
		                                            		<div class="form-group col-sm-6">
		                                            		<c:set var="c" value="0"></c:set>
		                                            		<c:set var="d" value="1"></c:set>
		                                            		<c:if test="${numOfGraphMDDWN != 0 }">
		                                            		<c:forEach  begin="1" end="${numOfGraphMDDWN}" varStatus="loop" var="f">
															    <div class="drawTableD" id="drawTableD">
																	<table id="match1D" width="285" cellpadding="0" cellspacing="0" border="0" >
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN">
																					<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${nvwdAvailableFinal[c].idPlayer}">${nvwdAvailableFinal[c].name} ${nvwdAvailableFinal[c].middleName} ${nvwdAvailableFinal[c].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN">
																					<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${nvwdAvailableFinal[c+1].idPlayer}">${nvwdAvailableFinal[c+1].name} ${nvwdAvailableFinal[c+1].middleName} ${nvwdAvailableFinal[c+1].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<!--  tr valign="top" height="1px"><td><td></tr>-->
																		<tr  height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN">
																					<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${nvwdAvailableFinal[c+2].idPlayer}">${nvwdAvailableFinal[c+2].name} ${nvwdAvailableFinal[c+2].middleName} ${nvwdAvailableFinal[c+2].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN">
																					<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${nvwdAvailableFinal[c+3].idPlayer}">${nvwdAvailableFinal[c+3].name} ${nvwdAvailableFinal[c+3].middleName} ${nvwdAvailableFinal[c+3].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN">
																					<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${nvwdAvailableFinal[c+4].idPlayer}">${nvwdAvailableFinal[c+4].name} ${nvwdAvailableFinal[c+4].middleName} ${nvwdAvailableFinal[c+4].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN">
																					<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${nvwdAvailableFinal[c+5].idPlayer}">${nvwdAvailableFinal[c+5].name} ${nvwdAvailableFinal[c+5].middleName} ${nvwdAvailableFinal[c+5].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN">
																					<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${nvwdAvailableFinal[c+6].idPlayer}">${nvwdAvailableFinal[c+6].name} ${nvwdAvailableFinal[c+6].middleName} ${nvwdAvailableFinal[c+6].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN">
																					<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${nvwdAvailableFinal[c+7].idPlayer}">${nvwdAvailableFinal[c+7].name} ${nvwdAvailableFinal[c+7].middleName} ${nvwdAvailableFinal[c+7].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<a href="#myModalDWN"  onclick="javascript:ff(${d},'DWN');" class="tiempo" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																		
																		<c:set var="p">${d+1}</c:set>
																		<c:choose>
																			<c:when test="${not empty fieldsMaps}">
																				<label id="timeMatch8${d}" class="timeMatch">${timesMaps[d]}</label>
																				<label id="dayMatch8${d}" class="dayMatch">${datesMaps[d]}</label>
																				<label id="fieldMatch8${d}" class="fieldMatch">${fieldsMaps[d]}</label>
																				<a href="#myModalDWN" onclick="javascript:ff(${d+1}, 'DWN');" class="tiempo2D" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																				<label id="timeMatch8${d+1}" class="timeMatch2">${timesMaps[p]}</label>
																				<label id="dayMatch8${d+1}" class="dayMatch2">${datesMaps[p]}</label>
																				<label id="fieldMatch8${d+1}" class="fieldMatch2">${fieldsMaps[p]}</label>
																				<input type="hidden" id="datestempo" value="${datesMaps[d]}"></input>
																				<input type="hidden" id="datestempo2" value="${datesMaps[p]}"></input>
																				<input type="hidden" id="timestempo" value="${timesMaps[d]}"></input>
																				<input type="hidden" id="timestempo2" value="${timesMaps[p]}"></input>
																				<input type="hidden" id="fieldstempo" value="${fieldsMaps[d]}"></input>
																				<input type="hidden" id="fieldstempo2" value="${fieldsMaps[p]}"></input>
																				
																				<script>
																				
																				
																				
																				//var mapDates = new Object();
																				mapDates['${d}'] = $('#datestempo').val();
																				mapDates['${p}'] = $('#datestempo2').val();
																				mapTimes['${d}'] = $('#timestempo').val();
																				mapTimes['${p}'] = $('#timestempo2').val();
																				mapFields['${d}'] = $('#fieldstempo').val();
																				mapFields['${p}'] = $('#fieldstempo2').val();
																				</script>
																			</c:when>
																			<c:otherwise>
																				<label id="timeMatch8${d}" class="timeMatch"></label>
																				<label id="dayMatch8${d}" class="dayMatch"></label>
																				<label id="fieldMatch8${d}" class="fieldMatch"></label>
																				<a href="#myModalDWN" onclick="javascript:ff(${d+1}, 'DWN');" class="tiempo2D" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																				<label id="timeMatch8${d+1}" class="timeMatch2"></label>
																				<label id="dayMatch8${d+1}" class="dayMatch2"></label>
																				<label id="fieldMatch8${d+1}" class="fieldMatch2"></label>	
																			</c:otherwise>
																		</c:choose>
																		
																	</table>
																	
																	<a href="/en_AU/players/overview/atpf324.html" id="winnerf"></a>
																</div>
																<c:set var="c" value="${f*8}"></c:set>
																<c:set var="d" value="${(f*2)+1 }"></c:set>
															 </c:forEach>
															 <c:set var="c" value="0"></c:set>
															 <c:set var="d" value="1"></c:set>
															 </c:if>
															 
															 <c:if test="${numOfGraphRRDWN  !=  0}">
															 <c:set var="a" value="1"></c:set>
															 <c:set var="currentMatch" value="1"></c:set>
															 <c:forEach  begin="1" end="${numOfGraphRRDWN}" varStatus="loop" var="i">
															 	<div class="form-group">
	                                            					<label class="col-sm-2 control-label"><spring:message code="draws.group" /> ${i}</label>
																 	<table class="groups">
																 		<c:forEach  begin="1" end="${playersPerGroup}" varStatus="loop2" >
																 			<tr height="32">
																 				<td height="5px">
																					<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN">
																						<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																							<li class='highlight' id="${nvwdAvailableFinal[a-1].idPlayer}">${nvwdAvailableFinal[a-1].name} ${nvwdAvailableFinal[a-1].middleName} ${nvwdAvailableFinal[a-1].lastName}</li>
																						</c:if>
																					</ol>
																				</td>
																				<td height="5px">
																					<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDWN2">
																						<c:if test="${fn:length(nvwdAvailableFinal) gt 0 }">
																							<li class='highlight' id="${nvwdAvailableFinal[a].idPlayer}">${nvwdAvailableFinal[a].name} ${nvwdAvailableFinal[a].middleName} ${nvwdAvailableFinal[a].lastName}</li>
																						</c:if>
																					</ol>
																				</td>
																 			</tr>
																 			<c:set var="a" value="${a+2}"></c:set>
																 		</c:forEach>
																 	</table>
															 	</div>
															 	<div class="form-group">
	                                            					
																 	<table class="groups2" border="1">
																 		
																 		<tr>
																 			<td>&nbsp;</td>
																	 		<c:forEach  begin="1" end="${gamesXgroup}" varStatus="loop0" var = "tempJM0">
																	 				<td align="center">${tempJM0}</td>
																	 		</c:forEach>
																 		</tr>
																 		<c:forEach  begin="1" end="${gamesXgroup}" varStatus="loopa" var = "tempJM">
																 			<c:set var="t" value="1"></c:set>
																 			
																 			<tr height="32">
																 			<td>${tempJM}</td>
																 			<c:forEach  begin="1" end="${gamesXgroup}" varStatus="loop2" var="tempJM2" >
																 				<c:choose>
																	 				<c:when test="${tempJM gt tempJM2 }">
																	 					<td height="5px">
																	 						<a href="#myModalDWN"  onclick="javascript:ff(${currentMatch},'DWN');" class="tiempoRR" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																	 						<c:choose>
																								<c:when test="${not empty fieldsMaps}">
																									<label id="timeMatch8${currentMatch}" >${timesMaps[currentMatch]}</label>
																									<label id="dayMatch8${currentMatch}" >${datesMaps[currentMatch]}</label>
																									<label id="fieldMatch8${currentMatch}" >${fieldsMaps[currentMatch]}</label>
																									<input type="hidden" id="datestempo${currentMatch}" value="${datesMaps[currentMatch]}"></input>
																									<input type="hidden" id="timestempo${currentMatch}" value="${timesMaps[currentMatch]}"></input>
																									<input type="hidden" id="fieldstempo${currentMatch}" value="${fieldsMaps[currentMatch]}"></input>
																									
																									<script>
																				
																										mapDates['${currentMatch}'] = $('#datestempo${currentMatch}').val();
																										mapTimes['${currentMatch}'] = $('#timestempo${currentMatch}').val();
																										mapFields['${currentMatch}'] = $('#fieldstempo${currentMatch}').val();
																									</script>
																									
																									<c:set var="currentMatch" >${currentMatch+1}</c:set>
																								</c:when>
																								<c:otherwise>
																									<label id="timeMatch8${currentMatch}" >${timesMaps[currentMatch]}</label>
																									<label id="dayMatch8${currentMatch}" >${datesMaps[currentMatch]}</label>
																									<label id="fieldMatch8${currentMatch}" >${fieldsMaps[currentMatch]}</label>
																									<c:set var="currentMatch" >${currentMatch+1 }</c:set>
																								</c:otherwise>
																							</c:choose>
																	 						
																	 					</td>
																					</c:when>
																					<c:otherwise>
																						<td class="tdNoMatch" height="5px"><c:out value=""></c:out></td>
																					</c:otherwise>
																				</c:choose>
																				
																			</c:forEach>
																 			</tr>
																 			<c:set var="t" value="${a+1}"></c:set>
																 		</c:forEach>
																 	</table>
															 	</div>
															 	
															 </c:forEach>
															 </c:if>
															 
		                                                	</div>
		                                                 </div>
														
														</form:form>
                                                </div>