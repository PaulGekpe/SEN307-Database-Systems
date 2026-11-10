# SEN307 Database Systems — Week 6 Practical
## Lab 4: Data Manipulation Language (DML)

**Student:** Paul Kelechi  
**Matriculation Number:** VUG/SEN/24/12934  
**Database:** `sen307_VUG_SEN_24_12934`

### Practical summary

The Week 6 practical involved populating the Week 5 university course-registration database with sample records using SQL `INSERT` statements. Five departments and ten courses were inserted. Ten lecturers and twenty students were then added using multi-row INSERT statements. The student's own name and matriculation number were included in the Student table.

Forty enrolment records were created. The Database Systems course (SEN307) has eight enrolled students, satisfying the requirement for at least one course to have more than five students. Michael Bassey and Joy Samuel were intentionally left without enrolments. The data also contains a mixture of male and female students with dates of birth between 2003 and 2007. Eleven course allocations were added, ensuring that every course has at least one lecturer and that SEN307 has two lecturers.

### Part 3: UPDATE operation

The Student record for Paul Kelechi (`VUG/SEN/24/12934`) was initially assigned to Software Engineering. An UPDATE statement changed the student's `dept_id` to the department ID belonging to Computer Science. A SELECT query before and after the UPDATE confirmed that the department changed successfully.

### Part 4: Referential integrity and Error 1451

When I attempted to delete the **Library and Information Science** department, MySQL returned **Error 1451: Cannot delete or update a parent row: a foreign key constraint fails**. The error occurred because the `Transfer Student` record in the Student table still referenced that department through the `dept_id` foreign key. The Department row was the parent record, while the Student row was the dependent child record. MySQL prevented the deletion to protect referential integrity and avoid leaving an invalid foreign-key reference.

I fixed the problem by updating the `Transfer Student` record (`20239999`) so that its `dept_id` referenced the existing Software Engineering department. After confirming the reassignment, I ran the DELETE statement again. It succeeded because no student was referencing the temporary department anymore. The student was retained in the database; only the now-unreferenced department was deleted.

**Another possible fix** would have been to delete the dependent student first, if removing that student were appropriate. Another design option would be to define the foreign key with `ON DELETE CASCADE`, which would automatically delete dependent student records when a department is deleted. However, that option was not used because it could unintentionally remove student records. Reassigning the student was the safer solution for this practical.

### Final verification

The final row counts were:

| Table | Total records |
|---|---:|
| Department | 5 |
| Lecturer | 10 |
| Student | 21 |
| Course | 10 |
| Enrolment | 40 |
| CourseAllocation | 11 |

The Student table contains 21 records because the additional Transfer Student was retained after being reassigned to Software Engineering. The practical requirements were met, and the original five departments remained after the referential-integrity exercise.
