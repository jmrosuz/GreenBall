<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%String pathGreenBall = request.getContextPath(); %>
<c:url var="addAction" value="/addDraws" ></c:url>
<c:choose>
    <c:when test="${currentSuperMode eq 'M' }">
       <c:set var="isM" value="tab active"></c:set>
    </c:when>
    <c:otherwise>
       <c:set var="isM" value="tab"></c:set>
    </c:otherwise>
</c:choose>
<div id="tab2" class="${isM}">
                                          <h3 class="tab-match-title"><spring:message code="category.mixes" /></h3>
                                           <div class="tabs standard">
                                            <ul class="tab-links-match">
                                                 <c:choose>
                                            		<c:when test="${currentMode eq 'MA' }">
                                            			<li class="active"><a onclick="javascript:tabSelected('MA');" class="first-tabs" href="#tab1m"><spring:message code="category.adults" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            		<c:choose>
                                            			<c:when test="${fn:startsWith(currentMode, 'M')}">
                                            				<li><a href="#tab1m"><spring:message code="category.mens" /></a></li>	
                                            			</c:when>
                                            			<c:otherwise>
                                            				<li class="active"><a onclick="javascript:tabSelected('MA');" class="first-tabs" href="#tab1m"><spring:message code="category.adults" /></a></li>
                                            			</c:otherwise>
                                            		</c:choose>
                                            			
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'MK' }">
                                            			<li class="active"><a onclick="javascript:tabSelected('MK');" class="first-tabs" href="#tab2m"><spring:message code="category.nv" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a onclick="javascript:tabSelected('MK');" href="#tab2m"><spring:message code="category.nv" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	
                                                
                                            </ul>
                                            <div class="tab-content">
                                           	   
                                            	
                                                <jsp:include page="drawsTab1m.jsp"></jsp:include>
                                                <jsp:include page="drawsTab2m.jsp"></jsp:include>
                                                
                                                
                                                
                                                
                                                 
                                            </div>
                                   		   </div>
                                     </div>