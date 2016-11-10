package cn.lynu.lyq.java_exam.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class StudentExamScore {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="student_id")
	private Student student;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="exam_id")
	private Exam exam;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="exam_strategy_id")	
	private ExamStrategy examStrategy;
	private int score;
	private String examPhase;
	
	public StudentExamScore() {}
	
	public StudentExamScore(Student student, Exam exam, ExamStrategy examStrategy, int score, String examPhase) {
		this.student = student;
		this.exam = exam;
		this.examStrategy = examStrategy;
		this.score = score;
		this.examPhase = examPhase;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	public ExamStrategy getExamStrategy() {
		return examStrategy;
	}

	public void setExamStrategy(ExamStrategy examStrategy) {
		this.examStrategy = examStrategy;
	}

	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

	public String getExamPhase() {
		return examPhase;
	}

	public void setExamPhase(String examPhase) {
		this.examPhase = examPhase;
	}
	
}
