<%--

    Copyright © 2013 Instituto Superior Técnico

    This file is part of FenixEdu IST Tutorship.

    FenixEdu IST Tutorship is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FenixEdu IST Tutorship is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FenixEdu IST Tutorship.  If not, see <http://www.gnu.org/licenses/>.

--%>
<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<html:xhtml/>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr"%>

<h2><bean:message key="label.teacher.tutor.edit.students"/></h2>

<logic:messagesPresent message="true">
	<ul class="list7 mtop2 warning0" style="list-style: none;">
		<html:messages id="message" message="true" bundle="ACADEMIC_OFFICE_RESOURCES">
			<li>
				<span><!-- Error messages go here --><bean:write name="message" /></span>
			</li>
		</html:messages>
	</ul>
</logic:messagesPresent>

<logic:present name="student">
	<logic:notEmpty name="student">
		<table class="tstyle1 thlight tdcenter">
			<tr>
				<th><bean:message bundle="APPLICATION_RESOURCES" key="label.name" /></th>
				<td><bean:write name="student" property="name"/></td>
			</tr><tr>
				<th><bean:message bundle="APPLICATION_RESOURCES" key="label.number" /></th>
				<td><bean:write name="student" property="number"/></td>
			</tr><tr>
				<th><bean:message bundle="APPLICATION_RESOURCES" key="label.phone" /></th>
				<td><bean:write name="student" property="person.defaultPhoneNumber"/></td>
			</tr><tr>
				<th><bean:message bundle="APPLICATION_RESOURCES" key="label.email" /></th>
				<td>
					<bean:define id="mail" name="student" property="person.institutionalOrDefaultEmailAddressValue"/>
					<html:link href="<%= "mailto:"+ mail %>">
						<bean:write name="student" property="person.institutionalOrDefaultEmailAddressValue"/>
					</html:link>
				</td>
			</tr>
		</table>
		<fr:edit id="kkkkk"
					name="tutorshipLog"
					type="pt.ist.fenixedu.tutorship.domain.TutorshipLog"
					schema="teacher.student.tutorship.log"
					action="/viewStudentsByTutor.do?method=viewStudentsByTutor">
			<fr:layout>
	    	    <fr:property name="classes" value="tstyle1 thlight thright mtop05"/>
	        	<fr:property name="columnClasses" value=",,tdclear tderror1"/>
		    </fr:layout>
		    <fr:destination name="invalid"/>
		</fr:edit>
	</logic:notEmpty>
	<logic:empty name="student"><bean:message key="error.tutor.noStudent" /></logic:empty>
</logic:present>
<logic:notPresent name="student"><bean:message key="error.tutor.noStudent" /></logic:notPresent>