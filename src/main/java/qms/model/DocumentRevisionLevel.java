package qms.model;
import org.hibernate.validator.constraints.NotEmpty;
public class DocumentRevisionLevel {
	private String id;
	@NotEmpty
	private String revision_level;
	
	
	public DocumentRevisionLevel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DocumentRevisionLevel(String id,String revision_level) {
		super();
		this.id = id;
		this.revision_level = revision_level;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRevision_level() {
		return revision_level;
	}
	public void setRevision_level(String revision_level) {
		this.revision_level = revision_level;
	}
	
	
	

}
