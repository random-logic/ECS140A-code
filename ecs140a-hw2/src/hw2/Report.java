package hw2;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/*
 * To ensure you get graded correctly by autograder, 
 * DO NOT change the file name (Report.java), method name (generateReport), or add parameters to this method.
 * Use the provided variables in the reportBuilder code. 
 * Check if your generateReport() output is equal to hw2_output.txt (String.equals())
 * 
 * Questions or comments? Direct them to Ty Feng or ask on Piazza
 * 
 */
public class Report {
	public static final String INPUT_FILE_NAME = "hw2.txt";
	public static final String INPUT_DELIMITER = ";";
	public static final String YES = "Y";

	public static final String CERTIFICATE_STUDENT_SYMBOL = "C";
	public static final String SENIOR_CITIZEN_SYMBOL = "S";

	// generateReport() should be a public static method that takes no parameters and returns a String
	public static String generateReport() {
		StringBuilder reportBuilder = new StringBuilder();
		// TODO:
		// Read hw2.txt line by line
		// Hardcode "hw2.txt" as your input, which means that you should put hw2.txt 
		// right under your Eclipse workspace folder (the top level of the workspace hierarchy).

		// For each record, create an instance from the corresponding class (FinAssist,
		// NoFinAssist, Degree, etc.)

		// Save all instances to a Student[] array. Student is the interface or parent class for all the
		// classes you make.
		List<Student> students = new ArrayList<Student>(); // save all the student record objects here

		try (BufferedReader br = new BufferedReader(new FileReader(INPUT_FILE_NAME))) {
			String line;
			while ((line = br.readLine()) != null) {
				String[] data = line.split(INPUT_DELIMITER);
				int id = Integer.parseInt(data[0]);
				String firstName = data[1];
				String lastName = data[2];
				int age = Integer.parseInt(data[3]);
				int credits = Integer.parseInt(data[4]);
				boolean isFullTime = data[5].equals(YES);

				if (isFullTime) {
					Study major = Study.interpretInput(data[6]);
					AcademicStanding academicStanding = AcademicStanding.interpretInput(data[7]);
					boolean receivesFinancialAid = data[8].equals(YES);

					if (receivesFinancialAid) {
						double financialAid = Double.parseDouble(data[9]);
						students.add(new StudentWithFinancialAid(id, firstName, lastName, age, credits, major, academicStanding, financialAid));
					}
					else {
						students.add(new DegreeSeekingStudent(id, firstName, lastName, age, credits, major, academicStanding));
					}
				}
				else if (data[6].equals(CERTIFICATE_STUDENT_SYMBOL)) {
					Study certificate = Study.interpretInput(data[7]);
					students.add(new CertificateStudent(id, firstName, lastName, age, credits, certificate));
				}
				else if (data[6].equals(SENIOR_CITIZEN_SYMBOL)) {
					students.add(new SeniorCitizen(id, firstName, lastName, age, credits));
				}
			}
		} catch (IOException e) {
				e.printStackTrace();
		}

		// DO NOT ADD, CHANGE, OR DELETE ANY reportBuilder code. Use the provided variables.
		// INDIVIDUAL REPORTS, listing of all students and the fees they have each been
		// assessed

		// Print out first and last name and fee amount
		reportBuilder.append("Summary of each student's fees assessed: \n\n");
		for (Student student : students) {
			int student_fee = (int)student.calculateFee();
			System.out.println(student_fee);
			String student_name = student.getName();
			reportBuilder.append(student_name + " has $" + String.format("%,d", student_fee) + " fees assessed \n");
		}
		
		// This should work once your Student classes are implemented
		// Don't worry about the string formatting in printData()  :)
		// Make sure you do not comment out the following two lines when you submit the hw
		// students.get(0).printData();
		// students.get(1).printData();
		for (Student student : students) {
			student.printData();
		}

		// SUMMARY REPORT of fees assessed for each of the four types of student
		int degree_nofin_fees = 0;
		int degree_fin_fees = 0;
		int certificate_fees = 0;
		int senior_fees = 0;
		int total_fees = 0;

		for (Student student : students) {
			double studentFee = student.calculateFee();
			total_fees += studentFee;
			
			if (student.getClass() == DegreeSeekingStudent.class) {
				degree_nofin_fees += studentFee;
			}
			else if (student.getClass() == StudentWithFinancialAid.class) {
				degree_fin_fees += studentFee;
			}
			else if (student.getClass() == CertificateStudent.class) {
				certificate_fees += studentFee;
			}
			else if (student.getClass() == SeniorCitizen.class) {
				senior_fees += studentFee;
			}
		}
		
		// Print out the total fees for different students
		reportBuilder.append("\n\n");
		reportBuilder.append("Summary of all student fees assessed: \n\n");
		reportBuilder.append(
				"Degree-seeking students without financial assistance: $" + String.format("%,d", degree_nofin_fees) + "\n");
		reportBuilder
				.append("Degree-seeking students with financial assistance: $" + String.format("%,d", degree_fin_fees) + "\n");
		reportBuilder.append("Certificate students: $" + String.format("%,d", certificate_fees) + "\n");
		reportBuilder.append("Senior citizens: $" + String.format("%,d", senior_fees) + "\n\n");
		reportBuilder.append("Total fees assessed: $" + String.format("%,d", total_fees));

		return reportBuilder.toString();
	}

	public static void main(String[] args) {
		// You may test your Report here by comparing the output with the provided hw2_output.txt
		System.out.println(generateReport());
	}
}
