// ============================================
// ФУНКЦИОНАЛЬНЫЙ БЛОК — конвейер
// ============================================
FUNCTION_BLOCK Conveyer_Main
VAR_INPUT
END_VAR

VAR_OUTPUT
END_VAR

VAR
    conveyerData: ConveyerType; // данные конвейера
    conveyer: Conveyer1; // блок управления конвейером
    hard: G_Hardware; // обмен с аппаратурой
    inter: G_Interface; // сопряжение с лампой оператора
END_VAR

BEGIN
    // обмен с аппаратурой — чтение GVL → ConveyerData, ConveyerData → запись в GVL
    hard(
        ConveyerData := conveyerData
    );

    // вызов блока управления конвейером
    conveyer(
        SensorA := conveyerData.SensorA,
        RotateLent => conveyerData.ComRotateLent
    );

    // сопряжение с лампой оператора — ConveyerData → GVL HMI
    inter(
        ConveyerData := conveyerData
    );

END_FUNCTION_BLOCK