<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<logic:present name="buyerSession">
		<tiles:put name='buyerMenuTile' content='buyerMenuTile.jsp'/>
	</logic:present>
	<logic:present name="sellerSession">
		<tiles:put name='sellerMenuTile' content='sellerMenuTile.jsp'/>
	</logic:present>
	<tiles:put name='footer1Tile' content='footer1Tile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
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
				<table width="85%" cellpadding="0" cellspacing="5" border="0">
					<tr>
						<td class="data3Text">
							<b><bean:message key="showFaq.title"/></b>
						</td>
					</tr>
					<tr>
						<td>
							<table width="80%" cellpadding="0" cellspacing="5" border="0">
								<tr><td nowrap><a href="#question1" class="faqQuestionLink"><bean:message key="showFaq.question1"/></a></td></tr>
								<tr><td nowrap><a href="#question2" class="faqQuestionLink"><bean:message key="showFaq.question2"/></a></td></tr>
								<tr><td nowrap><a href="#question3" class="faqQuestionLink"><bean:message key="showFaq.question3"/></a></td></tr>
								<tr><td nowrap><a href="#question4" class="faqQuestionLink"><bean:message key="showFaq.question4"/></a></td></tr>
								<tr><td nowrap><a href="#question5" class="faqQuestionLink"><bean:message key="showFaq.question5"/></a></td></tr>
								<tr><td nowrap><a href="#question6" class="faqQuestionLink"><bean:message key="showFaq.question6"/></a></td></tr>
								<tr><td nowrap><a href="#question7" class="faqQuestionLink"><bean:message key="showFaq.question7"/></a></td></tr>
								<tr><td nowrap><a href="#question8" class="faqQuestionLink"><bean:message key="showFaq.question8"/></a></td></tr>
								<tr><td nowrap><a href="#question10" class="faqQuestionLink"><bean:message key="showFaq.question10"/></a></td></tr>
								<tr><td nowrap><a href="#question11" class="faqQuestionLink"><bean:message key="showFaq.question11"/></a></td></tr>
							</table>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					<tr><td background="pictures/pixel.gif"></td></tr>
					<tr><td height="15"></td></tr>
					<tr><td class="faqQuestion"><a name="question1"><bean:message key="showFaq.question1"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer1"/></td>
					<tr><td height="10"></td></tr>
					<tr><td class="faqQuestion"><a name="question2"><bean:message key="showFaq.question2"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer2"/></td>
					<tr><td height="10"></td></tr>
					<tr><td class="faqQuestion"><a name="question3"><bean:message key="showFaq.question3"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer3"/></td>
					<tr><td height="10"></td></tr>
					<tr><td class="faqQuestion"><a name="question4"><bean:message key="showFaq.question4"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer4"/></td>
					<tr><td height="10"></td></tr>
					<tr><td class="faqQuestion"><a name="question5"><bean:message key="showFaq.question5"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer5"/></td>
					<tr><td height="10"></td></tr>
					<tr><td class="faqQuestion"><a name="question6"><bean:message key="showFaq.question6"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer6"/></td>
					<tr><td height="10"></td></tr>
					<tr><td class="faqQuestion"><a name="question7"><bean:message key="showFaq.question7"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer7"/></td>
					<tr><td height="10"></td></tr>
					<tr><td class="faqQuestion"><a name="question8"><bean:message key="showFaq.question8"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer8"/></td>
					<tr><td height="10"></td></tr>
					<tr><td class="faqQuestion"><a name="question10"><bean:message key="showFaq.question10"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer10"/></td>
					<tr><td height="10"></td></tr>
					<tr><td class="faqQuestion"><a name="question11"><bean:message key="showFaq.question11"/></a></td></tr>
					<tr><td class="data2text" style="TEXT-ALIGN: justify;"><bean:message key="showFaq.answer11"/></td>
					</tr>
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


	</tiles:put>
</tiles:insert>
