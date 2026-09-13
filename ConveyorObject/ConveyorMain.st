FUNCTION_BLOCK ConveyorMain
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
    // Данные конвейера (каталог объекта)
    data: ConveyorType;
    // Алгоритмический блок обработки конвейера
    conveyor: Conveyor;
    // Блок сопряжения с аппаратурой
    hard: Hardware;
END_VAR

// ============================================
// Технологический объект конвейер
// ============================================

// Циклическое выполнение алгоритма
conveyor(Data := data);

// Подключение блока хардвер
hard(SensorA := GVL.DI_SensorA, ComMotor => GVL.DO_ComMotor, Data := data);
