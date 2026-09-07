// ============================================
// ФУНКЦИОНАЛЬНЫЙ БЛОК — сопряжение с лампой оператора
// Маппинг ConveyerData ↔ GVL HMI
// ============================================
FUNCTION_BLOCK G_Interface
VAR_INPUT
END_VAR

VAR_OUTPUT
END_VAR

VAR_IN_OUT
    ConveyerData: ConveyerType; // данные конвейера
END_VAR

BEGIN
    // состояние конвейера → лампа на панели оператора
    GVL.DO_Lamp := ConveyerData.ComRotateLent;

END_FUNCTION_BLOCK
