FUNCTION_BLOCK Conveyer_HardwareOut_FB
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR_IN_OUT
    Data: DT_Conveyer;
END_VAR

// ВЫХОД: запись команды двигателя в глобальную переменную
GVL.DO_ComMotor := Data.ComRotateLent;