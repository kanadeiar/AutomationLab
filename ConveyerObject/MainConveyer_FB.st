FUNCTION_BLOCK MainConveyer_FB
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
    // Данные конвейера (каталог объекта)
    data: DT_Conveyer;
    // Алгоритмический блок обработки конвейера
    conveyer: Conveyer_FB;
    // Блок сопряжения с аппаратурой (вход: чтение датчика)
    hardwareIn: Conveyer_HardwareIn_FB;
    // Блок сопряжения с аппаратурой (выход: запись на двигатель)
    hardwareOut: Conveyer_HardwareOut_FB;
    // Блок интерфейса пульта оператора
    hmi: Conveyer_HMI_FB;
END_VAR

// 1. Вход: чтение датчика и обновление Data.BoxOnEndPosition
hardwareIn(Data := data);

// 2. Логика: вычисление команды Data.ComRotateLent
conveyer(Data := data);

// 3. Выход: запись команды на двигатель
hardwareOut(Data := data);

// 4. Интерфейс: индикация работы лампой
hmi(Data := data);