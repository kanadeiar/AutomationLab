FUNCTION_BLOCK Conveyer1
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR_IN_OUT
	Data: ConveyorType;
END_VAR



Data.ComRotateBelt := (Data.BoxOnStartPosition OR Data.ComRotateBelt) AND NOT Data.BoxOnEndPosition;
