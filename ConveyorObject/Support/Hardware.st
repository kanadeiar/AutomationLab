FUNCTION_BLOCK Hardware
VAR_INPUT
    // Показания с датчика в начале конвейера
    SensorA: BOOL;
    // Показания с датчика в конце конвейера
    SensorB: BOOL;
END_VAR
VAR_OUTPUT
    // Команда на двигатель конвейера
    ComMotor: BOOL;
END_VAR
VAR_IN_OUT
    Data: ConveyorType;
END_VAR

// ============================================
// БЛОК СОПРЯЖЕНИЯ С АППАРАТУРОЙ (ЖЕЛЕЗО)
// ============================================

// Запись в структуру данных с датчиков (НЗ — инвертируется)
Data.BoxOnStartPosition := NOT SensorA;
Data.BoxOnEndPosition := NOT SensorB;

// Запись команды на двигатель из решения устройства
ComMotor := Data.ComRotateBelt;