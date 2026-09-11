FUNCTION_BLOCK Conveyer
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
END_VAR
VAR_IN_OUT
	Data: ConveyerType;
END_VAR

Data.ComRotateLent := AlwaysOn(Allow:= NOT Data.BoxOnEndPosition);