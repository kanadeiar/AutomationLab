FUNCTION_BLOCK Conveyor
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
END_VAR
VAR_IN_OUT
	Data: ConveyorType;
END_VAR

Data.ComRotateBelt := AlwaysOn(Allow := NOT Data.BoxOnEndPosition);