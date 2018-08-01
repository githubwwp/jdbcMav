package patterntest.mvcpattern;

public class Test {

    public static void main(String[] args) {
        Student student = retriveStudentFromDatabase();

        StudentView view = new StudentView();

        StudentController controller = new StudentController(student, view);
        controller.updateView();

        controller.setStudentName("John");
        controller.updateView();

    }

    private static Student retriveStudentFromDatabase() {
        Student student = new Student();
        student.setName("Robert");
        student.setRollNo("10");
        return student;
    }

}
