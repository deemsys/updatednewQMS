package qms.model;


import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class Maintenance
{
	
	
	
	@NotEmpty
	private String equipment_id;
	@NotEmpty
	private String equipment_name;
	@NotEmpty
	private String equipment_model;
	@NotEmpty
	private String serial_number;
	@NotEmpty
	private String date_acquired;
	@NotEmpty
	private String equipment_status;
	
	private String frequency_maintenance;

	private String calibration;
	
	private String equipmentid;
	
	private String type_of_maintenance;
	
	private String weekly;
	private String monthly;
	private String quarterly;
	private String semiannually;
	private String annually;
	
	private String reference1; 
	private String reference2; 
	private String reference3; 
	private String reference4;
	private String reference5; 
	
	
	private String instructions;
	private String instructionattach;
	@NotEmpty
	private String due_date;
	@NotEmpty
	private String completion_date;
	@NotEmpty
	private String completed_by;
	@NotEmpty
	private String notes;
	@NotEmpty
	public Maintenance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Maintenance(String equipment_id, String equipment_name,
			String equipment_model, String serial_number, String date_acquired,
			String equipment_status, String frequency_maintenance,
			String calibration, String equipmentid, String type_of_maintenance,
			String weekly, String monthly, String quarterly,
			String semiannually, String annually, String reference1,String reference2,String reference3,String reference4,
			String reference5,
			String instructions,String instructionattach, String due_date, String completion_date,
			String completed_by, String notes) {
		super();
		this.equipment_id = equipment_id;
		this.equipment_name = equipment_name;
		this.equipment_model = equipment_model;
		this.serial_number = serial_number;
		this.date_acquired = date_acquired;
		this.equipment_status = equipment_status;
		this.frequency_maintenance = frequency_maintenance;
		this.calibration = calibration;
		this.equipmentid = equipmentid;
		this.type_of_maintenance = type_of_maintenance;
		this.weekly = weekly;
		this.monthly = monthly;
		this.quarterly = quarterly;
		this.semiannually = semiannually;
		this.annually = annually;
		this.reference1 = reference1;
		this.reference2 = reference2;
		this.reference3 = reference3;
		this.reference4 = reference4;
		this.reference5 = reference5;
		this.instructions = instructions;
		this.instructionattach = instructionattach;
		this.due_date = due_date;
		this.completion_date = completion_date;
		this.completed_by = completed_by;
		this.notes = notes;
	}
	public String getEquipment_id() {
		return equipment_id;
	}
	public void setEquipment_id(String equipment_id) {
		this.equipment_id = equipment_id;
	}
	public String getEquipment_name() {
		return equipment_name;
	}
	public void setEquipment_name(String equipment_name) {
		this.equipment_name = equipment_name;
	}
	public String getEquipment_model() {
		return equipment_model;
	}
	public void setEquipment_model(String equipment_model) {
		this.equipment_model = equipment_model;
	}
	public String getSerial_number() {
		return serial_number;
	}
	public void setSerial_number(String serial_number) {
		this.serial_number = serial_number;
	}
	public String getDate_acquired() {
		return date_acquired;
	}
	public void setDate_acquired(String date_acquired) {
		this.date_acquired = date_acquired;
	}
	public String getEquipment_status() {
		return equipment_status;
	}
	public void setEquipment_status(String equipment_status) {
		this.equipment_status = equipment_status;
	}
	public String getFrequency_maintenance() {
		return frequency_maintenance;
	}
	public void setFrequency_maintenance(String frequency_maintenance) {
		this.frequency_maintenance = frequency_maintenance;
	}
	public String getCalibration() {
		return calibration;
	}
	public void setCalibration(String calibration) {
		this.calibration = calibration;
	}
	public String getEquipmentid() {
		return equipmentid;
	}
	public void setEquipmentid(String equipmentid) {
		this.equipmentid = equipmentid;
	}
	public String getType_of_maintenance() {
		return type_of_maintenance;
	}
	public void setType_of_maintenance(String type_of_maintenance) {
		this.type_of_maintenance = type_of_maintenance;
	}
	public String getWeekly() {
		return weekly;
	}
	public void setWeekly(String weekly) {
		this.weekly = weekly;
	}
	public String getMonthly() {
		return monthly;
	}
	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}
	public String getQuarterly() {
		return quarterly;
	}
	public void setQuarterly(String quarterly) {
		this.quarterly = quarterly;
	}
	public String getSemiannually() {
		return semiannually;
	}
	public void setSemiannually(String semiannually) {
		this.semiannually = semiannually;
	}
	public String getAnnually() {
		return annually;
	}
	public void setAnnually(String annually) {
		this.annually = annually;
	}
	
	public String getReference1() {
		return reference1;
	}
	public void setReference1(String reference1) {
		this.reference1 = reference1;
	}
	
	public String getReference2() {
		return reference2;
	}
	public void setReference2(String reference2) {
		this.reference2 = reference2;
	}
	public String getReference3() {
		return reference3;
	}
	public void setReference3(String reference3) {
		this.reference3 = reference3;
	}
	public String getReference4() {
		return reference4;
	}
	public void setReference4(String reference4) {
		this.reference4 = reference4;
	}
	public String getReference5() {
		return reference5;
	}
	public void setReference5(String reference5) {
		this.reference5 = reference5;
	}
	public String getInstructions() {
		return instructions;
	}
	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}
	
	public String getInstructionattach() {
		return instructionattach;
	}
	public void setInstructionattach(String instructionattach) {
		this.instructionattach = instructionattach;
	}
	public String getDue_date() {
		return due_date;
	}
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}
	public String getCompletion_date() {
		return completion_date;
	}
	public void setCompletion_date(String completion_date) {
		this.completion_date = completion_date;
	}
	public String getCompleted_by() {
		return completed_by;
	}
	public void setCompleted_by(String completed_by) {
		this.completed_by = completed_by;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}

	
	
}