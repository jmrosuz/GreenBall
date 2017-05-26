<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%String pathGreenBall = request.getContextPath(); %>
<c:url var="addAction" value="/${shortName}/addDraws" ></c:url>
<c:choose>
                                            		<c:when test="${currentMode eq 'DM' }">
                                            			<c:set var="isDM" value="tab active"></c:set>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<c:set var="isDM" value="tab"></c:set>
                                            		</c:otherwise>
                                            	</c:choose>
												
                                                <div id="tab1d" class="${isDM }">
                                                	<form:form action="${addAction}" commandName="draws" name="draws" id="draws">
                                            		
                                            		<input type="hidden" id="juegoNumDM" value="0">
                                            		<input type="hidden" name="actualMode" id ="actualMode" value="${currentMode }">
                                            		
                                            			<div class="captura-right-content">
                                            				<div class="form-group">
                                            					<label class="col-sm-2 control-label"><spring:message code="draws.category"/></label>
                                            					<div class="col-sm-4">
																	<select name="mensDoublesCat" id="mensDoublesCat" class="form-control" id="mensDoublesCat" onchange="javascript:categorySelectedMethod('DM');" >
																		<option value="0"><spring:message code="draws.selectCategory"/></option>
																		<c:forEach items="${mensCategoriesD}" var="cat">
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
                                            			
                                            			<c:if test="${(numOfGraphMDDM ne null and numOfGraphMDDM != 0)  or (numOfGraphRRDM ne null and numOfGraphRRDM ne 0)}">
                                            				<input class="pl-point-button" type="button" name="AutoGenerar" data-toggle="modal" data-target="#myModalAutoGenDM" 
																value="<spring:message code="draws.autogen"/>" /> 
															<input class="pl-point-button" type="button" name="AutoGenerar" onclick="javascrip:toSubmit('DM');"
																value="<spring:message code="draws.save"/>" /> 
                                            			</c:if>
                                            			
                                            			<div class="captura-right-content">
                                            				<div class="form-group">
                                            					<label class="col-sm-2 control-label"><spring:message code="draws.disponibles" /></label>
                                            					<div class="span4" id="header2">
																	  <ol style="width: 220px;" class="simple_with_animation vertical" name="summaryOL2" id="summaryOL2">
																	  		<c:forEach items="${mdAvailable}" var="player">
																	  			<li class='highlight' id="${player.idPlayer }">${player.name} ${player.middleName} ${player.lastName}</li>
																	  		
																	  		</c:forEach>
																	  </ol>
																</div>
                                            				</div>
                                            				
                                            				<!-- Modal -->
															  <div class="modal fade" id="myModalDM" role="dialog"   >
															    <div class="modal-dialog" role="doument">
															    
															      <!-- Modal content-->
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h4 class="modal-title"><spring:message code="draws.match.data" /></h4>
															        </div>
															        <div class="modal-body">
															          <p><spring:message code="draws.match.field" /></p>
															          <input type="text" id="field5">
															          
															           <div class="input-daterange input-group" id="datepicker5">
															           <label class="col-sm-5 control-label"><spring:message code="draws.match.date" /></label>
														    				<input type="text" class="input-sm form-control" name="start"  id="date5" required="required"/>
																		</div>
															           <div class="input-group bootstrap-timepicker timepicker">
															           		<label class="col-sm-3 control-label"><spring:message code="draws.match.hour" /></label>
																            <input id="timepicker5" type="text" class="form-control input-small">
																            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
																        </div>
																        
															          
															        </div>
															        <div class="modal-footer">
															          <button type="button" class="pl-point-button" data-dismiss="modal" data-backdrop="false" onclick="javascript:matchTimeSelected('DM');"><spring:message code="draws.match.save" /></button>
															          <button type="button" class="pl-point-button" data-dismiss="modal"><spring:message code="draws.match.close" /></button>
															        </div>
															      </div>
															      
															    </div>
															  </div>
															  
															  <div class="modal fade" id="myModalAutoGenDM" role="dialog"  >
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
															          <button type="button" class="pl-point-button" data-dismiss="modal" data-backdrop="false" onclick="javascript:autoSelected('DM');"><spring:message code="draws.confirm.continue" /></button>
															          <button type="button" class="pl-point-button" data-dismiss="modal"><spring:message code="draws.match.close" /></button>
															        </div>
															      </div>
															      
															    </div>
															  </div>
															  
															  <!-- Modal -->
															  <div class="modal fade in" id="myModalMissingDataDM" role="dialog"  >
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
		                                            		<c:if test="${numOfGraphMDDM != 0 }">
		                                            		<c:forEach  begin="1" end="${numOfGraphMDDM}" varStatus="loop" var="f">
															    <div class="drawTableD" id="drawTableD">
																	<table id="match1D" width="285" cellpadding="0" cellspacing="0" border="0" >
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM">
																					<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mdAvailableFinal[c].idPlayer}">${mdAvailableFinal[c].name} ${mdAvailableFinal[c].middleName} ${mdAvailableFinal[c].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM">
																					<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mdAvailableFinal[c+1].idPlayer}">${mdAvailableFinal[c+1].name} ${mdAvailableFinal[c+1].middleName} ${mdAvailableFinal[c+1].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<!--  tr valign="top" height="1px"><td><td></tr>-->
																		<tr  height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM">
																					<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mdAvailableFinal[c+2].idPlayer}">${mdAvailableFinal[c+2].name} ${mdAvailableFinal[c+2].middleName} ${mdAvailableFinal[c+2].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM">
																					<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mdAvailableFinal[c+3].idPlayer}">${mdAvailableFinal[c+3].name} ${mdAvailableFinal[c+3].middleName} ${mdAvailableFinal[c+3].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM">
																					<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mdAvailableFinal[c+4].idPlayer}">${mdAvailableFinal[c+4].name} ${mdAvailableFinal[c+4].middleName} ${mdAvailableFinal[c+4].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM">
																					<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mdAvailableFinal[c+5].idPlayer}">${mdAvailableFinal[c+5].name} ${mdAvailableFinal[c+5].middleName} ${mdAvailableFinal[c+5].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM">
																					<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mdAvailableFinal[c+6].idPlayer}">${mdAvailableFinal[c+6].name} ${mdAvailableFinal[c+6].middleName} ${mdAvailableFinal[c+6].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="1px">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM">
																					<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mdAvailableFinal[c+7].idPlayer}">${mdAvailableFinal[c+7].name} ${mdAvailableFinal[c+7].middleName} ${mdAvailableFinal[c+7].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<a href="#myModalDM"  onclick="javascript:ff(${d},'DM');" class="tiempo" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																		
																		<c:set var="p">${d+1}</c:set>
																		<c:choose>
																			<c:when test="${not empty fieldsMaps}">
																				<label id="timeMatch5${d}" class="timeMatch">${timesMaps[d]}</label>
																				<label id="dayMatch5${d}" class="dayMatch">${datesMaps[d]}</label>
																				<label id="fieldMatch5${d}" class="fieldMatch">${fieldsMaps[d]}</label>
																				<a href="#myModalDM" onclick="javascript:ff(${d+1}, 'DM');" class="tiempo2D" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																				<label id="timeMatch5${d+1}" class="timeMatch2">${timesMaps[p]}</label>
																				<label id="dayMatch5${d+1}" class="dayMatch2">${datesMaps[p]}</label>
																				<label id="fieldMatch5${d+1}" class="fieldMatch2">${fieldsMaps[p]}</label>
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
																				<label id="timeMatch5${d}" class="timeMatch"></label>
																				<label id="dayMatch5${d}" class="dayMatch"></label>
																				<label id="fieldMatch5${d}" class="fieldMatch"></label>
																				<a href="#myModalDM" onclick="javascript:ff(${d+1}, 'DM');" class="tiempo2D" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																				<label id="timeMatch5${d+1}" class="timeMatch2"></label>
																				<label id="dayMatch5${d+1}" class="dayMatch2"></label>
																				<label id="fieldMatch5${d+1}" class="fieldMatch2"></label>	
																			</c:otherwise>
																		</c:choose>
																		
																	</table>
																	
																	<a href="/en_AU/players/overview/atpf324.html" id="winnerf">R. Federer</a>
																</div>
																<c:set var="c" value="${f*8}"></c:set>
																<c:set var="d" value="${(f*2)+1 }"></c:set>
															 </c:forEach>
															 <c:set var="c" value="0"></c:set>
															 <c:set var="d" value="1"></c:set>
															 </c:if>
															 
															 <c:if test="${numOfGraphRRDM  !=  0}">
															 <c:set var="a" value="1"></c:set>
															 <c:set var="currentMatch" value="1"></c:set>
															 <c:forEach  begin="1" end="${numOfGraphRRDM}" varStatus="loop" var="i">
															 	<div class="form-group">
	                                            					<label class="col-sm-2 control-label"><spring:message code="draws.group" /> ${i}</label>
																 	<table class="groups">
																 		<c:forEach  begin="1" end="${playersPerGroup}" varStatus="loop2" >
																 			<tr height="32">
																 				<td height="5px">
																					<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM">
																						<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																							<li class='highlight' id="${mdAvailableFinal[a-1].idPlayer}">${mdAvailableFinal[a-1].name} ${mdAvailableFinal[a-1].middleName} ${mdAvailableFinal[a-1].lastName}</li>
																						</c:if>
																					</ol>
																				</td>
																				<td height="5px">
																					<ol style="width: 220px;" class="simple_with_animation vertical" id="playerDM2">
																						<c:if test="${fn:length(mdAvailableFinal) gt 0 }">
																							<li class='highlight' id="${mdAvailableFinal[a].idPlayer}">${mdAvailableFinal[a].name} ${mdAvailableFinal[a].middleName} ${mdAvailableFinal[a].lastName}</li>
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
																	 						<a href="#myModalDM"  onclick="javascript:ff(${currentMatch},'DM');" class="tiempoRR" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																	 						<c:choose>
																								<c:when test="${not empty fieldsMaps}">
																									<label id="timeMatch5${currentMatch}" >${timesMaps[currentMatch]}</label>
																									<label id="dayMatch5${currentMatch}" >${datesMaps[currentMatch]}</label>
																									<label id="fieldMatch5${currentMatch}" >${fieldsMaps[currentMatch]}</label>
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
																									<label id="timeMatch5${currentMatch}" >${timesMaps[currentMatch]}</label>
																									<label id="dayMatch5${currentMatch}" >${datesMaps[currentMatch]}</label>
																									<label id="fieldMatch5${currentMatch}" >${fieldsMaps[currentMatch]}</label>
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