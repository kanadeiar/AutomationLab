FUNCTION_BLOCK Main
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
    // Данные конвейера (каталог объекта)
    data: ConveyerType;
    // Алгоритмический блок обработки конвейера
    conveyer: Conveyer;
    // Блок сопряжения с аппаратурой
    hard: Hardware;
END_VAR

// ============================================
// Технологический объект конвейер
// ============================================

// Циклическое выполнение алгоритма
conv(Data := data);

// Подключение блока хардвар
hard(SensorA:= GVL.DI_SensorA, ComMotor=> GVL.DO_ComMotor, Data:= data);

