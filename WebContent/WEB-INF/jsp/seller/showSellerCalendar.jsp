<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisSellerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='sellerMenuTile' content='sellerMenuTile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
	
	<div id="waitDiv" style="position:absolute;top:240;visibility:hidden;">
		<table width="720">
			<tr width="100%">
				<td width="100%" align="center" valign="middle">
					<table width="220" height="200" cellpadding="5" class="waitDivTable">
						<tr width="100%">
							<td width="100%" align="center" class="data2Text">
								<bean:message key="showSellerCalendar.divText1"/>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr width="100%">
							<td width="100%" align="center" class="data2Text">
								<bean:message key="showSellerCalendar.divText2"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr width="100%">
							<td width="100%" align="center" class="data3Text">
								<bean:message key="showSellerCalendar.divText3"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div id="mainDiv">
	  <table width="720" cellpadding="0" cellspacing="0" border="0" >
		<tr>
			<td width="8" height="8" background="pictures/borderTopLeft.gif">
			</td>
			<td height="8" background="pictures/borderTop.gif" >	
			</td>
			<td width="8" height="8" background="pictures/borderTopRight.gif">
			</td>
		</tr>
		
		<tr valign="top">
			<td width="8" background="pictures/borderLeft.gif">
			</td>
			<td height="450" class="errorText" align="center">	
				<table width="90%" cellpadding="0" cellspacing="0" boder="0">
					<html:form action="setSellerCalendar.do">
						<tr><td height="5"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerCalendar.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerCalendar.text2"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
	  						<td align="left">
	  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
							  		<tr align="center">
								  		<td class="data2Text">
				  							<a href="showSellerCalendar.do">
						  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="calendarActive" border="0"/>
						  					</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerService.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="serviceInactive" border="0"/>
					  						</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerParameter.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="parameterInactive" border="0"/>
					  						</a>
				  						</td>
				  						<logic:equal name="sellerSession" property="isEscort" value="0">
					  						<td width="10"></td>
					  						<td class="data2Text">
						  						<a href="showSellerPromotion.do">
						  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="promotionInactive" border="0"/>
						  						</a>
					  						</td>
					  					</logic:equal>
							  		</tr>
							  	</table>
	  						</td>
				  		</tr>			  
						<tr><td height="10"></td></tr>
						<tr>
							<td class="errorText" align="center">
								<html:errors/>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<logic:equal name="sellerSession" property="isCalendarGenerated" value="1">
										<tr><td height="10"></td></tr>
										<tr><td height="1" background="pictures/pixel.gif"></td></tr>
										<tr><td height="10"></td></tr>
										<tr height="30">
											<td class="data1Text" align="center">
												<bean:message key="showSellerCalendar.text3"/>
											</td>
										</tr>
										<tr height="30">
											<td class="data1Text">
												<input type="button" class="form" onclick="document.location.href='showSellerEditCalendar.do';" value="<bean:message key="showSellerCalendar.editCalendar"/>"/>
											</td>
										</tr>
										<tr><td height="10"></td></tr>
										<tr><td height="1" background="pictures/pixel.gif"></td></tr>
										<tr><td height="10"></td></tr>
										<tr height="30">
											<td class="data1Text" align="center">
												<bean:message key="showSellerCalendar.text4"/>
											</td>
										</tr>
									</logic:equal>
									<tr height="30">
										<td class="data1Text">
											<html:radio styleClass="form" property="pattern" value="1" />
											<bean:message key="showSellerCalendar.pattern1"/>
										</td>
									</tr>
									<tr height="30">
										<td class="data1Text">
											<html:radio styleClass="form" property="pattern" value="2" />
											<bean:message key="showSellerCalendar.pattern2"/>&nbsp;
											<html:select styleClass="form" property="startHour2">
												<html:option value="0">00</html:option>
												<html:option value="1">01</html:option>
												<html:option value="2">02</html:option>
												<html:option value="3">03</html:option>
												<html:option value="4">04</html:option>
												<html:option value="5">05</html:option>
												<html:option value="6">06</html:option>
												<html:option value="7">07</html:option>
												<html:option value="8">08</html:option>
												<html:option value="9">09</html:option>
												<html:option value="10">10</html:option>
												<html:option value="11">11</html:option>
												<html:option value="12">12</html:option>
												<html:option value="13">13</html:option>
												<html:option value="14">14</html:option>
												<html:option value="15">15</html:option>
												<html:option value="16">16</html:option>
												<html:option value="17">17</html:option>
												<html:option value="18">18</html:option>
												<html:option value="19">19</html:option>
												<html:option value="20">20</html:option>
												<html:option value="21">21</html:option>
												<html:option value="22">22</html:option>
												<html:option value="23">23</html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.toHour"/>&nbsp;
											<html:select styleClass="form" property="endHour2">
												<html:option value="0">00</html:option>
												<html:option value="1">01</html:option>
												<html:option value="2">02</html:option>
												<html:option value="3">03</html:option>
												<html:option value="4">04</html:option>
												<html:option value="5">05</html:option>
												<html:option value="6">06</html:option>
												<html:option value="7">07</html:option>
												<html:option value="8">08</html:option>
												<html:option value="9">09</html:option>
												<html:option value="10">10</html:option>
												<html:option value="11">11</html:option>
												<html:option value="12">12</html:option>
												<html:option value="13">13</html:option>
												<html:option value="14">14</html:option>
												<html:option value="15">15</html:option>
												<html:option value="16">16</html:option>
												<html:option value="17">17</html:option>
												<html:option value="18">18</html:option>
												<html:option value="19">19</html:option>
												<html:option value="20">20</html:option>
												<html:option value="21">21</html:option>
												<html:option value="22">22</html:option>
												<html:option value="23">23</html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.hours"/>.&nbsp;
											<bean:message key="showSellerCalendar.included"/>
										</td>
									</tr>
									<tr height="30">
										<td class="data1Text">
											<html:radio styleClass="form" property="pattern" value="3" />
											<bean:message key="showSellerCalendar.pattern3"/>
										</td>
									</tr>
									<tr height="30">
										<td class="data1Text">
											<html:radio styleClass="form" property="pattern" value="4" />
											<bean:message key="showSellerCalendar.pattern4"/>&nbsp;
											<html:select styleClass="form" property="startHour4">
												<html:option value="0">00</html:option>
												<html:option value="1">01</html:option>
												<html:option value="2">02</html:option>
												<html:option value="3">03</html:option>
												<html:option value="4">04</html:option>
												<html:option value="5">05</html:option>
												<html:option value="6">06</html:option>
												<html:option value="7">07</html:option>
												<html:option value="8">08</html:option>
												<html:option value="9">09</html:option>
												<html:option value="10">10</html:option>
												<html:option value="11">11</html:option>
												<html:option value="12">12</html:option>
												<html:option value="13">13</html:option>
												<html:option value="14">14</html:option>
												<html:option value="15">15</html:option>
												<html:option value="16">16</html:option>
												<html:option value="17">17</html:option>
												<html:option value="18">18</html:option>
												<html:option value="19">19</html:option>
												<html:option value="20">20</html:option>
												<html:option value="21">21</html:option>
												<html:option value="22">22</html:option>
												<html:option value="23">23</html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.toHour"/>&nbsp;
											<html:select styleClass="form" property="endHour4">
												<html:option value="0">00</html:option>
												<html:option value="1">01</html:option>
												<html:option value="2">02</html:option>
												<html:option value="3">03</html:option>
												<html:option value="4">04</html:option>
												<html:option value="5">05</html:option>
												<html:option value="6">06</html:option>
												<html:option value="7">07</html:option>
												<html:option value="8">08</html:option>
												<html:option value="9">09</html:option>
												<html:option value="10">10</html:option>
												<html:option value="11">11</html:option>
												<html:option value="12">12</html:option>
												<html:option value="13">13</html:option>
												<html:option value="14">14</html:option>
												<html:option value="15">15</html:option>
												<html:option value="16">16</html:option>
												<html:option value="17">17</html:option>
												<html:option value="18">18</html:option>
												<html:option value="19">19</html:option>
												<html:option value="20">20</html:option>
												<html:option value="21">21</html:option>
												<html:option value="22">22</html:option>
												<html:option value="23">23</html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.hours"/>.&nbsp;
											<bean:message key="showSellerCalendar.included"/>
										</td>
									</tr>
									<tr height="30">
										<td class="data1Text">
											<html:radio styleClass="form" property="pattern" value="5" />
											<bean:message key="showSellerCalendar.pattern5"/>
										</td>
									</tr>
									<tr height="30">
										<td class="data1Text">
											<html:radio styleClass="form" property="pattern" value="6" />
											<bean:message key="showSellerCalendar.pattern6"/>&nbsp;
											<html:select styleClass="form" property="startHour6">
												<html:option value="0">00</html:option>
												<html:option value="1">01</html:option>
												<html:option value="2">02</html:option>
												<html:option value="3">03</html:option>
												<html:option value="4">04</html:option>
												<html:option value="5">05</html:option>
												<html:option value="6">06</html:option>
												<html:option value="7">07</html:option>
												<html:option value="8">08</html:option>
												<html:option value="9">09</html:option>
												<html:option value="10">10</html:option>
												<html:option value="11">11</html:option>
												<html:option value="12">12</html:option>
												<html:option value="13">13</html:option>
												<html:option value="14">14</html:option>
												<html:option value="15">15</html:option>
												<html:option value="16">16</html:option>
												<html:option value="17">17</html:option>
												<html:option value="18">18</html:option>
												<html:option value="19">19</html:option>
												<html:option value="20">20</html:option>
												<html:option value="21">21</html:option>
												<html:option value="22">22</html:option>
												<html:option value="23">23</html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.toHour"/>&nbsp;
											<html:select styleClass="form" property="endHour6">
												<html:option value="0">00</html:option>
												<html:option value="1">01</html:option>
												<html:option value="2">02</html:option>
												<html:option value="3">03</html:option>
												<html:option value="4">04</html:option>
												<html:option value="5">05</html:option>
												<html:option value="6">06</html:option>
												<html:option value="7">07</html:option>
												<html:option value="8">08</html:option>
												<html:option value="9">09</html:option>
												<html:option value="10">10</html:option>
												<html:option value="11">11</html:option>
												<html:option value="12">12</html:option>
												<html:option value="13">13</html:option>
												<html:option value="14">14</html:option>
												<html:option value="15">15</html:option>
												<html:option value="16">16</html:option>
												<html:option value="17">17</html:option>
												<html:option value="18">18</html:option>
												<html:option value="19">19</html:option>
												<html:option value="20">20</html:option>
												<html:option value="21">21</html:option>
												<html:option value="22">22</html:option>
												<html:option value="23">23</html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.hours"/>.&nbsp;
											<bean:message key="showSellerCalendar.included"/>
										</td>
									</tr>
									<tr height="30">
										<td class="data1Text">
											<html:radio styleClass="form" property="pattern" value="7" />
											<bean:message key="showSellerCalendar.fromDay"/>
											<html:select styleClass="form" property="startDay7">
												<html:option value="2"><bean:message key="day.monday"/></html:option>
												<html:option value="3"><bean:message key="day.tuesday"/></html:option>
												<html:option value="4"><bean:message key="day.wednesday"/></html:option>
												<html:option value="5"><bean:message key="day.thursday"/></html:option>
												<html:option value="6"><bean:message key="day.friday"/></html:option>
												<html:option value="7"><bean:message key="day.saturday"/></html:option>
												<html:option value="1"><bean:message key="day.sunday"/></html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.toDay"/>
											<html:select styleClass="form" property="endDay7">
												<html:option value="2"><bean:message key="day.monday"/></html:option>
												<html:option value="3"><bean:message key="day.tuesday"/></html:option>
												<html:option value="4"><bean:message key="day.wednesday"/></html:option>
												<html:option value="5"><bean:message key="day.thursday"/></html:option>
												<html:option value="6"><bean:message key="day.friday"/></html:option>
												<html:option value="7"><bean:message key="day.saturday"/></html:option>
												<html:option value="1"><bean:message key="day.sunday"/></html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.everyHour"/>
										</td>
									</tr>
									<tr height="30">
										<td class="data1Text">
											<html:radio styleClass="form" property="pattern" value="8" />
											<bean:message key="showSellerCalendar.fromDay"/>
											<html:select styleClass="form" property="startDay8">
												<html:option value="2"><bean:message key="day.monday"/></html:option>
												<html:option value="3"><bean:message key="day.tuesday"/></html:option>
												<html:option value="4"><bean:message key="day.wednesday"/></html:option>
												<html:option value="5"><bean:message key="day.thursday"/></html:option>
												<html:option value="6"><bean:message key="day.friday"/></html:option>
												<html:option value="7"><bean:message key="day.saturday"/></html:option>
												<html:option value="1"><bean:message key="day.sunday"/></html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.toDay"/>
											<html:select styleClass="form" property="endDay8">
												<html:option value="2"><bean:message key="day.monday"/></html:option>
												<html:option value="3"><bean:message key="day.tuesday"/></html:option>
												<html:option value="4"><bean:message key="day.wednesday"/></html:option>
												<html:option value="5"><bean:message key="day.thursday"/></html:option>
												<html:option value="6"><bean:message key="day.friday"/></html:option>
												<html:option value="7"><bean:message key="day.saturday"/></html:option>
												<html:option value="1"><bean:message key="day.sunday"/></html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.fromHour"/>
											<html:select styleClass="form" property="startHour8">
												<html:option value="0">00</html:option>
												<html:option value="1">01</html:option>
												<html:option value="2">02</html:option>
												<html:option value="3">03</html:option>
												<html:option value="4">04</html:option>
												<html:option value="5">05</html:option>
												<html:option value="6">06</html:option>
												<html:option value="7">07</html:option>
												<html:option value="8">08</html:option>
												<html:option value="9">09</html:option>
												<html:option value="10">10</html:option>
												<html:option value="11">11</html:option>
												<html:option value="12">12</html:option>
												<html:option value="13">13</html:option>
												<html:option value="14">14</html:option>
												<html:option value="15">15</html:option>
												<html:option value="16">16</html:option>
												<html:option value="17">17</html:option>
												<html:option value="18">18</html:option>
												<html:option value="19">19</html:option>
												<html:option value="20">20</html:option>
												<html:option value="21">21</html:option>
												<html:option value="22">22</html:option>
												<html:option value="23">23</html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.toHour"/>
											<html:select styleClass="form" property="endHour8">
												<html:option value="0">00</html:option>
												<html:option value="1">01</html:option>
												<html:option value="2">02</html:option>
												<html:option value="3">03</html:option>
												<html:option value="4">04</html:option>
												<html:option value="5">05</html:option>
												<html:option value="6">06</html:option>
												<html:option value="7">07</html:option>
												<html:option value="8">08</html:option>
												<html:option value="9">09</html:option>
												<html:option value="10">10</html:option>
												<html:option value="11">11</html:option>
												<html:option value="12">12</html:option>
												<html:option value="13">13</html:option>
												<html:option value="14">14</html:option>
												<html:option value="15">15</html:option>
												<html:option value="16">16</html:option>
												<html:option value="17">17</html:option>
												<html:option value="18">18</html:option>
												<html:option value="19">19</html:option>
												<html:option value="20">20</html:option>
												<html:option value="21">21</html:option>
												<html:option value="22">22</html:option>
												<html:option value="23">23</html:option>
											</html:select>
											&nbsp;<bean:message key="showSellerCalendar.hours"/>&nbsp;
											<bean:message key="showSellerCalendar.included"/>
										</td>
									</tr>
									<tr height="30">
										<td class="data1Text">
											<html:radio styleClass="form" property="pattern" value="9" />
											<bean:message key="showSellerCalendar.pattern9"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td  height="30"></td></tr>
						<tr>
							<td align="right">
								<button class="form" onclick="document.getElementById( 'mainDiv').style.visibility = 'hidden';document.getElementById( 'waitDiv').style.visibility = 'visible';submit();"><bean:message key="showSellerCalendar.generate"/></button>
							</td>
						</tr>
					</html:form>
				</table>
			</td>
			<td width="8"  background="pictures/borderRight.gif">
			</td>
		</tr>
		<tr>
			<td width="8" height="8" background="pictures/borderBottomLeft.gif">
			</td>
			<td  height="8" background="pictures/borderBottom.gif" >	
			</td>
			<td width="8" height="8" background="pictures/borderBottomRight.gif">
			</td>
		</tr>
	</table>
	</div>


	</tiles:put>
</tiles:insert>
