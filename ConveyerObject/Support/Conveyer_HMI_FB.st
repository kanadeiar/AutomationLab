FUNCTION_BLOCK Conveyer_HMI_FB
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR_IN_OUT
    Data: ConveyerType;
END_VAR

// Сигнализация работы конвейера — лампа для оператора
GVL.DO_LampWork := Data.ComRotateLent;
