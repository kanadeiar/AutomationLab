FUNCTION_BLOCK Conveyer_HardwareIn_FB
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR_IN_OUT
    Data: DT_Conveyer;
END_VAR
VAR
    sensorDebounce: TON;
END_VAR

// ВХОД: чтение оптического датчика (нормально замкнутого) с антидребезгом.
// Нет коробки — цепь замкнута (TRUE), коробка обнаружена — цепь разомкнута (FALSE).
// Инвертируем для получения логического состояния "коробка на конце".
sensorDebounce(IN := NOT GVL.DI_SensorA, PT := T#50ms);
Data.BoxOnEndPosition := sensorDebounce.Q;