<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-tiles.tld' prefix='tiles' %>

<table width="706" cellpadding="0" cellspacing="0" border="0" >
	<tr>
		<td width="8" height="8" background="pictures/borderTopLeft.gif">
		</td>
		<td height="8" background="pictures/borderTop.gif" >	
		</td>
		<td width="8" height="8" background="pictures/borderTopRight.gif">
		</td>
	</tr>
			
	<tr>
		<td width="8" background="pictures/borderLeft.gif">
		</td>
		<td>	
		
			<logic:notEmpty name="showInIndexSeller">
				<table cellpadding="0" cellspacing="1" border="0" >
					<tr valign="top">
						<logic:iterate name="showInIndexSeller" id="collection">
							<td>
								<table cellpadding="0" cellspacing="2" border="0" >
									<tr>
										<td valign="top"> 
											<logic:equal name="collection" property="hasPicture" value="1">
								  				<img src="/media/pictures/smaller/seller_<bean:write name="collection" property="id"/>_<bean:write name="collection" property="mainPicture"/>_<bean:write name="collection" property="mainPictureCode"/>.jpg"/>
								  			</logic:equal>
								  			<logic:notEqual name="collection" property="hasPicture" value="1">
								  				<logic:equal name="collection" property="sexId" value="1">
									  				<img src="pictures/defaultGirl.gif"/>
									  			</logic:equal>
								  				<logic:equal name="collection" property="sexId" value="2">
									  				<img src="pictures/defaultBoy.gif"/>
									  			</logic:equal>
								  				<logic:equal name="collection" property="sexId" value="4">
									  				<img src="pictures/defaultShemale.gif"/>
									  			</logic:equal>
								  				<logic:equal name="collection" property="sexId" value="8">
									  				<img src="pictures/defaultBoysCouple.gif"/>
									  			</logic:equal>
								  				<logic:equal name="collection" property="sexId" value="16">
									  				<img src="pictures/defaultGirlsCouple.gif"/>
									  			</logic:equal>
								  				<logic:equal name="collection" property="sexId" value="32">
									  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
									  			</logic:equal>
								  				<logic:equal name="collection" property="sexId" value="64">
									  				<img src="pictures/defaultGroup.gif"/>
									  			</logic:equal>
								  			</logic:notEqual>
										</td>
										<td align="left" width="80" valign="top">
							  				<table cellpadding="0" cellspacing="0" border="0" align="left">
							  					<tr align="left">
							  						<td nowrap class="data1Text" align="left">
							  							<a href="showSeller.do?id=<bean:write name="collection" property="id"/>" class="data1Link">
									  						<bean:write name="collection" property="briefLogin"/>
									  					</a>
							  						</td>
							  					</tr>
							  					<tr align="left">
							  						<td class="data1Text" align="left">
								  						<bean:write name="collection" property="sex"/>
							  						</td>
							  					</tr>
							  					<tr align="left">
							  						<td nowrap class="data1Text" align="left">
								  						<bean:write name="collection" property="age"/>
							  						</td>
							  					</tr>
							  					<tr align="left">
							  						<td nowrap class="data1Text" align="left">
								  						<bean:write name="collection" property="briefCity"/>
							  						</td>
							  					</tr>										  					
							  					<tr align="left">
							  						<td nowrap class="data1Text" align="left">
								  						<bean:write name="collection" property="state"/>
							  						</td>
							  					</tr>
							  					<tr align="left">
							  						<td nowrap class="data1Text" align="left">
								  						<bean:write name="collection" property="country"/>
							  						</td>
							  					</tr>
							  				</table>
							  			</td>
									</tr>
								</table>
							</td>
						</logic:iterate>
					</tr>
				</table>
			</logic:notEmpty>
			
			<logic:empty name="showInIndexSeller">
				<table cellpadding="0" cellspacing="3" border="0" >
					<tr valign="top">
						<td height="70">
						</td>
					</tr>
				</table>
			</logic:empty>
		</td>
		<td width="8"  background="pictures/borderRight.gif">
		</td>
	</tr>
	
	<tr>
		<td width="8" background="pictures/borderLeft.gif">
		</td>
		<td align="right">	
			<a href="showAllMainSeller.do" class="link1Text"><bean:message key="indexMainUser.seeAll"/></a>
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