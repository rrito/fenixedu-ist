/**
 * Copyright © 2013 Instituto Superior Técnico
 *
 * This file is part of FenixEdu IST QUC.
 *
 * FenixEdu IST QUC is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FenixEdu IST QUC is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FenixEdu IST QUC.  If not, see <http://www.gnu.org/licenses/>.
 */
package pt.ist.fenixedu.quc.dto;

import java.io.Serializable;

import org.fenixedu.academic.domain.ExecutionCourse;
import org.fenixedu.academic.domain.Person;
import org.fenixedu.academic.domain.exceptions.DomainException;

import pt.ist.fenixedu.quc.domain.ExecutionCourseAudit;
import pt.ist.fenixframework.Atomic;

public class AuditSelectPersonsECBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private ExecutionCourse executionCourse;
    private Person student;
    private Person teacher;

    public AuditSelectPersonsECBean(ExecutionCourse executionCourse) {
        setExecutionCourse(executionCourse);
    }

    public AuditSelectPersonsECBean(ExecutionCourseAudit executionCourseAudit) {
        setExecutionCourse(executionCourseAudit.getExecutionCourse());
        setStudent(executionCourseAudit.getStudentAuditor().getPerson());
        setTeacher(executionCourseAudit.getTeacherAuditor().getPerson());
    }

    public Person getStudent() {
        return student;
    }

    public void setStudent(Person student) {
        this.student = student;
    }

    public Person getTeacher() {
        return teacher;
    }

    public void setTeacher(Person teacher) {
        this.teacher = teacher;
    }

    public void setExecutionCourse(ExecutionCourse executionCourse) {
        this.executionCourse = executionCourse;
    }

    public ExecutionCourse getExecutionCourse() {
        return executionCourse;
    }

    @Atomic
    public void savePersons() {
        if (getTeacher() == null) {
            throw new DomainException("error.inquiry.audit.mandatoryTeacher");
        }
        if (getStudent() == null) {
            throw new DomainException("error.inquiry.audit.mandatoryStudent");
        }
        ExecutionCourseAudit executionCourseAudit = getExecutionCourse().getExecutionCourseAudit();
        if (executionCourseAudit == null) {
            executionCourseAudit = new ExecutionCourseAudit(getExecutionCourse());
        }
        executionCourseAudit.edit(getTeacher(), getStudent());
    }
}
