package qms.model;
import org.hibernate.validator.constraints.NotEmpty;
public class Process
{
	@NotEmpty
	private String process_id;
	@NotEmpty
	private String process_name;
	@NotEmpty
	private String process_owner;

	public Process(String process_id, String process_name, String process_owner) {
		super();
		this.process_id = process_id;
		this.process_name = process_name;
		this.process_owner = process_owner;
	}

	public Process() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getProcess_id() {
		return process_id;
	}

	public void setProcess_id(String process_id) {
		this.process_id = process_id;
	}

	public String getProcess_name() {
		return process_name;
	}

	public void setProcess_name(String process_name) {
		this.process_name = process_name;
	}

	public String getProcess_owner() {
		return process_owner;
	}

	public void setProcess_owner(String process_owner) {
		this.process_owner = process_owner;
	}
	
	
}