FUNCTION_BLOCK Conveyer_Hardware_FB
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR_IN_OUT
    Data: ConveyerType;
END_VAR

// Датчик оптический, нормально замкнутый:
// нет коробки — цепь замкнута (TRUE), коробка обнаружена — цепь разомкнута (FALSE)
// Инвертируем для получения логического состояния "коробка на конце"
Data.BoxOnEndPosition := NOT GVL.DI_SensorA;

// Запись команды двигателя в глобальную переменную
GVL.DO_ComMotor := Data.ComRotateLent;


