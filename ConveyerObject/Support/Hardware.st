FUNCTION_BLOCK Hardware
VAR_INPUT
	SensorA: BOOL;
END_VAR
VAR_OUTPUT
	ComMotor: BOOL;
END_VAR
VAR_IN_OUT
    Data: ConveyerType;	
END_VAR


// Датчик оптический, нормально замкнутый:
// нет коробки — цепь замкнута (TRUE), коробка обнаружена — цепь разомкнута (FALSE)
// Инвертируем для получения логического состояния "коробка на конце"
Data.BoxOnEndPosition := NOT SensorA;

// Запись команды двигателя
ComMotor := Data.ComRotateLent;