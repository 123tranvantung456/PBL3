package com.pbl3.model;

public class TypeQuestionModel {
	int typeQuestionID;
	String typeQuestionName;
    int PartID;
    PartModel partModel;
    
	public TypeQuestionModel(int typeQuestionID, String typeQuestionName, int partID, PartModel partModel) {
		super();
		this.typeQuestionID = typeQuestionID;
		this.typeQuestionName = typeQuestionName;
		PartID = partID;
		this.partModel = partModel;
	}
	
	public TypeQuestionModel(int typeQuestionID, String typeQuestionName, int partID) {
		super();
		this.typeQuestionID = typeQuestionID;
		this.typeQuestionName = typeQuestionName;
		PartID = partID;
	}

	public int getTypeQuestionID() {
		return typeQuestionID;
	}

	public void setTypeQuestionID(int typeQuestionID) {
		this.typeQuestionID = typeQuestionID;
	}

	public String getTypeQuestionName() {
		return typeQuestionName;
	}

	public void setTypeQuestionName(String typeQuestionName) {
		this.typeQuestionName = typeQuestionName;
	}

	public int getPartID() {
		return PartID;
	}

	public void setPartID(int partID) {
		PartID = partID;
	}

	public PartModel getPartModel() {
		return partModel;
	}

	public void setPartModel(PartModel partModel) {
		this.partModel = partModel;
	}
}