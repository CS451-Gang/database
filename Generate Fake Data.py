import random

def check_for_dupes(id, name):
    id_table = []
    name_table = []
    x = ""
    
    for x in id_table:
        is_dupe_id = bool(False)
        if x == id:
            break
        else:
            id_table.append(id)
            is_dupe_id = bool(True)
            break
    
    for x in name_table:
        is_dupe_name = bool(False)
        if x == name:
            break
        else:
            name_table.append(name)
            is_dupe_name = bool(True)
            break

    if len(id_table) == 0:
        id_table.append(id)
        is_dupe_id = bool(True)

    if len(name_table) == 0:
        name_table.append(name)
        is_dupe_name = bool(True)

    if is_dupe_id and is_dupe_name is bool(True):
        return True
    else:
        return False

def generate_fake_stu(n):
    i = 0
    fname_list = ["Bill", "Ken", "May", "Sean", "Kate", "Holly", "Ben", "Will", "Kelly", "Sherry", "Tim", "Mary", "Serena", "Alex", "Lexi"]
    lname_list = ["Smith", "Berry", "Miller", "Bean", "Hill", "Green", "Black", "Brown", "Davis", "Jones", "Garcia", "Hart", "Katz", "Madden"]
    stu_qualifications = ["Bachelors", "Masters", "Doctorate"]
    stu_major = ["Computer Science", "Math", "English",]
    sql_query = """INSERT INTO Student (Student_ID, Student_FName, Student_LName, Student_Email, Student_InternationalStatus, Student_GTACert, Student_Qualifications, Student_Major, Student_NumOfSem)
VALUES"""

    while i <= n:
        stu_id = str(random.randint(10000000,20000000))
        fake_stu = "('"
        stu_fname = random.choice(fname_list)
        stu_lname = random.choice(lname_list)
        stu_name = stu_fname + " " + stu_lname
        stu_email = stu_fname.lower() + stu_lname.lower() + "@umsystem.edu"

        if i != n:
            fake_stu = fake_stu + stu_id + "'," + "'" + stu_fname + "'," + "'" + stu_lname + "'," + "'" + stu_email + "'," + "'" + str(random.randint(0,1)) + "'," + "'" + str(random.randint(0,1)) + "'," + "'" + random.choice(stu_qualifications) + "'," + "'" + random.choice(stu_major) + "'," + "'" + str(random.randint(1,12)) + "'),\n"
        else:
            fake_stu = fake_stu + stu_id + "'," + "'" + stu_fname + "'," + "'" + stu_lname + "'," + "'" + stu_email + "'," + "'" + str(random.randint(0,1)) + "'," + "'" + str(random.randint(0,1)) + "'," + "'" + random.choice(stu_qualifications) + "'," + "'" + random.choice(stu_major) + "'," + "'" + str(random.randint(1,12)) + "');\n"
        
        if check_for_dupes(stu_id, stu_name) is bool(True):
            sql_query = sql_query + " " + fake_stu
        i += 1

    return(sql_query)

def generate_fake_fac(n):
    i = 0
    fname_list = ["Terry", "Mily", "Lena"]
    lname_list = ["Nouzen", "Shuga", "Ince"]
    sql_query = """INSERT INTO Faculty (Faculty_ID , Faculty_FName, Faculty_LName, Faculty_Email)
VALUES"""

    while i <= n:
        fac_id = str(random.randint(100000000,200000000))
        fake_fac = "('"
        fac_fname = random.choice(fname_list)
        fac_lname = random.choice(lname_list)
        fac_name = fac_fname + " " + fac_lname
        fac_email = fac_fname.lower() + fac_lname.lower() + "@umsystem.edu"

        if i != n:
            fake_fac = fake_fac + fac_id + "'," + "'" + fac_fname + "'," + "'" + fac_lname + "'," + "'" + fac_email + "'),\n"
        else:
            fake_fac = fake_fac + fac_id + "'," + "'" + fac_fname + "'," + "'" + fac_lname + "'," + "'" + fac_email + "');\n"

        if check_for_dupes(fac_id, fac_name) is bool(True):
            sql_query = sql_query + " " + fake_fac
        i += 1
    
    return(sql_query)

def generate_fake_course(n):
    i = 0
    course_ab = ["CS", "BIO", "ENG", "ACC", "MGT"]
    course_type = ["Comp-Sci", "Biology", "English", "Accounting", "Management"]
    sql_query = """INSERT INTO Course (Course_ID , Course_Type)
VALUES """

    while i <= n:
        course_id = ""
        ran_course_typy = random.choice(course_type)
        fake_course = "('"
        course_id_table = []

        if ran_course_typy == "Comp-Sci":
            temp = course_ab[0]
            course_id = temp + str(random.randint(100, 499))
        elif ran_course_typy == "Biology":
            temp = course_ab[1]
            course_id = temp + str(random.randint(100, 499))
        elif ran_course_typy == "English":
            temp = course_ab[2]
            course_id = temp + str(random.randint(100, 499))
        elif ran_course_typy == "Accounting":
            temp = course_ab[3]
            course_id = temp + str(random.randint(100, 499))
        else:
            temp = course_ab[4]
            course_id = temp + str(random.randint(100, 499))

        if course_id in course_id_table:
            generate_fake_course(n)
        else:
            course_id_table.append(course_id)

        if i != n:
            fake_course = fake_course + course_id + "'," + "'" + ran_course_typy + "'),\n"
        else:
            fake_course = fake_course + course_id + "'," + "'" + ran_course_typy + "');\n"
        
        sql_query = sql_query + fake_course
        i += 1
    
    return(sql_query)


def main():
    num_of_stu = 10
    num_of_fac = 3
    num_of_cour = 5
    f1 = open("fakestudent.txt", "w")
    f2 = open("fakefaculty.txt", "w")
    f3 = open("fakecourse.txt", "w")

    f1.write(generate_fake_stu(num_of_stu))
    f2.write(generate_fake_fac(num_of_fac))
    f3.write(generate_fake_course(num_of_cour))

    print("Done")

    f1.close()
    f2.close()
    f3.close()

if __name__ == '__main__':
    main()
