// ============================================
// ФУНКЦИОНАЛЬНЫЙ БЛОК — обмен с аппаратурой
// Маппинг GVL physical I/O ↔ ConveyerData
// ============================================
FUNCTION_BLOCK G_Hardware
VAR_INPUT
END_VAR

VAR_OUTPUT
END_VAR

VAR_IN_OUT
    ConveyerData: ConveyerType; // данные конвейера
END_VAR

BEGIN
    // чтение физического сигнала датчика → данные конвейера
    ConveyerData.SensorA := GVL.DI_Sensor1;
    // команда вращения из данных конвейера → физический выход
    GVL.DO_ComMotor1 := ConveyerData.ComRotateLent;

END_FUNCTION_BLOCK
